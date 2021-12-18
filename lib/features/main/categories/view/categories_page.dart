import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/features/main/bloc/main_bloc.dart';
import 'package:test_task/resources/app_colors.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<MainBloc>().add(LoadCategories());
    return Center(
      child: BlocBuilder<MainBloc, MainState>(builder: (context, state) {
        if (state is ShowScreen) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: context.read<MainBloc>().categoriesList.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text(
                            context.read<MainBloc>().categoriesList[index].title,
                            style: const TextStyle(color: AppColors.black, fontSize: 16, fontFamily: 'Open Sans'),
                          ),
                          trailing: const Icon(Icons.navigate_next, color: AppColors.grey, size: 24),
                          onTap: () {
                            context.read<MainBloc>().add(OnCategoryTap(index + 1));
                          }
                        ),
                        const Divider(),
                      ],
                    ),
                  ));
        }
        return const CircularProgressIndicator();
      }),
    );
  }
}
