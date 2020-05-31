import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Text(
              'Welcome!',
              style: theme.textTheme.headline3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Text('How often do you take a plane a year?'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NeumorphicRadio(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('Never'),
                ),
              ),
              NeumorphicRadio(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('A few times'),
                ),
              ),
              NeumorphicRadio(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('I fly a lot'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}