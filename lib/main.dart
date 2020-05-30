import 'package:dnaenc/dna+rns+otp.dart';
import 'package:dnaenc/dna+rns.dart';
import 'package:flutter/material.dart';

import 'dna.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd7d7d7),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 180,
              width: 300,
              child: FittedBox(
                child: Image.asset('assets/images/logo.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(height: 30,),
            Text('DNA Encryption', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            SizedBox(height: 20,),
            FlatButton(
              color: Colors.brown,
              child: Text('DNA', style: TextStyle(color: Colors.white),),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => DnaPage(),
                ));
              },
            ),
            SizedBox(height: 10,),
            FlatButton(
              color: Colors.brown,
              child: Text('DNA + RNS', style: TextStyle(color: Colors.white),),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => DnaRnsPage(),
                ));
              },
            ),
            SizedBox(height: 10,),
            FlatButton(
              color: Colors.brown,
              child: Text('DNA + RNS + KEY', style: TextStyle(color: Colors.white),),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => DnaRnsOtpPage(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}