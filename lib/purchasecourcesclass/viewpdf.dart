// ignore_for_file: must_be_immutable, library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';

import 'circularindicator.dart';

class DocumentView extends StatefulWidget {
  DocumentView({super.key, required this.apptitle, required this.pdfUrl});
  String apptitle;
  String pdfUrl;
  @override
  _DocumentViewState createState() => _DocumentViewState();
}

class _DocumentViewState extends State<DocumentView> {
  bool isLoading = true;
  late String localPath;
  @override
  void initState() {
    super.initState();
    // screenshot();
    downloadFile();
  }

  Future<void> downloadFile() async {
    final response = await http.get(Uri.parse(widget.pdfUrl));
    final documentDirectory = await Directory.systemTemp.createTemp();
    final file = File("${documentDirectory.path}/document.pdf");

    await file.writeAsBytes(response.bodyBytes);

    if (mounted) {
      setState(() {
        localPath = file.path;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          // leading: back(context),
          title: Text(
            widget.apptitle,
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
          )),
      body: Stack(
        children: [
          isLoading
              ? circularIndicator()
              : PDFView(
                  filePath: localPath,
                  autoSpacing: true,
                  pageFling: true,
                  pageSnap: true,
                  // swipeHorizontal: true,
                  onError: (error) {
                    print(error);
                  },
                )
        ],
      ),
    );
  }
}
