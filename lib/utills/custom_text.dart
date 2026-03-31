import 'package:flutter/material.dart';
import 'package:practisecorner/utills/custom_colors.dart';

TextFormField customTextField({
  TextEditingController? controller,
  int? maxLength,
  int? minLines,
  int? maxLines,
  String? hintText,
  TextInputType? keyboardType,
  Widget? prefixIcon, // Added prefixIcon
  Widget? suffixIcon, // Added suffixIcon
  VoidCallback? onSuffixIconPressed, // Added callback for suffix icon press
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    maxLines: maxLines,
    maxLength: maxLength,
    minLines: minLines,
    cursorColor: Colors.black,
    style: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      counterText: "",
      hintText: hintText,
      prefixIcon: prefixIcon, // Set the prefix icon
      suffixIcon: suffixIcon != null
          ? IconButton(
              onPressed: onSuffixIconPressed, // Trigger the callback on click
              icon: suffixIcon,
            )
          : null, // Set the suffix icon if provided
      hintStyle: TextStyle(
        color: Colors.black.withOpacity(0.7),
        fontWeight: FontWeight.w300,
        fontSize: 15,
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}

Padding customTextFieldFrofile({
  TextEditingController? controller,
  int? maxLength,
  int? maxLines,
  String? hintText,
  TextInputType? keyboardType,
  Widget? prefixIcon, // Added prefixIcon
  Widget? suffixIcon, // Added suffixIcon
  VoidCallback? onSuffixIconPressed, // Added callback for suffix icon press
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText!,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontFamily: 'sc',
          ),
        ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLength: maxLength,
          cursorColor: Colors.black,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            counterText: "",
            hintText: hintText,
            prefixIcon: prefixIcon, // Set the prefix icon
            suffixIcon: suffixIcon != null
                ? IconButton(
                    onPressed:
                        onSuffixIconPressed, // Trigger the callback on click
                    icon: suffixIcon,
                  )
                : null, // Set the suffix icon if provided
            hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontWeight: FontWeight.w300,
              fontFamily: 'sc',
              fontSize: 15,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors.primary),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors.primary),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors.primary),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors.primary),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors.primary),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    ),
  );
}

TextFormField customSearchBar({
  TextEditingController? controller,
  int? maxLength,
  String? hintText,
  void Function(String)? onChanged,
  TextInputType? keyboardType,
  Widget? prefixIcon, // Added prefixIcon
  Widget? suffixIcon, // Added suffixIcon
  VoidCallback? onSuffixIconPressed, // Added callback for suffix icon press
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    maxLength: maxLength,
    cursorColor: Colors.black,
    style: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      counterText: "",
      hintText: hintText,
      prefixIcon: prefixIcon, // Set the prefix icon
      suffixIcon: suffixIcon != null
          ? IconButton(
              onPressed: onSuffixIconPressed, // Trigger the callback on click
              icon: suffixIcon,
            )
          : null, // Set the suffix icon if provided
      hintStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w300,
        fontSize: 15,
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(8),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    onChanged: onChanged,
  );
}
