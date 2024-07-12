import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../core/config/app_theme_manager.dart';

Widget loadingWidget() {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LoadingAnimationWidget.fourRotatingDots(
            color: AppThemeManager.primaryColor, size: 50),
      ],
    ),
  );
}
