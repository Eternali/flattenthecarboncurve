import 'package:flattenthecarboncurve/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flattenthecarboncurve/screens/welcome_screen.dart';
import 'package:flattenthecarboncurve/routes.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => User(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: WelcomeScreen(),
        // routes: routes,
      ),
    );
  }
}
