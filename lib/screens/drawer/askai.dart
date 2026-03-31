import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:practisecorner/utills/custom_colors.dart';

class AskAiScreen extends StatefulWidget {
  const AskAiScreen({super.key});

  @override
  State<AskAiScreen> createState() => _AskAiScreenState();
}

class _AskAiScreenState extends State<AskAiScreen> {
  final TextEditingController _questionController = TextEditingController();
  String? _aiResponse;
  bool _isLoading = false;
  bool _isProcessingImage = false;
  final ImagePicker _picker = ImagePicker();

  final String apiKey =
      "AIzaSyALlWQpDqVV7rZqrU6bJ23QKhZWjvFadX4"; // Replace with actual API key

  Future<void> _openCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      await _extractTextFromImage(File(image.path));
    }
  }

  Future<void> _extractTextFromImage(File imageFile) async {
    setState(() {
      _isProcessingImage = true;
      _aiResponse = null;
    });

    final textRecognizer = TextRecognizer();
    final inputImage = InputImage.fromFile(imageFile);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    await textRecognizer.close();

    if (recognizedText.text.isNotEmpty) {
      await _generateAnswer(recognizedText.text); // Send text directly to AI
    } else {
      setState(() {
        _aiResponse = "No text found in the image.";
        _isProcessingImage = false;
      });
    }
  }

  Future<void> _generateAnswer(String inputText) async {
    if (inputText.isEmpty) return;

    setState(() {
      _isLoading = true;
      _aiResponse = null;
    });

    const String apiUrl =
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent";

    try {
      final response = await http.post(
        Uri.parse("$apiUrl?key=$apiKey"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": inputText}
              ]
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        setState(() {
          _aiResponse = data["candidates"]?[0]?["content"]?["parts"]?[0]
                  ?["text"] ??
              "No response from AI.";
        });
      } else {
        setState(() {
          _aiResponse = "Error: ${response.statusCode} - ${response.body}";
        });
      }
    } catch (e) {
      setState(() {
        _aiResponse = "Network Error: $e";
      });
    }

    setState(() {
      _isLoading = false;
      _isProcessingImage = false;
    });
  }

  void _resetScreen() {
    setState(() {
      _questionController.clear();
      _aiResponse = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title:
            const Text("Ask AI", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: CustomColors.primary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _resetScreen,
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Center(
            child: Text(
              "Welcome to AI! Type your question or take a picture.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: _isProcessingImage
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10),
                        Text("Processing image..."),
                      ],
                    ),
                  )
                : _aiResponse != null
                    ? SingleChildScrollView(
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Text(
                            _aiResponse!,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.camera_alt,
                      color: Colors.blue, size: 30),
                  onPressed: _openCamera,
                ),
                Expanded(
                  child: TextField(
                    controller: _questionController,
                    decoration: InputDecoration(
                      hintText: "Type your question...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: CustomColors.primary.withOpacity(0.1),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: _isLoading
                      ? const CircularProgressIndicator()
                      : const Icon(Icons.send, color: Colors.blue, size: 30),
                  onPressed: _isLoading
                      ? null
                      : () => _generateAnswer(_questionController.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
