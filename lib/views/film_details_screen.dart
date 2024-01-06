import 'package:flutter/material.dart';
import 'package:starwars/models/film.dart';
import 'package:intl/intl.dart';

const textStyle = TextStyle(
  fontFamily: 'Archivo',
  fontWeight: FontWeight.w400,
  letterSpacing: -0.24,
);

class FilmDetailScreen extends StatefulWidget {
  final Film film;

  const FilmDetailScreen({super.key, required this.film});

  @override
  _FilmDetailScreenState createState() => _FilmDetailScreenState();
}

class _FilmDetailScreenState extends State<FilmDetailScreen> {
  @override
  Widget build(BuildContext context) {
    String formattedCreatedDate =
        DateFormat('yyyy-MM-dd').format(DateTime.parse(widget.film.created));
    String formattedEditedDate =
        DateFormat('yyyy-MM-dd').format(DateTime.parse(widget.film.edited));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.film.title,
            style: textStyle.copyWith(color: Colors.black, fontSize: 24)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              color: const Color(0xFF161615),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.film.title,
                      style: textStyle.copyWith(
                          fontSize: 36, color: const Color(0xFFF9F9F9))),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Release Date',
                                style: textStyle.copyWith(
                                    fontSize: 9,
                                    color: const Color(0xFFF9F9F9))),
                            Text(widget.film.releaseDate,
                                style: textStyle.copyWith(
                                    fontSize: 13,
                                    color: const Color(0xFFF9F9F9))),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Director',
                                style: textStyle.copyWith(
                                    fontSize: 9,
                                    color: const Color(0xFFF9F9F9))),
                            Text(widget.film.director,
                                style: textStyle.copyWith(
                                    fontSize: 13,
                                    color: const Color(0xFFF9F9F9))),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Producer',
                                style: textStyle.copyWith(
                                    fontSize: 9,
                                    color: const Color(0xFFF9F9F9))),
                            Text(widget.film.producer,
                                style: textStyle.copyWith(
                                    fontSize: 13,
                                    color: const Color(0xFFF9F9F9))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Opening Crawl',
                  style: textStyle.copyWith(
                      fontSize: 18, color: const Color(0xFF161615))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(widget.film.openingCrawl,
                  style: textStyle.copyWith(color: const Color(0xFF161615)),
                  softWrap: true,
                  textAlign: TextAlign.justify),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Created',
                            style: textStyle.copyWith(
                                fontSize: 9, color: const Color(0xFF161615))),
                        Text(formattedCreatedDate,
                            style: textStyle.copyWith(
                                fontSize: 13, color: const Color(0xFF161615))),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Edited',
                            style: textStyle.copyWith(
                                fontSize: 9, color: const Color(0xFF161615))),
                        Text(formattedEditedDate,
                            style: textStyle.copyWith(
                                fontSize: 13, color: const Color(0xFF161615))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
