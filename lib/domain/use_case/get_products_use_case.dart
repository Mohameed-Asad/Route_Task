import 'package:dartz/dartz.dart';
import 'package:route_task/domain/entities/products_entity.dart';
import 'package:route_task/domain/repository/products_repository.dart';
import '../../core/failure/failure.dart';

class GetProductsUseCase {
  final ProductsRepository repository;

  GetProductsUseCase(this.repository);

  Future<Either<Failure, List<ProductsEntity>>> execute() async {
    return await repository.getAllProducts();
  }
}
