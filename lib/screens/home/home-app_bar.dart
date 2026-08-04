import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu, size: 28, color: Colors.black),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Good Morning",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                SizedBox(height: 4),
                Text(
                  "Hello, Humaira 👋",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            /// Profile Picture
            GestureDetector(
              onTap: () {
                // Navigate to profile
              },
              child: const CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage("assets/images/login.png"),
                // If no image:
                // child: Icon(Icons.person),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
