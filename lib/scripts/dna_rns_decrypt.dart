import 'helper.dart';

DNA_RNSDecrypt( String cipherText ){
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
  });

  List<int> _temp = [];
  List<List<int>> dec3 = [];

  for( int x=0; x<dec.length; x++ ){
    _temp.add( dec[x] );
    if( _temp.length==3 || x==dec.length-1 ){
      dec3.add( _temp );
      _temp = [];

      int o = Helper.backward( dec3.last, [49, 43, 37] );
      plaintext = plaintext + String.fromCharCode( o );
    }
  }

  return plaintext;

}