import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/features/main/bloc/main_bloc.dart';
import 'package:test_task/features/main/products/models/product_model.dart';
import 'package:test_task/resources/app_colors.dart';

class SingleTile extends StatelessWidget {
  const SingleTile({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 24),
      width: width / 2,
      child: BlocBuilder<MainBloc, MainState>(builder: (context, state) {
        return Stack(
          alignment: Alignment.topRight,
          children: [
            SizedBox(
              height: 323,
              width: width / 2.28,
              child: Column(
                children: [
                  SizedBox(
                    child: Image(image: NetworkImage(product.imageUrl)),
                    height: 164,
                    width: width / 2.28,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: const Color.fromRGBO(138, 136, 132, 0.08),
                    ),
                    height: 36,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 3,
                          child: Text(
                            '${product.price} ₽',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              fontFamily: 'Open Sans',
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () => context.read<MainBloc>().add(OnCartTap(product.id)),
                            icon: context.read<MainBloc>().cart.contains(product.id)
                                ? const Icon(
                                    Icons.remove_shopping_cart_outlined,
                                    size: 16,
                                    color: AppColors.black,
                                  )
                                : const Image(image: AssetImage('assets/tab_bar/cart_act.png'), height: 16, width: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: Text(
                      product.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Open Sans',
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Text(
                          'Цвета:  ',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Open Sans',
                            color: AppColors.black,
                          ),
                        ),
                        ...List.generate(
                          product.colors.length,
                          (index) => Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                              color: hexToColor(product.colors[index].code),
                            ),
                            height: 15,
                            width: 15,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () => context.read<MainBloc>().add(OnFavoriteTap(product.id)),
              icon: context.read<MainBloc>().favorites.contains(product.id)
                  ? const Icon(
                      Icons.favorite,
                      color: AppColors.red,
                      size: 24,
                    )
                  : const Icon(
                      Icons.favorite_border,
                      color: AppColors.grey,
                      size: 24,
                    ),
            ),
          ],
        );
      }),
    );
  }

  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, code.length), radix: 16) + 0xFF000000);
  }
}
