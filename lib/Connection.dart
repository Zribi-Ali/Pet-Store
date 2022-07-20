import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Connexion {
  Future<List> fetchPets() async {
    final response = await http.get(
        Uri.parse(
            'https://petstore.swagger.io/v2/pet/findByStatus?status=available&status=pending&status=sold'),
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Credentials": 'true',
          "Access-Control-Allow-Headers":
              "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
          "Access-Control-Allow-Methods": "POST, OPTIONS",
          "Accept": "application/json"
        });
    var converresponse = jsonDecode(response.body);
    return converresponse;
  }

  Future<http.Response> deletePet(int id) async {
    String _id = id.toString();
    final http.Response response = await http.delete(
      Uri.parse('https://petstore.swagger.io/v2/pet/$_id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response;
  }

  Future<http.Response> AddPet(
    String id,
    String name,
    String status,
    /* String category, String tag */
  ) {
    return http.post(
      Uri.parse('https://petstore.swagger.io/v2/pet'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': id,
        'name': name,
        'status': status,
      }),
    );
  }

  Future<http.Response> UpdatePet(
      int id, String name, String status, String category, String tag) {
    return http.put(
      Uri.parse('https://petstore.swagger.io/v2/pet'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'id': id,
        'name': name,
        'status': status,
        "category" "name": category
      }),
    );
  }
}
