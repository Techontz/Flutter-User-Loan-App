import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for input formatters

class LoanRequestPage extends StatefulWidget {
  const LoanRequestPage({Key? key}) : super(key: key);

  @override
  _LoanRequestPageState createState() => _LoanRequestPageState();
}

class _LoanRequestPageState extends State<LoanRequestPage> {
  final _loanAmountController = TextEditingController();
  String? _loanPurpose;
  String? _selectedDuration;

  Map<int, String> _loanDurationMap = {
    10000: '2 weeks',
    100001: '1 month',
    500001: '2 months',
    1000001: '6 months',
  };

  double getInterestRate() => 0.20; // 20% interest rate

  @override
  void dispose() {
    _loanAmountController.dispose();
    super.dispose();
  }

  double calculateTotalReturn(int loanAmount) {
    double interestRate = getInterestRate();
    return loanAmount + (loanAmount * interestRate);
  }

  void updateSelectedDuration(int loanAmount) {
    _loanDurationMap.forEach((key, value) {
      if (loanAmount >= key) {
        setState(() {
          _selectedDuration = value;
        });
      }
    });
  }

  String? validateLoanAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the loan amount';
    }
    final amount = int.tryParse(value);
    if (amount == null || amount < 10000 || amount > 10000000 || value.length > 8) {
      return 'Loan amount must be between 10,000 and 10,000,000 and should not exceed 8 digits';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Loan Request",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _loanAmountController,
                decoration: InputDecoration(
                  labelText: "Loan Amount",
                  hintText: "Enter amount",
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(8), // Limit input to 7 digits
                  FilteringTextInputFormatter.digitsOnly, // Allow only digits
                ],
                validator: validateLoanAmount,
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) {
                      int loanAmount = int.parse(value);
                      updateSelectedDuration(loanAmount);
                    } else {
                      _selectedDuration = null;
                    }
                  });
                },
              ),
              SizedBox(height: 16),
              if (_selectedDuration != null)
                Text(
                  'Selected Loan Duration: $_selectedDuration',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              SizedBox(height: 30),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _loanPurpose = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Loan Purpose",
                  hintText: "Enter purpose (optional)",
                ),
                // Remove validator for loan purpose to make it optional
              ),
              SizedBox(height: 16),
              if (_loanAmountController.text.isNotEmpty)
                Text(
                  'Total Return with 20% Interest: \Tsh${calculateTotalReturn(int.parse(_loanAmountController.text)).toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_loanAmountController.text.isNotEmpty &&
                      _selectedDuration != null) {
                    int amount = int.parse(_loanAmountController.text);
                    String purpose = _loanPurpose ?? ''; // Use empty string if purpose is null
                    String duration = _selectedDuration!;
                    print('Loan Amount: $amount');
                    print('Loan Duration: $duration');
                    print('Loan Purpose: $purpose');
                    // Add logic to submit the loan request
                  }
                },
                child: Text("Submit Request"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoanRequestPage(),
  ));
}
