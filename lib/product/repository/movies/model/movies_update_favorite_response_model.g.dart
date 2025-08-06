// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_update_favorite_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesUpdateFavoriteResponseModel _$MoviesUpdateFavoriteResponseModelFromJson(
  Map<String, dynamic> json,
) => MoviesUpdateFavoriteResponseModel(
  data: json['data'] == null
      ? null
      : MoviesUpdateFavoriteResponseDataModel.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
  error: json['error'] == null
      ? null
      : BaseErrorModel.fromJson(json['error'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MoviesUpdateFavoriteResponseModelToJson(
  MoviesUpdateFavoriteResponseModel instance,
) => <String, dynamic>{'data': instance.data, 'error': instance.error};

MoviesUpdateFavoriteResponseDataModel
_$MoviesUpdateFavoriteResponseDataModelFromJson(Map<String, dynamic> json) =>
    MoviesUpdateFavoriteResponseDataModel(
      action: $enumDecodeNullable(
        _$MoviesUpdateFavoriteActionEnumEnumMap,
        json['action'],
      ),
    );

Map<String, dynamic> _$MoviesUpdateFavoriteResponseDataModelToJson(
  MoviesUpdateFavoriteResponseDataModel instance,
) => <String, dynamic>{
  'action': _$MoviesUpdateFavoriteActionEnumEnumMap[instance.action],
};

const _$MoviesUpdateFavoriteActionEnumEnumMap = {
  MoviesUpdateFavoriteActionEnum.favorite: 'favorited',
  MoviesUpdateFavoriteActionEnum.unFavorite: 'unFavorited',
};
