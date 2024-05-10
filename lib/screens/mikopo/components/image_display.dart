import 'package:flutter/material.dart';
import '../../../models/Loans.dart';

class ImageDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Calculate total loan amount
    int totalAmount = demoLoans
        .map((loan) => int.parse(loan.amount.replaceAll('Tsh', '').replaceAll(',', '')))
        .reduce((value, element) => value + element);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/demo1.png',
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            Positioned(
              top: 20,
              left: 16,
              child: Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Total Loan',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 55,
              left: 16,
              child: Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Jumla kuu',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 80,
              left: 16,
              child: Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Tsh. ${totalAmount.toStringAsFixed(2)}', // Display total amount dynamically
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 145,
              left: 16,
              child: Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Amount Paid',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 110,
              left: 16,
              child: Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Jumla kuu',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 80,
              left: 16,
              child: Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Tsh. 32,000.00', // Placeholder text, replace with actual data if needed
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
