import 'package:dio/dio.dart';

abstract class ProductsDataSource {
  Future<Response> getAllProducts();
}
