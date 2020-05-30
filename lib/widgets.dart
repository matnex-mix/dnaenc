import 'package:dnaenc/scripts/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

resultDialog( key, context, text, time ){
                      
  String _time = Helper.timeDiff( (new DateTime.now().millisecondsSinceEpoch) - time );
  String _length = (text.length/1024).toStringAsFixed(2)+'KB';
  
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context){
      return Scaffold(
        key: key,
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(20),
            height: 380,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.limeAccent,
                      border: Border.all( color: Color(0xff444444), ),
                      borderRadius: BorderRadius.all( Radius.circular(10) ),
                    ),
                    child: SingleChildScrollView(
                      child: Text( text ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text( 'Memory Size: $_length' ),
                        Text( 'Execution Time: $_time' ),
                      ],
                    ),
                    Expanded(child: Container()),
                    FlatButton(
                      color: Colors.red,
                      child: Text( 'CLOSE', style: TextStyle( color: Colors.white ),),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 10,),
                    FlatButton(
                      color: Colors.lightBlue,
                      child: Text( 'COPY', style: TextStyle( color: Colors.white ),),
                      onPressed: (){
                        Clipboard.setData(ClipboardData( text: text ));
                        key.currentState.showSnackBar(
                          new SnackBar(content: new Text("Copied to Clipboard"), duration: Duration(seconds: 2),));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  );
}