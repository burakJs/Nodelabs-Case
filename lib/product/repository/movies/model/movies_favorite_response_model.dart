import 'package:json_annotation/json_annotation.dart';
import 'package:nodelabs_case/product/model/movie_model.dart';
import 'package:nodelabs_case/product/network/base_response_mixin.dart';
import 'package:nodelabs_case/product/network/model/base_error_model.dart';
import 'package:vexana/vexana.dart';

part 'movies_favorite_response_model.g.dart';

@JsonSerializable()
final class MoviesFavoriteResponseModel
    extends INetworkModel<MoviesFavoriteResponseModel>
    with BaseResponseMixin<List<MovieModel>> {
  const MoviesFavoriteResponseModel({this.data, this.error});

  @override
  final List<MovieModel>? data;
  @override
  final BaseErrorModel? error;

  factory MoviesFavoriteResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesFavoriteResponseModelFromJson(json);

  @override
  MoviesFavoriteResponseModel fromJson(Map<String, dynamic> json) {
    return MoviesFavoriteResponseModel.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$MoviesFavoriteResponseModelToJson(this);
  }
}
