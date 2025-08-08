import 'package:nodelabs_case/product/network/app_response_type.dart';
import 'package:nodelabs_case/product/repository/movies/base_movies_repository.dart';
import 'package:nodelabs_case/product/repository/movies/enum/movies_endpoint_enum.dart';
import 'package:nodelabs_case/product/repository/movies/model/movies_favorite_response_model.dart';
import 'package:nodelabs_case/product/repository/movies/model/movies_list_response_model.dart';
import 'package:nodelabs_case/product/repository/movies/model/movies_update_favorite_response_model.dart';
import 'package:vexana/vexana.dart';

final class MoviesRepository extends BaseMoviesRepository {
  MoviesRepository({required super.serviceManager});

  @override
  Future<AppResponseType<MoviesFavoriteResponseModel>?> getFavorites() async {
    final response = await serviceManager.manager
        .send<MoviesFavoriteResponseModel, MoviesFavoriteResponseModel>(
          MoviesEndpointEnum.favorites.path,
          parseModel: MoviesFavoriteResponseModel(),
          method: RequestType.GET,
        );

    return (
      data: response.data,
      error: response.error?.model?.response,
      success: response.error == null,
    );
  }

  @override
  Future<AppResponseType<MoviesListResponseModel>?> getMovies({
    int page = 1,
  }) async {
    final response = await serviceManager.manager
        .send<MoviesListResponseModel, MoviesListResponseModel>(
          MoviesEndpointEnum.list.path,
          parseModel: MoviesListResponseModel(),
          method: RequestType.GET,
          queryParameters: {'page': page},
        );

    return (
      data: response.data,
      error: response.error?.model?.response,
      success: response.error == null,
    );
  }

  @override
  Future<AppResponseType<MoviesUpdateFavoriteResponseModel>?> updateFavorite(
    String movieId,
  ) async {
    final response = await serviceManager.manager
        .send<
          MoviesUpdateFavoriteResponseModel,
          MoviesUpdateFavoriteResponseModel
        >(
          '${MoviesEndpointEnum.updateFavorite.path}/$movieId',
          parseModel: MoviesUpdateFavoriteResponseModel(),
          method: RequestType.POST,
        );

    return (
      data: response.data,
      error: response.error?.model?.response,
      success: response.error == null,
    );
  }
}
