import 'package:flutter/material.dart';
import 'calculator_screen.dart';
import 'home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}



class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[500],
      body: Column(
        children: [
          Container(
            constraints: BoxConstraints.expand(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
            ),
            decoration:BoxDecoration(color: Colors.green[500]),
            child: Image.asset('trees.jpg', fit: BoxFit.cover,),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width:MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 25.0),
            padding: EdgeInsets.all(35.0),
            decoration: BoxDecoration(
              color: Colors.green[900],
            ),
          child: Text('Welcome to Flatten The Carbon Curve', 
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 50.0)
          ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width:MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(7.0),
            padding: EdgeInsets.all(10.0),
            child: RaisedButton(
              color: Colors.green[200],
              shape:new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
              child: Text('Calcuate Your Carbon Footprint',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                           fontSize: 25.0)),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => CalculatorScreen()),
                );
            }
           ),
          ),
           Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width:MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(7.0),
            padding: EdgeInsets.all(10.0),
            child: RaisedButton(
              color: Colors.green[200],
              shape:new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
              child: Text('Begin Reducing Your CO₂',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25.0)),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => HomeScreen()),
                );
            }
           ),
          ),
        ],
      ),
    );
  }
}
