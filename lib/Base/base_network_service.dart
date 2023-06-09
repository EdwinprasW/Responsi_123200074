import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';


class MealsApi {
  static final String baseUrl =
      "https://www.themealdb.com/api/json/v1/1"; // API nya

  // get() untuk request isi dari API dari baseUrl dan hasil respon akan dikirim
  // ke method _processResponse() dengan parameter response
  static Future<Map<String, dynamic>> get(String partUrl) async {
    final String fullUrl = baseUrl + partUrl;

    debugPrint("BaseNetwork - fullUrl : $fullUrl");

    final response = await http.get(Uri.parse(fullUrl));

    debugPrint("BaseNetwork - response : ${response.body}");

    return _processResponse(response);
  }

  // untuk mengecek isi dari response yang sekarang berbentuk .json
  static Future<Map<String, dynamic>> _processResponse(
      http.Response response) async {
    final body = response.body;
    if (body.isNotEmpty) {
      final jsonBody = json.decode(body);
      return jsonBody;
    } else {
      print("processResponse error");
      return {"error": true};
    }
  }

  // untuk menuliskan hasil debug ke console.
  static void debugPrint(String value) {
    print("[BASE_NETWORK] - $value");
  }
}