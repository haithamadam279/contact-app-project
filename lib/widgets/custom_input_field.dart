import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CustomInputField extends StatelessWidget {
  final String hint;
  final Function(String) onChanged;

  const CustomInputField({
    super.key,
    required this.hint,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: SizedBox(
        height: 65.0,
        child: TextField(
          style: const TextStyle(
            color: AppColors.borderColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: AppColors.hintColor,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            filled: false,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  const BorderSide(color: AppColors.borderColor, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  const BorderSide(color: AppColors.borderColor, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  const BorderSide(color: AppColors.borderColor, width: 1.5),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
