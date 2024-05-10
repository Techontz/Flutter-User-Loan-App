import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../models/Deposits.dart';
import '../../../models/Loans.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate total amount for "Mikopo Yangu" category
    String mikopoTotalAmount = calculateMikopoTotalAmount();

    List<Map<String, dynamic>> categories = [
      {
        "icon": "assets/icons/Cash.svg",
        "text": "Fedha Zote",
        "color": Colors.greenAccent, // Green color for this category
        "totalAmount": calculateTotalAmount(), // Calculate total amount for "Fedha Zote"
      },
      {
        "icon": "assets/icons/Cash.svg",
        "text": "Mikopo Yangu",
        "color": const Color(0xFFFFECDF), // Default color for other categories
        "totalAmount": mikopoTotalAmount,
      },
    ];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
              (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            amount: categories[index]["totalAmount"],
            backgroundColor: categories[index]["color"],
            press: () {},
          ),
        ),
      ),
    );
  }

  String calculateTotalAmount() {
    int totalAmount = 0;
    for (var deposit in demoDeposits) {
      totalAmount += int.parse(deposit.amount.replaceAll('Tsh', '').replaceAll(',', ''));
    }
    return "Tsh$totalAmount";
  }

  String calculateMikopoTotalAmount() {
    int mikopoTotalAmount = 0;
    for (var loan in demoLoans) {
      mikopoTotalAmount += int.parse(loan.amount.replaceAll('Tsh', '').replaceAll(',', ''));
    }
    return "Tsh$mikopoTotalAmount";
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.amount,
    required this.backgroundColor,
    required this.press,
  }) : super(key: key);

  final String icon, text, amount;
  final Color backgroundColor;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 56,
            width: 180,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(icon),
                const SizedBox(width: 8), // Adjust spacing between icon and text
                Text(
                  amount,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: backgroundColor == Colors.green ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
