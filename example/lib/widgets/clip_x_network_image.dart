import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ClipXNetworkImage extends StatelessWidget {
  final String url;
  final double size;
  final double borderRadius;

  const ClipXNetworkImage({
    Key key,
    this.url,
    this.size,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? size / 2),
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
