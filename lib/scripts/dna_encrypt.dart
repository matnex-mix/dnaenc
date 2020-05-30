import 'helper.dart';

DNAEncrypt( String text ){
  int x;

  List<int> dec = [];
  List<String> bin = [];

  for( x=0; x<text.length; x++ ){
    dec.add( text.codeUnitAt(x) );
    bin.add( Helper.pad( dec[x].toRadixString(2) ) );
  }
  String binCompact = bin.join("");
  List<String> dnaBases = Helper.partition( binCompact, 2 );
  String dnaCipher = '';

  dnaBases.forEach((element) {
    dnaCipher = dnaCipher + Helper.toDNABase( element ).toString();
  });

  return dnaCipher;

}