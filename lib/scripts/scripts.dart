import 'package:dnaenc/scripts/dna_decrypt.dart';
import 'package:dnaenc/scripts/dna_encrypt.dart';
import 'package:dnaenc/scripts/dna_rns_decrypt.dart';
import 'package:dnaenc/scripts/dna_rns_encrypt.dart';
import 'package:dnaenc/scripts/dna_rns_otp_decrypt.dart';
import 'package:dnaenc/scripts/dna_rns_otp_encrypt.dart';

class Scripts {

  static dnaEncrypt( String text ) async {
    try {
      return DNAEncrypt(text);
    } catch ( Exception ){
      return 'An error ocurred, please make sure your input is correct';
    }
  }

  static dnaDecrypt( String text ) async {
    try {
      return DNADecrypt(text);
    } catch ( Exception ){
      return 'An error ocurred, please make sure your input is correct';
    }
  }

  static dnaRnsEncrypt( String text ) async {
    try {
      return DNA_RNSEncrypt(text);
    } catch ( Exception ){
      return 'An error ocurred, please make sure your input is correct';
    }
  }

  static dnaRnsDecrypt( String cipher ) async {
    try {
      return DNA_RNSDecrypt( cipher );
    } catch ( Exception ){
      return 'An error ocurred, please make sure your input is correct';
    }
  }

  static dnaRnsOtpEncrypt( String text, String key ) async {
    try {
      return DNA_RNS_OTPEncrypt(text, key);
    } catch ( Exception ){
      return 'An error ocurred, please make sure your input is correct';
    }
  }

  static dnaRnsOtpDecrypt( String text, String key ) async {
    try {
      return DNA_RNS_OTPDecrypt(text, key);
    } catch ( Exception ){
      print( Exception );
      return 'An error ocurred, please make sure your input is correct';
    }
  }

}