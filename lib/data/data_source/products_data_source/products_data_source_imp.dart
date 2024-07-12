import 'package:dio/dio.dart';
import 'package:route_task/data/data_source/products_data_source/products_data_source.dart';

class ProductsDataSourceImp implements ProductsDataSource {
  final Dio dio;

  ProductsDataSourceImp(this.dio);

  @override
  Future<Response> getAllProducts() async {
    return await dio.get("products");
  }
}
