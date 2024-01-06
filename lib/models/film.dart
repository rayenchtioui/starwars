class Film {
  final String title;
  final int episodeId;
  final String openingCrawl;
  final String director;
  final String producer;
  final String releaseDate;
  final List<String> characters;
  final List<String> planets;
  final List<String> starships;
  final List<String> vehicles;
  final List<String> species;
  final String created;
  final String edited;
  final String url;

  Film({
    required this.title,
    required this.episodeId,
    required this.openingCrawl,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.characters,
    required this.planets,
    required this.starships,
    required this.vehicles,
    required this.species,
    required this.created,
    required this.edited,
    required this.url,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      title: json['title'],
      episodeId: json['episode_id'],
      openingCrawl: json['opening_crawl'],
      director: json['director'],
      producer: json['producer'],
      releaseDate: json['release_date'],
      characters: List<String>.from(json['characters']),
      planets: List<String>.from(json['planets']),
      starships: List<String>.from(json['starships']),
      vehicles: List<String>.from(json['vehicles']),
      species: List<String>.from(json['species']),
      created: json['created'],
      edited: json['edited'],
      url: json['url'],
    );
  }
}

class FilmList {
  final int count;
  final String? next;
  final String? previous;
  final List<Film> results;

  FilmList({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory FilmList.fromJson(Map<String, dynamic> json) {
    final results = (json['results'] as List)
        .map((resultJson) => Film.fromJson(resultJson))
        .toList();

    return FilmList(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: results,
    );
  }
}
