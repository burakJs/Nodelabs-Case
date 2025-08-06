// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesListResponseModel _$MoviesListResponseModelFromJson(
  Map<String, dynamic> json,
) => MoviesListResponseModel(
  data: json['data'] == null
      ? null
      : MoviesListResponseDataModel.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
  error: json['error'] == null
      ? null
      : BaseErrorModel.fromJson(json['error'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MoviesListResponseModelToJson(
  MoviesListResponseModel instance,
) => <String, dynamic>{'data': instance.data, 'error': instance.error};

MoviesListResponseDataModel _$MoviesListResponseDataModelFromJson(
  Map<String, dynamic> json,
) => MoviesListResponseDataModel(
  movies: (json['movies'] as List<dynamic>?)
      ?.map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagination: json['pagination'] == null
      ? null
      : PaginationModel.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MoviesListResponseDataModelToJson(
  MoviesListResponseDataModel instance,
) => <String, dynamic>{
  'movies': instance.movies,
  'pagination': instance.pagination,
};

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) =>
    PaginationModel(
      totalCount: (json['totalCount'] as num?)?.toInt(),
      perPage: (json['perPage'] as num?)?.toInt(),
      maxPage: (json['maxPage'] as num?)?.toInt(),
      currentPage: (json['currentPage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationModelToJson(PaginationModel instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'perPage': instance.perPage,
      'maxPage': instance.maxPage,
      'currentPage': instance.currentPage,
    };
