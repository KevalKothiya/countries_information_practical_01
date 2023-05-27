import 'dart:convert';

import 'package:info/models/globals.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();

  static ApiHelper apiHelper = ApiHelper._();

  Future<List<Info>?> fetchdata() async {
    String url = "https://restcountries.com/v3.1/all";

    http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      List decodedData = jsonDecode(res.body);

      List<Info> info = (decodedData
          .map((e) => Info.formMap(
              common: e['name']['common'],
              population: e['population'],
              capital: e['capital'] ?? [],
              languages: e['languages'] ?? {}))
          .toList());
      return info;
    } else {
      return null;
    }
  }
}
