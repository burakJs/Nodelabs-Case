import 'package:nodelabs_case/product/network/service_manager.dart';
import 'package:nodelabs_case/product/repository/movies/model/movies_favorite_response_model.dart';
import 'package:nodelabs_case/product/repository/movies/model/movies_list_response_model.dart';
import 'package:nodelabs_case/product/repository/movies/model/movies_update_favorite_response_model.dart';

abstract class BaseMoviesRepository {
  BaseMoviesRepository({required this.serviceManager});
  final ServiceManager serviceManager;

  Future<MoviesListResponseModel?> getMovies({int page = 1});
  Future<MoviesFavoriteResponseModel?> getFavorites();
  Future<MoviesUpdateFavoriteResponseModel?> updateFavorite(String movieId);
}
