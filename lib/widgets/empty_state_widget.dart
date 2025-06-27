import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../constants/app_colors.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset('assets/animations/empty_list.json', height: 200),
          const SizedBox(height: 16),
          const Text(
            'There is No Contacts Added Here',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.borderColor,
              fontFamily: 'Inter',
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
