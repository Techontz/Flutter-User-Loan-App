import 'package:flutter/widgets.dart';
import 'package:loan_user_app/screens/Deposit/deposit_history_screen.dart';
import 'package:loan_user_app/screens/Loan/loan_history_screen.dart';
import 'package:loan_user_app/screens/mikopo/mikopo_screen.dart';
import 'package:loan_user_app/screens/profile/components/my_account_screen.dart';
import 'screens/complete_profile/complete_profile_screen.dart';
import 'screens/forgot_password/forgot_password_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/splash/bottom_navbar.dart';
import 'screens/login_success/login_success_screen.dart';
import 'screens/otp/otp_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/sign_in/sign_in_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'screens/splash/splash_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  BottomNavBarScreen.routeName: (context) => const BottomNavBarScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  DepositHistoryScreen.routeName: (context) => DepositHistoryScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  LoanHistoryScreen.routeName: (context) => LoanHistoryScreen(),
  // MyAccountScreen.routeName: (context) => MyAccountScreen(),
};
