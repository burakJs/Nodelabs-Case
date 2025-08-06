import 'package:json_annotation/json_annotation.dart';
import 'package:nodelabs_case/product/model/movie_model.dart';
import 'package:nodelabs_case/product/network/base_response_mixin.dart';
import 'package:nodelabs_case/product/network/model/base_error_model.dart';
import 'package:vexana/vexana.dart';

part 'movies_list_response_model.g.dart';

@JsonSerializable()
final class MoviesListResponseModel
    extends INetworkModel<MoviesListResponseModel>
    with BaseResponseMixin<MoviesListResponseDataModel> {
  const MoviesListResponseModel({this.data, this.error});

  @override
  final MoviesListResponseDataModel? data;
  @override
  final BaseErrorModel? error;

  factory MoviesListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesListResponseModelFromJson(json);

  @override
  MoviesListResponseModel fromJson(Map<String, dynamic> json) {
    return MoviesListResponseModel.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$MoviesListResponseModelToJson(this);
  }
}

@JsonSerializable()
final class MoviesListResponseDataModel
    extends INetworkModel<MoviesListResponseDataModel> {
  const MoviesListResponseDataModel({this.movies, this.pagination});

  final List<MovieModel>? movies;
  final PaginationModel? pagination;

  factory MoviesListResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesListResponseDataModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MoviesListResponseDataModelToJson(this);

  @override
  MoviesListResponseDataModel fromJson(Map<String, dynamic> json) {
    return MoviesListResponseDataModel.fromJson(json);
  }
}

@JsonSerializable()
final class PaginationModel extends INetworkModel<PaginationModel> {
  const PaginationModel({
    this.totalCount,
    this.perPage,
    this.maxPage,
    this.currentPage,
  });

  final int? totalCount;
  final int? perPage;
  final int? maxPage;
  final int? currentPage;

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PaginationModelToJson(this);

  @override
  PaginationModel fromJson(Map<String, dynamic> json) {
    return PaginationModel.fromJson(json);
  }
}
