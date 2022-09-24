import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_from_url/core/domain/entities/app_colors.dart';

class Toast {
  static void showError(String message) {
    _showToast(
      const Key('errorToast'),
      message,
      AppColors.danger,
    );
  }

  static void _showToast(Key? key, String message, Color color) {
    BotToast.showCustomNotification(
      align: Alignment.topCenter,
      duration: const Duration(milliseconds: 3500),
      toastBuilder: (cancel) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            key: key,
            width: double.infinity,
            child: Material(
              color: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              child: ListTile(
                title: Text(
                  message,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
