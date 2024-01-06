import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars/providers/film_provider.dart';
import 'package:starwars/widgets/film_list_item.dart';

const textStyle = TextStyle(
  fontFamily: 'Archivo',
  fontWeight: FontWeight.w400,
  height: 0.83,
  letterSpacing: -0.24,
);

class FilmsListScreen extends StatefulWidget {
  const FilmsListScreen({super.key});

  @override
  _FilmsListScreenState createState() => _FilmsListScreenState();
}

class _FilmsListScreenState extends State<FilmsListScreen> {
  @override
  Widget build(BuildContext context) {
    final filmProvider = Provider.of<FilmProvider>(context);

    if (filmProvider.hasError) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Think-it Star Wars',
              textAlign: TextAlign.center, style: textStyle),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Please check your connection and try again.'),
        ),
      );
    }
    final films = filmProvider.filmList?.results ?? [];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Think-it Star Wars',
            textAlign: TextAlign.center, style: textStyle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  color: Colors.black,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                          'assets/images/star_wars_logo_PNG34 1.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Total ${films.length} Movies',
                    style: textStyle.copyWith(
                      fontSize: 15,
                      color: const Color(0xFFD8D8D8),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: films.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                return FilmListItem(film: films[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
