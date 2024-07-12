import 'package:dartz/dartz.dart';
import 'package:route_task/core/failure/failure.dart';
import 'package:route_task/data/models/products_model.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<ProductsModel>>> getAllProducts();
}
