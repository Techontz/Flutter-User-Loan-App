import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Import Cupertino widgets if needed
import '../../constants.dart';
import 'components/LoanRequestPage.dart';
import 'components/RecentLoanWidget.dart';
import 'components/image_display.dart';
import 'components/mikopo_header.dart';
import 'components/recent_loans.dart';

class MikopoScreen extends StatelessWidget {
  const MikopoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              MikopoHeader(),
              ImageDisplay(),
              RecentLoans(),
              RecentLoanWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _requestLoan(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.greenAccent, // Set the background color here
      ),
    );
  }

  void _requestLoan(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoanRequestPage()),
    );
  }
}
