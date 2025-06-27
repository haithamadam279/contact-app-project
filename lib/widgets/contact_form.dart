import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/contact.dart';
import '../constants/app_colors.dart';
import 'custom_input_field.dart';

class ContactForm extends StatefulWidget {
  final Function(Contact) onSave;

  const ContactForm({super.key, required this.onSave});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  String name = "";
  String email = "";
  String phone = "";
  File? image;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        left: 20,
        right: 20,
        top: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildImageAndPreview(),
          const SizedBox(height: 16),
          CustomInputField(
            hint: "Enter User Name",
            onChanged: (val) => setState(() => name = val),
          ),
          CustomInputField(
            hint: "Enter User Email",
            onChanged: (val) => setState(() => email = val),
          ),
          CustomInputField(
            hint: "Enter User Phone",
            onChanged: (val) => setState(() => phone = val),
          ),
          const SizedBox(height: 10),
          _buildSaveButton(),
        ],
      ),
    );
  }

  Widget _buildImageAndPreview() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            width: 143,
            height: 146,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.borderColor, width: 1.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: image != null
                  ? Image.file(image!, fit: BoxFit.cover)
                  : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        'assets/animations/add_image.gif',
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPreviewText(name.isEmpty ? "User Name" : name),
              const Divider(color: AppColors.hintColor, thickness: 0.5),
              _buildPreviewText(email.isEmpty ? "example@email.com" : email),
              const Divider(color: AppColors.hintColor, thickness: 0.5),
              _buildPreviewText(phone.isEmpty ? "+200000000000" : phone),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPreviewText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.borderColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
      ),
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      height: 59,
      child: ElevatedButton(
        onPressed: _saveContact,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.borderColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text(
          "Enter user",
          style: TextStyle(
            fontFamily: 'Inter',
            color: AppColors.buttonTextColor,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => image = File(picked.path));
    }
  }

  void _saveContact() {
    if (name.isNotEmpty && email.isNotEmpty && phone.isNotEmpty) {
      final contact = Contact(
        name: name,
        email: email,
        phone: phone,
        image: image,
      );
      widget.onSave(contact);
    }
  }
}
