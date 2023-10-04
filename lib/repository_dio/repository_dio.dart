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

        // Mapeie os dados JSON para uma lista de Results
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
}
