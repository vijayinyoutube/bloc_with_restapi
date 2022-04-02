import 'dart:convert';

import 'package:http/http.dart' as http;

import '../API/api.dart';
import '../Models/author_model.dart';

abstract class AuthorRepository {
  Future<List<AuthorModel>> fetchAuthor();
}

class AuthorRepo extends AuthorRepository {
  @override
  Future<List<AuthorModel>> fetchAuthor() async {
    final response = await http.get(Uri.parse("$apiBaseUrl/messages"));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)["messages"] as List)
          .map((p) => AuthorModel.fromMap(p))
          .toList();
    } else {
      throw Exception('Failed to load API data');
    }
  }
}
