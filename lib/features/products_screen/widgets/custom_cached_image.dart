import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../core/config/app_theme_manager.dart';

Widget customCachedImage(BuildContext context, String url) {
  return CachedNetworkImage(
    imageUrl: url,
    placeholder: (context, url) => LoadingAnimationWidget.hexagonDots(
        color: AppThemeManager.primaryColor, size: 45),
    errorWidget: (context, url, error) => Container(
      color: Colors.grey,
      alignment: AlignmentDirectional.center,
      child: const Icon(Icons.error),
    ),
  );
}
