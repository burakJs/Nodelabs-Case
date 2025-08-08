import 'package:nodelabs_case/core/cubit/base_cubit.dart';
import 'package:nodelabs_case/core/dependency/app_dependency.dart';
import 'package:nodelabs_case/feature/home/cubit/home_state.dart';
import 'package:nodelabs_case/product/model/movie_model.dart';
import 'package:nodelabs_case/product/network/base_response_extension.dart';
import 'package:nodelabs_case/product/repository/movies/base_movies_repository.dart';

final class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit()
    : _moviesRepository = AppDependency.get<BaseMoviesRepository>(),
      super(const HomeState());

  final BaseMoviesRepository _moviesRepository;

  Future<void> getMovies({bool isRefresh = false}) async {
    safeEmit(state.copyWith(hasError: false, errorMessage: null));
    final currentPage = isRefresh ? 0 : state.pagination?.currentPage ?? 0;
    final response = await _moviesRepository.getMovies(page: currentPage + 1);
    final hasError = response?.hasError ?? false;
    if (hasError) {
      safeEmit(
        state.copyWith(
          hasError: hasError,
          errorMessage: response?.errorMessage,
        ),
      );
      return;
    }
    final oldMovies = state.movies ?? [];
    final newMovies = response?.data?.data?.movies ?? [];
    safeEmit(
      state.copyWith(
        movies: isRefresh ? newMovies : [...oldMovies, ...newMovies],
        pagination: response?.data?.data?.pagination,
        hasError: false,
      ),
    );
  }

  Future<List<MovieModel>> updateFavorite(String movieId) async {
    if (state.isFavoriteLoading) return [];

    safeEmit(state.copyWith(isFavoriteLoading: true));

    final response = await _moviesRepository.updateFavorite(movieId);

    if (response?.success == true) {
      final favoritesResponse = await _moviesRepository.getFavorites();
      safeEmit(state.copyWith(isFavoriteLoading: false));

      return favoritesResponse?.data?.data ?? [];
    }

    safeEmit(state.copyWith(isFavoriteLoading: false));
    return [];
  }

  void toggleMovieExpanded(int index) {
    final movies = state.movies;
    if (movies == null || index >= movies.length) return;

    final updatedMovies = List<MovieModel>.from(movies);
    updatedMovies[index] = updatedMovies[index].copyWith(
      isExpanded: !updatedMovies[index].isExpanded,
    );

    safeEmit(state.copyWith(movies: updatedMovies));
  }
}
