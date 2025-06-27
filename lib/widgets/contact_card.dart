import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../constants/app_colors.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;
  final VoidCallback onDelete;

  const ContactCard({
    super.key,
    required this.contact,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Remove fixed width - let parent control sizing
      constraints: const BoxConstraints(
        minWidth: 180,
        maxWidth: 250,
      ),
      decoration: BoxDecoration(
        color: AppColors.borderColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: IntrinsicHeight(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                color: Colors.grey[300],
              ),
              child: Stack(
                children: [
                  // Image
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: contact.image != null
                        ? ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            child: Image.file(
                              contact.image!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.broken_image,
                                      size: 50,
                                      color: Colors.grey,
                                    ),
                                  ),
                                );
                              },
                              // Optimize memory usage
                              cacheWidth: 200,
                              cacheHeight: 120,
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                  ),
                  Positioned(
                    bottom: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.borderColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        contact.name,
                        style: const TextStyle(
                          color: AppColors.appBarAndBgColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Email row
                    Row(
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          child: const Icon(
                            Icons.email_outlined,
                            size: 16,
                            color: AppColors.modalBackgroundColor,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            contact.email,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Color(0xFF29384D),
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter',
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1, // Ensure single line
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Phone row
                    Row(
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          child: const Icon(Icons.phone_in_talk_sharp,
                              size: 20, color: AppColors.modalBackgroundColor),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            contact.phone,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Color(0xFF29384D),
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter',
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1, // Ensure single line
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    // Delete button
                    SizedBox(
                      width: double.infinity,
                      height: 31,
                      child: ElevatedButton.icon(
                        onPressed: onDelete,
                        icon: const Icon(
                          Icons.delete,
                          size: 16,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Delete',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.deleteButton, // Red color
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
