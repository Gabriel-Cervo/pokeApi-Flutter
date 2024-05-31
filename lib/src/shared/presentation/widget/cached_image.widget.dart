import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? size;
  const CachedImageWidget({super.key, required this.imageUrl, this.size});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        height: size ?? 48,
        width: size ?? 48,
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress));
  }
}
