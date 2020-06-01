import 'package:flattenthecarboncurve/screens/calculator_screen.dart';
import 'package:flattenthecarboncurve/screens/home_screen.dart';
import 'package:flattenthecarboncurve/screens/welcome_screen.dart';

final routes = {
  '/': (context) => WelcomeScreen(),
  '/calculator': (context) => CalculatorScreen(),
  '/home': (context) => HomeScreen(),
};