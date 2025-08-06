import 'package:json_annotation/json_annotation.dart';
import 'package:nodelabs_case/product/network/base_response_mixin.dart';
import 'package:nodelabs_case/product/network/model/base_error_model.dart';
import 'package:nodelabs_case/product/repository/movies/enum/movies_update_favorite_action_enum.dart';
import 'package:vexana/vexana.dart';

part 'movies_update_favorite_response_model.g.dart';

@JsonSerializable()
final class MoviesUpdateFavoriteResponseModel
    extends INetworkModel<MoviesUpdateFavoriteResponseModel>
    with BaseResponseMixin<MoviesUpdateFavoriteResponseDataModel> {
  const MoviesUpdateFavoriteResponseModel({this.data, this.error});

  @override
  final MoviesUpdateFavoriteResponseDataModel? data;
  @override
  final BaseErrorModel? error;

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
