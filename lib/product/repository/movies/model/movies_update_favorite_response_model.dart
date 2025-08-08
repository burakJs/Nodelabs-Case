import 'package:json_annotation/json_annotation.dart';
import 'package:nodelabs_case/product/repository/movies/enum/movies_update_favorite_action_enum.dart';
import 'package:vexana/vexana.dart';

part 'movies_update_favorite_response_model.g.dart';

@JsonSerializable()
final class MoviesUpdateFavoriteResponseModel
    extends INetworkModel<MoviesUpdateFavoriteResponseModel> {
  const MoviesUpdateFavoriteResponseModel({this.data});

  final MoviesUpdateFavoriteResponseDataModel? data;

  factory MoviesUpdateFavoriteResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$MoviesUpdateFavoriteResponseModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() =>
      _$MoviesUpdateFavoriteResponseModelToJson(this);

  @override
  MoviesUpdateFavoriteResponseModel fromJson(Map<String, dynamic> json) {
    return MoviesUpdateFavoriteResponseModel.fromJson(json);
  }
}

@JsonSerializable()
final class MoviesUpdateFavoriteResponseDataModel
    extends INetworkModel<MoviesUpdateFavoriteResponseDataModel> {
  const MoviesUpdateFavoriteResponseDataModel({this.action});

  final MoviesUpdateFavoriteActionEnum? action;

  factory MoviesUpdateFavoriteResponseDataModel.fromJson(
    Map<String, dynamic> json,
  ) => _$MoviesUpdateFavoriteResponseDataModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$MoviesUpdateFavoriteResponseDataModelToJson(this);

  @override
  MoviesUpdateFavoriteResponseDataModel fromJson(Map<String, dynamic> json) {
    return MoviesUpdateFavoriteResponseDataModel.fromJson(json);
  }
}
