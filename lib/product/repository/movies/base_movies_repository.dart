import 'package:nodelabs_case/product/network/app_response_type.dart';
import 'package:nodelabs_case/product/network/service_manager.dart';
import 'package:nodelabs_case/product/repository/movies/model/movies_favorite_response_model.dart';
import 'package:nodelabs_case/product/repository/movies/model/movies_list_response_model.dart';
import 'package:nodelabs_case/product/repository/movies/model/movies_update_favorite_response_model.dart';

abstract class BaseMoviesRepository {
  BaseMoviesRepository({required this.serviceManager});
  final ServiceManager serviceManager;

  Future<AppResponseType<MoviesListResponseModel>?> getMovies({int page = 1});
  Future<AppResponseType<MoviesFavoriteResponseModel>?> getFavorites();
  Future<AppResponseType<MoviesUpdateFavoriteResponseModel>?> updateFavorite(String movieId);
}
