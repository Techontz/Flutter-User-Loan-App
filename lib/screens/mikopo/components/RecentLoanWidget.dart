import 'package:flutter/material.dart';
import 'package:loan_user_app/models/Loans.dart';

class RecentLoanWidget extends StatelessWidget {
  const RecentLoanWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: demoLoans.isNotEmpty ? (demoLoans.length > 3 ? 3 : demoLoans.length) : 0,
      itemBuilder: (context, index) {
        final loan = demoLoans[index];
        return GestureDetector(
          onTap: () {
            _showLoanHistory(context, loan);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[100],
              ),
              child: ListTile(
                leading: Icon(
                  loan.isSuccess ? Icons.check_circle : Icons.error,
                  color: loan.isSuccess ? Colors.green : Colors.red,
                ),
                title: Text("Amount: ${loan.amount}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("History: ${loan.history}"),
                    Text("Account Number: ${loan.accountNumber}"),
                    Text("Date: ${loan.date}"),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showLoanHistory(BuildContext context, Loans loan) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Loan History"),
          content: Text(loan.history),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
