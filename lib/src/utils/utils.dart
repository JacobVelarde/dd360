

import 'dart:convert';

import 'package:crypto/crypto.dart';

class Utils{

  static String getHash(String timeStamp, String privateKey, String publicKey){
    return md5.convert(utf8.encode(timeStamp+privateKey+publicKey)).toString();
  }

  static String timeStamp(){
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
}