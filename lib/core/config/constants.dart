import 'package:flutter/material.dart';

class Constants {
  static Size getMediaQuery(BuildContext context) =>
      MediaQuery.of(context).size;
  static const String baseUrl = "https://dummyjson.com/";
}
