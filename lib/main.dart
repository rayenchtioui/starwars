import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars/providers/film_provider.dart';
import 'package:starwars/services/film_service.dart';
import 'package:starwars/views/films_screen.dart';
import 'package:starwars/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => FilmProvider(filmService: FilmService())),
      ],
      child: MaterialApp(
        title: 'Star Wars Films',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreenManager(),
      ),
    );
  }
}

class SplashScreenManager extends StatefulWidget {
  const SplashScreenManager({super.key});

  @override
  _SplashScreenManagerState createState() => _SplashScreenManagerState();
}

class _SplashScreenManagerState extends State<SplashScreenManager> {
  @override
  void initState() {
    super.initState();
    _loadDataAndNavigate();
  }

  Future<void> _loadDataAndNavigate() async {
    await Provider.of<FilmProvider>(context, listen: false).fetchFilms();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const FilmsListScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
