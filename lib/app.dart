import 'package:flattenthecarboncurve/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flattenthecarboncurve/routes.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<User>(
      create: (_) => User()..load(),
      child: NeumorphicTheme(
        theme: NeumorphicThemeData(
          baseColor: Colors.grey.shade200,
          accentColor: Color(0xff2c21ff),
        ),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.light().copyWith(
            primaryColor: Color(0xff2c21ff),
            scaffoldBackgroundColor: Colors.grey.shade200,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routes: routes,
        ),
      ),
    );
  }
}
