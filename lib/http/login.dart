import 'dart:io';

import 'package:http/http.dart' as http;

class HTTPEndPoint {
  HTTPEndPoint._();

  static Future<void> login() async {
    try {
      var url1 = Uri.parse("https://swapi.info/api/films");

      var res = await http.get(url1);
      print(res.body);
    } on SocketException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    
    }
  }
}
