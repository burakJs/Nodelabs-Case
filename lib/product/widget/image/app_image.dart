import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

final class AppImage extends StatelessWidget {
  const AppImage({
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.borderRadius,
    super.key,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      child: CachedNetworkImage(
        imageUrl: imageUrl.replaceAll('http://', 'https://'),
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}
