// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_favorite_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesFavoriteResponseModel _$MoviesFavoriteResponseModelFromJson(
  Map<String, dynamic> json,
) => MoviesFavoriteResponseModel(
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  error: json['error'] == null
      ? null
      : BaseErrorModel.fromJson(json['error'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MoviesFavoriteResponseModelToJson(
  MoviesFavoriteResponseModel instance,
) => <String, dynamic>{'data': instance.data, 'error': instance.error};
