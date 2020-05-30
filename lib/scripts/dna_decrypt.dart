import 'helper.dart';

DNADecrypt( String cipherText ){
  List<String> dnaBases = [];
  List<String> _cipherText = cipherText.split( '' );
  String binJoined = '';

  _cipherText.forEach((element) {
    binJoined = binJoined + Helper.fromDNABase( element );
  });

  List<String> bin = Helper.partition( binJoined, 8 );
  List<int> dec = [];
  String plaintext = '';

  bin.forEach((element) {
    dec.add( int.parse( element, radix: 2 ) );
    plaintext = plaintext + String.fromCharCode( dec.last );
  });

  return plaintext;

}