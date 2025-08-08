part of '../home_view.dart';

final class _FavoriteIcon extends StatelessWidget {
  const _FavoriteIcon({required this.movie, required this.onTap});

  final MovieModel movie;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: AppPadding.allXHigh() + AppPadding.verticalXHigh(),
        decoration: BoxDecoration(
          color: context.general.colorScheme.inverseSurface,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: context.general.colorScheme.onPrimary.withValues(alpha: 0.2),
          ),
          // add background blur
          boxShadow: [
            BoxShadow(
              color: Colors.transparent,
              blurRadius: 15,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Consumer<UserContext>(
          builder: (context, userContext, child) {
            final isFavorite = userContext.isFavorite(movie);
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Icon(
                key: ValueKey(isFavorite),
                isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _MovieIcon extends StatelessWidget {
  const _MovieIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.general.colorScheme.primary,
        border: Border.all(
          color: context.general.colorScheme.onPrimary,
          width: 1.5,
        ),
      ),
      child: Center(child: PrimarySemiBoldLargeText('SF')),
    );
  }
}

final class _MovieTitleAndPlot extends StatelessWidget {
  const _MovieTitleAndPlot({required this.movie, required this.onTap});

  final MovieModel movie;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrimarySemiBoldLargeText(movie.title ?? ''),
        GestureDetector(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _PlotText(plot: movie.plot ?? '', isExpanded: movie.isExpanded),
              _IsExpandedText(isExpanded: movie.isExpanded),
            ],
          ),
        ),
      ],
    );
  }
}

class _PlotText extends StatelessWidget {
  const _PlotText({required this.plot, required this.isExpanded});

  final String plot;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return PrimaryRegularSmallText(
      plot,
      maxLine: isExpanded ? null : 2,
      overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
      color: context.general.colorScheme.onPrimary.withValues(alpha: 0.75),
    );
  }
}

class _IsExpandedText extends StatelessWidget {
  const _IsExpandedText({required this.isExpanded});

  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return PrimaryBoldSmallText(
      isExpanded ? 'Daha Az' : 'Daha Fazla',
      color: context.general.colorScheme.onPrimary,
    );
  }
}
