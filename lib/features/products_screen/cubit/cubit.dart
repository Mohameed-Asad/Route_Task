import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task/core/services/web_service.dart';
import 'package:route_task/data/data_source/products_data_source/products_data_source.dart';
import 'package:route_task/data/data_source/products_data_source/products_data_source_imp.dart';
import 'package:route_task/data/repository_imp/products_repository_imp.dart';
import 'package:route_task/domain/repository/products_repository.dart';
import 'package:route_task/domain/use_case/get_products_use_case.dart';
import 'package:route_task/features/products_screen/cubit/states.dart';
import '../../../core/failure/server_failure.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(LoadingProductsState());

  final WebService _service = WebService();
  late GetProductsUseCase useCase;
  late ProductsRepository repository;
  late ProductsDataSource dataSource;

  // fetch data
  Future<bool> getAllProducts() async {
    emit(LoadingProductsState());
    dataSource = ProductsDataSourceImp(_service.freeDio);
    repository = ProductsRepositoryImp(dataSource);
    useCase = GetProductsUseCase(repository);
    final result = await useCase.execute();
    return result.fold((fail) {
      var error = fail as ServerFailure;
      emit(ErrorProductsState());
      return Future.value(false);
    }, (data) {
      emit(SuccessProductsState(productsList: data));
      return Future.value(true);
    });
  }

  // get old price
  String priceBeforeSale(double currentPrice, num discountPercentage) {
    return (currentPrice / (1 - (discountPercentage / 100))).toStringAsFixed(2);
  }
}
