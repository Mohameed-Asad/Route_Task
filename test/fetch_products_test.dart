import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:route_task/core/failure/failure.dart';
import 'package:route_task/core/services/web_service.dart';
import 'package:route_task/data/data_source/products_data_source/products_data_source.dart';
import 'package:route_task/data/data_source/products_data_source/products_data_source_imp.dart';
import 'package:route_task/data/repository_imp/products_repository_imp.dart';
import 'package:route_task/domain/entities/products_entity.dart';
import 'package:route_task/domain/repository/products_repository.dart';
import 'package:route_task/domain/use_case/get_products_use_case.dart';

void main() {
  test(
      "fetching data from api and get list of products when the call to repository is successful",
      () async {
    // Arrange
    final WebService service = WebService();
    ProductsDataSource dataSource = ProductsDataSourceImp(service.freeDio);
    ProductsRepository repository = ProductsRepositoryImp(dataSource);
    GetProductsUseCase productsUseCase = GetProductsUseCase(repository);
    // Act
    var result = await productsUseCase.execute();
    // Assert
    expect(result, Either<Failure, List<ProductsEntity>>);
  });
}
