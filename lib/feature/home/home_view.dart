import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:nodelabs_case/core/context/user_context.dart';
import 'package:nodelabs_case/core/utils/padding/app_padding.dart';
import 'package:nodelabs_case/core/utils/sized_box/app_sized_box.dart';
import 'package:nodelabs_case/feature/home/cubit/home_cubit.dart';
import 'package:nodelabs_case/feature/home/cubit/home_state.dart';
import 'package:nodelabs_case/feature/home/view_model/home_view_model.dart';
import 'package:nodelabs_case/product/model/movie_model.dart';
import 'package:nodelabs_case/product/widget/image/app_image.dart';
import 'package:nodelabs_case/product/widget/pagination/pagination_builder.dart';
import 'package:nodelabs_case/product/widget/text/primary_bold_small_text.dart';
import 'package:nodelabs_case/product/widget/text/primary_regular_small_text.dart';
import 'package:nodelabs_case/product/widget/text/primary_semibold_large_text.dart';
import 'package:provider/provider.dart';

part 'widget/home_widget.dart';

final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

final class _HomeViewState extends State<HomeView> with HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeCubit,
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: cubitListener,
        builder: (context, state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            body: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: PaginationBuilder<MovieModel>(
                itemBuilder: (movie) {
                  final index = state.movies?.indexOf(movie) ?? -1;
                  return SizedBox(
                    height: MediaQuery.of(context).size.height - 93,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: AppImage(
                            imageUrl: movie.poster ?? '',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: AppPadding.allXHigh(),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: _FavoriteIcon(
                                    movie: movie,
                                    onTap: () async {
                                      if (state.isFavoriteLoading) return;
                                      await toggleFavorite(movie);
                                    },
                                  ),
                                ),
                                AppSizedBox.heightHigh(),
                                AppSizedBox.heightExtraLow(),
                                Padding(
                                  padding: AppPadding.horizontalXHigh(),
                                  child: Row(
                                    spacing: 16,
                                    children: [
                                      _MovieIcon(),
                                      Expanded(
                                        child: _MovieTitleAndPlot(
                                          movie: movie,
                                          onTap: () {
                                            toggleMovieExpanded(index);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                onPageRequest: onLoadMore,
                dataList: state.movies ?? [],
                hasMore: state.hasNextPage,
                onRefresh: onRefresh,
              ),
            ),
          );
        },
      ),
    );
  }
}
