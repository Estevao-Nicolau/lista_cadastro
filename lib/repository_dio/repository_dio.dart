import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lista_contatos/models/user_model.dart';

class DioRepository {
  final Dio _dio = Dio();
  final String baseUrl = 'https://parseapi.back4app.com/classes/ListUser';

  final Map<String, String> headers = {
    'X-Parse-Application-Id': 'TU2HniBc66CZC3Rq7ppVBsV2bCecuzUHUkuMuuDL',
    'X-Parse-REST-API-Key': 'GPW5WzKjl7v0nk13qaT1oCQCxZHRfyYcoAcOpkKo',
    'Content-Type': 'application/json',
  };

  Future<List<Results>> getUsers() async {
    try {
      final response = await _dio.get(
        baseUrl,
        options: Options(
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> userJsonList = response.data['results'];

        final List<Results> resultsList = userJsonList.map((userData) {
          return Results.fromJson(userData);
        }).toList();

        return resultsList;
      } else {
        throw Exception('Failed to retrieve users');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<void> createUser(Results results) async {
    var headers = {
      'X-Parse-Application-Id': 'TU2HniBc66CZC3Rq7ppVBsV2bCecuzUHUkuMuuDL',
      'X-Parse-REST-API-Key': 'GPW5WzKjl7v0nk13qaT1oCQCxZHRfyYcoAcOpkKo',
      'Content-Type': 'application/json'
    };
    var data = json.encode({
      "name": results.name,
      "age": results.age,
      "emial": results.emial,
      "cpf": results.cpf,
      "profilephoto": results.profilephoto,
      "phone": results.phone
    });
    var dio = Dio();
    var response = await dio.request(
      'https://parseapi.back4app.com/classes/ListUser',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  }
}
