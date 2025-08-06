import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'jsonKey')
enum MoviesUpdateFavoriteActionEnum {
  favorite('favorited'),
  unFavorite('unFavorited');

  const MoviesUpdateFavoriteActionEnum(this.jsonKey);
  final String jsonKey;
}
