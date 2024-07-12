import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:route_task/core/failure/failure.dart';
import 'package:route_task/core/failure/server_failure.dart';
import 'package:route_task/data/data_source/products_data_source/products_data_source.dart';
import 'package:route_task/data/models/products_model.dart';
import 'package:route_task/domain/repository/products_repository.dart';

class ProductsRepositoryImp implements ProductsRepository {
  final ProductsDataSource dataSource;

  ProductsRepositoryImp(this.dataSource);

  @override
  Future<Either<Failure, List<ProductsModel>>> getAllProducts() async {
    try {
      final response = await dataSource.getAllProducts();
      if (response.statusCode == 200) {
        var data = response.data["products"] as List;
        List<ProductsModel> productsList = [];
        for (var e in data) {
          productsList.add(ProductsModel.fromJson(e));
        }
        return Right(productsList);
      } else {
        return Left(ServerFailure(
          statusCode: response.statusCode.toString(),
        ));
      }
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString() ?? "",
        ),
      );
    }
  }
}
