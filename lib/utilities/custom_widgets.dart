import 'package:flutter/material.dart';

InputDecoration MyInputDecoration1({labelText, hintText}){
  return InputDecoration(
    labelText: labelText ?? "",
    labelStyle: const TextStyle(
      color: Colors.green, // Label text color
      fontSize: 16,
    ),
    hintText: hintText ?? "",
    hintStyle: const TextStyle(
        color: Colors.grey), // Hint text color
    enabledBorder: OutlineInputBorder(
      borderRadius:
      BorderRadius.circular(5), // Rounded border
      borderSide: const BorderSide(
        color: Colors
            .greenAccent, // Border color when not focused
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius:
      BorderRadius.circular(5), // Rounded border
      borderSide: const BorderSide(
        color: Colors.green, // Border color when focused
        width: 2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(
        color: Colors.red, // Border color on error
        width: 2,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors
            .redAccent, // Border color on focused error
        width: 2,
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 12.0,
    ), // Inner padding
    filled: true,
    fillColor: Colors.green.shade50, // Background color
  );
}