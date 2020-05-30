import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart' as crypto;

class Helper {

  static Map<String, String> dnaNucleotides = {
    '00': 'A',
    '01': 'T',
    '10': 'C',
    '11': 'G',
  };

  static String pad( String bin ){
    int i = 8 - bin.length;
    for( int x=0; x<i; x++ ){
      bin = "0" + bin;
    }
    return bin;
  }

  static List<String> partition( String text, int parts ){
    List<String> partitions = [];
    String sess = '';

    for( int x=0; x<text.length; x++ ){
      sess += text[x];

      if( sess.length==parts || x==text.length-1 ){
        partitions.add( sess );
        sess = '';
      }
    }

    return partitions;
  }

  static toDNABase( String bin ){
    return Helper.dnaNucleotides[bin];
  }

  static fromDNABase( String base ){
    return Helper.dnaNucleotides.keys.toList()[ Helper.dnaNucleotides.values.toList().indexOf(base) ];
  }

  static forward( int num, List<int>mods ){
    List<int> red = [];
    for( int x in mods ){
      red.add( num%x );
    }

    return red;
  }

  static backward( List<int> var1, List<int> mods ){
    double res = 0;
    int x = 0;

    int M = 1;
    int V = 1;

    for( x=0; x<mods.length; x++ ){
      mods[x] = mods[x];
      M = M*mods[x];
    }

    for(x in var1){
      V = V*x;
    }

    List Mi = [];

    for(x in mods){
      Mi.add( M/x );
    }

    List Mii = [];
    for( x=0; x<Mi.length; x++ ){
      Mii.add( Helper.lookUp( mods[x], Mi[x] ) );
    }

    for( x=0; x<mods.length; x++ ){
      res = res + ( var1[x] * Mi[x] * Mii[x] );
    }

    return (res%M).toInt();
  }

  static lookUp( var mx, var mi ){
    int x = 1;
    while( true ){
      var t = ( (x*mx) + 1 )/mi;
      int ti = t.ceil();
      if( ti/t==1.0 ){
        return t;
      }

      if(x > 10000){
        break;
      }

      x = x + 1;
    }
  }

  static keyToBin( String key ){
    key = crypto.md5.convert(utf8.encode(key)).toString().substring(0, 15);
    int x;

    List<int> dec = [];
    List<String> bin = [];

    for( x=0; x<key.length; x++ ){
      dec.add( key.codeUnitAt(x) );
      bin.add( Helper.pad( dec[x].toRadixString(2) ) );
    }
    String binCompact = bin.join("");

    return binCompact;
  }

  static addZeros( String text, int count ){
    for( int i=0; i<count; i++ ){
      text = "0" + text;
    }
    return text;
  }

  static xor( String var1, String var2 ){
    int aLen = var1.length;
    int bLen = var2.length;

    if( aLen > bLen ){ 
      var2 = Helper.addZeros( var2, aLen - bLen );
    }
    else if( bLen > aLen ){ 
      var1 = Helper.addZeros( var1, bLen - aLen );
    }

    int lenn = max(aLen, bLen);
    String res = '';
    for( int i=0; i<lenn; i++ ){
      if( var1[i] == var2[i] ){
        res += "0";
      }
      else{
        res += "1";
      }
    }

    return res;
  }

  static String timeDiff( time ){
    double s = (time-1000)/1000;
    String _s = s.toStringAsFixed(2) + 's';
    return _s;
  }

}

/*main(){
 String x = 25679.toRadixString(2);
 String o = 24567.toRadixString(2);
 print( int.parse( Helper.xor( Helper.xor( x, o ), o ), radix: 2 ) );
}*/