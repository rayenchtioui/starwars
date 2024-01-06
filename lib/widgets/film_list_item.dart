import 'package:flutter/material.dart';
import 'package:starwars/models/film.dart';
import 'package:starwars/views/film_details_screen.dart';

const textStyle = TextStyle(
    fontFamily: 'Archivo',
    fontWeight: FontWeight.w400,
    color: Color(0xFFF9F9F9),
    letterSpacing: -0.24);

class FilmListItem extends StatelessWidget {
  final Film film;

  const FilmListItem({required this.film, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FilmDetailScreen(film: film)),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      film.title,
                      style: textStyle.copyWith(
                        fontSize: 24,
                        height: 24 / 20,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Release date',
                        style: textStyle.copyWith(fontSize: 9),
                      ),
                      Text(
                        film.releaseDate,
                        style: textStyle.copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Director',
                          style: textStyle.copyWith(fontSize: 9),
                        ),
                        Text(
                          film.director,
                          style: textStyle.copyWith(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Producer',
                          style: textStyle.copyWith(fontSize: 9),
                        ),
                        Text(
                          film.producer,
                          style: textStyle.copyWith(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                film.openingCrawl.split('\n').take(2).join('\n'),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textStyle.copyWith(fontSize: 13),
              ),
              Divider(color: Colors.grey[700]),
            ],
          ),
        ));
  }
}
