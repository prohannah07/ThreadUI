import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchQueries extends ChangeNotifier {
  var query = {"searchQuery": "dynamite"};
  Future<List<dynamic>> response;

  changeQuery(String newQuery) {
    query["searchQuery"] = newQuery;

    notifyListeners();
  }

  changeResponse(res){
    response = res;
    notifyListeners();
  }

  final String apiUrl = "http://10.0.2.2:8080/twitter/search?q=";

  Future<List<dynamic>> fetchUsers(q) async {
    var result = await http.get(apiUrl + q);

    if (result.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print("status is 200! yeet");
      // print(result.body);
      // return Album.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
    response = json.decode(result.body);
    return json.decode(result.body);
  }
}
