import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:route_task/core/config/Constants.dart';
import 'package:route_task/core/config/app_theme_manager.dart';
import 'package:route_task/domain/entities/products_entity.dart';
import 'package:route_task/features/products_screen/cubit/cubit.dart';
import 'package:route_task/features/products_screen/widgets/custom_cached_image.dart';

class ProductWidget extends StatefulWidget {
  final ProductsEntity productModel;

  const ProductWidget({super.key, required this.productModel});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  var cubit = ProductsCubit();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              width: 2, color: AppThemeManager.primaryColor.withOpacity(0.3))),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12)),
                child: SizedBox(
                    height: Constants.getMediaQuery(context).height * 0.125,
                    width: Constants.getMediaQuery(context).width,
                    child: customCachedImage(
                        context, widget.productModel.images?[0] ?? "")),
              ),
              Positioned(
                  right: 3,
                  top: 7,
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              Constants.getMediaQuery(context).width * 0.02,
                          vertical:
                              Constants.getMediaQuery(context).height * 0.007),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: SvgPicture.asset(
                          "assets/icons/add_favourite_icon.svg")))
            ],
          ),
          SizedBox(
            height: Constants.getMediaQuery(context).height * 0.007,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Constants.getMediaQuery(context).width * 0.015),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.productModel.title,
                  style: AppThemeManager.text14,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  widget.productModel.description ?? "",
                  style: AppThemeManager.text14,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: Constants.getMediaQuery(context).height * 0.0045,
                ),
                Row(
                  children: [
                    Text(
                      "EGP ${widget.productModel.price}",
                      style: AppThemeManager.text14,
                    ),
                    SizedBox(
                      width: Constants.getMediaQuery(context).width * 0.03,
                    ),
                    Expanded(
                      child: Text(
                        "${cubit.priceBeforeSale(widget.productModel.price, widget.productModel.discountPercentage!)} EGP",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color:
                                AppThemeManager.primaryColor.withOpacity(0.6),
                            decoration: TextDecoration.lineThrough,
                            decorationColor:
                                AppThemeManager.primaryColor.withOpacity(0.6),
                            decorationThickness: 1.5,
                            fontSize: 13),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Review (${widget.productModel.rating.toStringAsFixed(1)})",
                      style: AppThemeManager.text14.copyWith(fontSize: 12),
                    ),
                    const Icon(
                      Icons.star,
                      color: Color(0xFFFDD835),
                      size: 18,
                    ),
                    const Spacer(),
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppThemeManager.primaryColor),
                      child: const Icon(
                        Icons.add_rounded,
                        size: 28,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
