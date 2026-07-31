import 'package:flutter/material.dart';

import '../core/theme/app_text_styles.dart';

class OutlineButtonWidget extends StatelessWidget {
  const OutlineButtonWidget({
    super.key,
    required this.text,
    this.imagePath,
    required this.onTap,
    this.textColor = Colors.black87,
    this.icon,
    this.iconColor,
  });
  final String text;
  final String? imagePath;
  final VoidCallback onTap;
  final Color textColor;
  final IconData? icon;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath != null)
              Image.asset(imagePath!, height: 20)
            else if (icon != null)
              Icon(icon, size: 20, color: iconColor ?? textColor),
            const SizedBox(width: 10),
            Text(text, style: fourteen600TextStyle(color: textColor)),
          ],
        ),
      ),
    );
  }
}
