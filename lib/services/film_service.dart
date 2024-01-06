import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/film.dart';

class FilmService {
  final String baseUrl = 'https://swapi.dev/api/films';

  Future<FilmList?> fetchFilms() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        return FilmList.fromJson(json.decode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
