import 'package:equatable/equatable.dart';
import 'package:nodelabs_case/product/model/movie_model.dart';
import 'package:nodelabs_case/product/repository/movies/model/movies_list_response_model.dart';

final class HomeState extends Equatable {
  const HomeState({
    this.movies,
    this.pagination,
    this.hasError = false,
    this.errorMessage,
    this.isFavoriteLoading = false,
  });

  final List<MovieModel>? movies;
  final PaginationModel? pagination;
  final bool hasError;
  final String? errorMessage;
  final bool isFavoriteLoading;

  bool get hasNextPage => pagination?.hasNextPage ?? false;

  @override
  List<Object?> get props => [movies, pagination, hasError, errorMessage, isFavoriteLoading];

  HomeState copyWith({
    List<MovieModel>? movies,
    PaginationModel? pagination,
    bool? hasError,
    String? errorMessage,
    bool? isFavoriteLoading,
  }) {
    return HomeState(
      movies: movies ?? this.movies,
      pagination: pagination ?? this.pagination,
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
      isFavoriteLoading: isFavoriteLoading ?? this.isFavoriteLoading,
    );
  }
}
