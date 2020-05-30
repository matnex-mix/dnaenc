import 'package:dnaenc/scripts/scripts.dart';
import 'package:dnaenc/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DnaPage extends StatefulWidget {
  @override
  _DnaPageState createState() => _DnaPageState();
}

class _DnaPageState extends State<DnaPage> {
  var plaintext = TextEditingController();
  var ciphertext = TextEditingController();

  final key = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        //key: key,
        appBar: AppBar(
          backgroundColor: Colors.brown,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.lock_outline),
                text: 'Encrypt',
              ),
              Tab(
                icon: Icon(Icons.lock_open),
                text: 'Decrypt',
              ),
            ],
          ),
          title: Text('DNA Encryption'),
        ),
        body: TabBarView(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: <Widget>[
                  Text('Plain Text', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                  SizedBox(height: 15,),
                  Container(
                    height: 270,
                    child: TextField(
                      controller: plaintext,
                      expands: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Message',
                      ),
                      textAlignVertical: TextAlignVertical.top,
                      maxLines: null,
                      autocorrect: true,
                    ),
                  ),
                  SizedBox(height: 20,),
                  FlatButton(
                    color: Colors.brown,
                    child: Text('ENCRYPT', style: TextStyle( color: Colors.white),),
                    onPressed: () async {
                      loadingDialog(context);
                      var time = new DateTime.now().millisecondsSinceEpoch;
                      Future.delayed( Duration(seconds: 1), () async {
                        String result = await Scripts.dnaEncrypt( plaintext.text );

                        Navigator.pop(context);
                        resultDialog(key, context, result, time);
                      });
                    },
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: <Widget>[
                  Text('Cipher Text', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                  SizedBox(height: 15,),
                  Container(
                    height: 270,
                    child: TextField(
                      controller: ciphertext,
                      expands: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Text',
                      ),
                      textAlignVertical: TextAlignVertical.top,
                      maxLines: null,
                      autocorrect: true,
                    ),
                  ),
                  SizedBox(height: 20,),
                  FlatButton(
                    color: Colors.brown,
                    child: Text('DECRYPT', style: TextStyle( color: Colors.white),),
                    onPressed: () async {
                      loadingDialog(context);
                      var time = new DateTime.now().millisecondsSinceEpoch;
                      Future.delayed( Duration(seconds: 1), () async {
                        String result = await Scripts.dnaDecrypt( ciphertext.text );

                        Navigator.pop(context);
                        resultDialog(key, context, result, time);
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  loadingDialog( context ){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context){
        return Center(
          child: Container(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(),
          ),
        );
      }
    );
  }

}