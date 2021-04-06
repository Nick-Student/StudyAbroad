import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyApi {
  Future <double> getRate(String from, String to) async {
    final Uri rateUrl = Uri.https (
      "free.currconv.com",
        "/api/v7/convert",
        {"apiKey" : "be9beaed80e257afd7ab",
          "q" : "${from}_${to}",
          "compact": "ultra"
        });

    http.Response res = await http.get(rateUrl);
    if(res.statusCode == 200) {
      var body = jsonDecode(res.body);
      return body["${from}_${to}"];
    }
    else {
      throw Exception("Failed to connect to API.");
    }
  }
}
