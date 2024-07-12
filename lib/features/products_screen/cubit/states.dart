import '../../../domain/entities/products_entity.dart';

sealed class ProductsStates {}

class LoadingProductsState extends ProductsStates {}

class ErrorProductsState extends ProductsStates {}

class SuccessProductsState extends ProductsStates {
  final List<ProductsEntity> productsList;

  SuccessProductsState({required this.productsList});
}
