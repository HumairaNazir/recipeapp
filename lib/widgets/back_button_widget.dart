import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  final String? imagePath;
  final VoidCallback? onTap;
  final IconData? icon;
  const BackButtonWidget({super.key, this.imagePath, this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: imagePath != null
              ? Image.asset(imagePath!, height: 20, width: 20)
              : Icon(icon ?? Icons.arrow_back, color: Colors.white, size: 22),
        ),
      ),
    );
  }
}
