import 'package:flutter/material.dart';
import 'package:starwars/models/film.dart';
import 'package:starwars/services/film_service.dart';

class FilmProvider with ChangeNotifier {
  final FilmService filmService;
  FilmList? _filmList;
  bool _hasError = false;

  FilmProvider({required this.filmService});

  FilmList? get filmList => _filmList;
  bool get hasError => _hasError;

  Future<void> fetchFilms() async {
    try {
      _filmList = await filmService.fetchFilms();
      _hasError = _filmList == null;
      notifyListeners();
    } catch (e) {
      _hasError = true;
      notifyListeners();
    }
  }
}
