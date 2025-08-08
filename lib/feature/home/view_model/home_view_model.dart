import 'package:flutter/material.dart';
import 'package:nodelabs_case/core/context/user_context.dart';
import 'package:nodelabs_case/feature/home/cubit/home_cubit.dart';
import 'package:nodelabs_case/feature/home/cubit/home_state.dart';
import 'package:nodelabs_case/feature/home/home_view.dart';
import 'package:nodelabs_case/product/extension/context_extension.dart';
import 'package:nodelabs_case/product/model/movie_model.dart';
import 'package:provider/provider.dart';

mixin HomeViewModel on State<HomeView> {
  final HomeCubit _homeCubit = HomeCubit();
  HomeCubit get homeCubit => _homeCubit;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await onRefresh();
    });
  }

  void cubitListener(BuildContext context, HomeState state) {
    if (state.hasError) {
      context.showErrorSnackBar(message: state.errorMessage ?? '');
    }
  }

  Future<void> onRefresh() async {
    await homeCubit.getMovies(isRefresh: true);
  }

  Future<void> onLoadMore() async {
    await homeCubit.getMovies();
  }

  Future<void> toggleFavorite(MovieModel movie) async {
    if (homeCubit.state.isFavoriteLoading) return;

    final movieId = movie.id;
    if (movieId == null) return;

    final updatedFavorites = await homeCubit.updateFavorite(movieId);

    if (mounted) {
      final userContext = context.read<UserContext>();
      userContext.updateFavorites(updatedFavorites);
    }
  }

  void toggleMovieExpanded(int index) {
    if (index < 0) return;
    homeCubit.toggleMovieExpanded(index);
  }
}
