import 'helper.dart';

DNA_RNS_OTPEncrypt( String text, String key ){
  int x;

  List<int> dec = [];
  List<String> bin = [];

  for( x=0; x<text.length; x++ ){
    List<int> r = Helper.forward( text.codeUnitAt(x), [49, 43, 37] );
    dec.addAll( r );
  }

  for( x=0; x<dec.length; x++ ){
    bin.add( Helper.pad( dec[x].toRadixString(2) ) );
  }
  String binCompact = Helper.xor( bin.join(""), Helper.keyToBin(key) );
  List<String> dnaBases = Helper.partition( binCompact, 2 );
  String dnaCipher = '';

  dnaBases.forEach((element) {
    dnaCipher = dnaCipher + Helper.toDNABase( element ).toString();
  });

  return dnaCipher;

}