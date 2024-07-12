import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:route_task/core/config/app_theme_manager.dart';
import 'package:route_task/core/config/constants.dart';
import 'package:route_task/features/products_screen/cubit/cubit.dart';
import 'package:route_task/features/products_screen/cubit/states.dart';
import 'package:route_task/features/products_screen/widgets/custom_text_field.dart';
import 'package:route_task/features/products_screen/widgets/loading_widget.dart';
import 'package:route_task/features/products_screen/widgets/product_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  var cubit = ProductsCubit();

  @override
  void initState() {
    cubit.getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
              vertical: Constants.getMediaQuery(context).height * 0.015,
              horizontal: Constants.getMediaQuery(context).width * 0.04),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SvgPicture.asset("assets/images/route_logo.svg"),
            SizedBox(
              height: Constants.getMediaQuery(context).height * 0.023,
            ),
            // search Widget
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                          left: Constants.getMediaQuery(context).width * 0.06,
                          right:
                              Constants.getMediaQuery(context).width * 0.023),
                      child: SvgPicture.asset(
                        "assets/icons/icon_search.svg",
                        height: 27,
                      ),
                    ),
                    hint: "what do you search for?",
                  ),
                ),
                SizedBox(
                  width: Constants.getMediaQuery(context).width * 0.045,
                ),
                SvgPicture.asset("assets/icons/shopping_cart_icon.svg")
              ],
            ),
            SizedBox(
              height: Constants.getMediaQuery(context).height * 0.025,
            ),
            BlocBuilder<ProductsCubit, ProductsStates>(
              bloc: cubit,
              builder: (context, state) {
                switch (state) {
                  case LoadingProductsState():
                    {
                      return loadingWidget();
                    }
                  case ErrorProductsState():
                    {
                      return const Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Text(
                              "something went wrong",
                              style: AppThemeManager.text14,
                            )),
                          ],
                        ),
                      );
                    }
                  case SuccessProductsState():
                    {
                      var dataList = state.productsList;
                      return Expanded(
                        child: GridView.builder(
                            itemCount: dataList.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 16,
                                    crossAxisSpacing: 16,
                                    childAspectRatio: 0.82),
                            itemBuilder: (context, index) =>
                                ProductWidget(productModel: dataList[index])),
                      );
                    }
                }
              },
            ),
            SizedBox(
              height: Constants.getMediaQuery(context).height * 0.003,
            ),
          ]),
        ),
      ),
    );
  }
}
