import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../notifications/notification_screen.dart';
import 'icon_btn_with_counter.dart';
import 'intro_text.dart';

class HomeHeader extends StatelessWidget {
  final String? username; // Make the username optional

  const HomeHeader({
    Key? key,
    this.username, // Provide a default value of null
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                username != null ? "Hello, $username" : "Hello, Guest",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3,
            press: () {
              // Navigate to the notification screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
