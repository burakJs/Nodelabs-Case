import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'movie_model.g.dart';

@JsonSerializable()
final class MovieModel extends INetworkModel<MovieModel> {
  const MovieModel({
    this.id,
    this.title,
    this.year,
    this.rated,
    this.released,
    this.runtime,
    this.genre,
    this.director,
    this.writer,
    this.actors,
    this.plot,
    this.language,
    this.country,
    this.awards,
    this.poster,
    this.metascore,
    this.imdbRating,
    this.imdbVotes,
    this.imdbID,
    this.type,
    this.response,
    this.images,
    this.comingSoon,
    this.isFavorite,
    this.isExpanded = false,
  });

  final String? id;
  @JsonKey(name: 'Title')
  final String? title;
  @JsonKey(name: 'Year')
  final String? year;
  @JsonKey(name: 'Rated')
  final String? rated;
  @JsonKey(name: 'Released')
  final String? released;
  @JsonKey(name: 'Runtime')
  final String? runtime;
  @JsonKey(name: 'Genre')
  final String? genre;
  @JsonKey(name: 'Director')
  final String? director;
  @JsonKey(name: 'Writer')
  final String? writer;
  @JsonKey(name: 'Actors')
  final String? actors;
  @JsonKey(name: 'Plot')
  final String? plot;
  @JsonKey(name: 'Language')
  final String? language;
  @JsonKey(name: 'Country')
  final String? country;
  @JsonKey(name: 'Awards')
  final String? awards;
  @JsonKey(name: 'Poster')
  final String? poster;
  @JsonKey(name: 'Metascore')
  final String? metascore;
  final String? imdbRating;
  final String? imdbVotes;
  final String? imdbID;
  @JsonKey(name: 'Type')
  final String? type;
  @JsonKey(name: 'Response')
  final String? response;
  @JsonKey(name: 'Images')
  final List<String>? images;
  @JsonKey(name: 'ComingSoon')
  final bool? comingSoon;
  final bool? isFavorite;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final bool isExpanded;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

  @override
  MovieModel fromJson(Map<String, dynamic> json) {
    return MovieModel.fromJson(json);
  }

  MovieModel copyWith({
    String? id,
    String? title,
    String? year,
    String? rated,
    String? released,
    String? runtime,
    String? genre,
    String? director,
    String? writer,
    String? actors,
    String? plot,
    String? language,
    String? country,
    String? awards,
    String? poster,
    String? metascore,
    String? imdbRating,
    String? imdbVotes,
    String? imdbID,
    String? type,
    String? response,
    List<String>? images,
    bool? comingSoon,
    bool? isFavorite,
    bool? isExpanded,
  }) {
    return MovieModel(
      id: id ?? this.id,
      title: title ?? this.title,
      year: year ?? this.year,
      rated: rated ?? this.rated,
      released: released ?? this.released,
      runtime: runtime ?? this.runtime,
      genre: genre ?? this.genre,
      director: director ?? this.director,
      writer: writer ?? this.writer,
      actors: actors ?? this.actors,
      plot: plot ?? this.plot,
      language: language ?? this.language,
      country: country ?? this.country,
      awards: awards ?? this.awards,
      poster: poster ?? this.poster,
      metascore: metascore ?? this.metascore,
      imdbRating: imdbRating ?? this.imdbRating,
      imdbVotes: imdbVotes ?? this.imdbVotes,
      imdbID: imdbID ?? this.imdbID,
      type: type ?? this.type,
      response: response ?? this.response,
      images: images ?? this.images,
      comingSoon: comingSoon ?? this.comingSoon,
      isFavorite: isFavorite ?? this.isFavorite,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}
