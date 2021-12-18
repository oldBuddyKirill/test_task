import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/features/main/products/bloc/check_box_bloc.dart';
import 'package:test_task/features/main/products/bloc/sort_bloc.dart';
import 'package:test_task/resources/app_colors.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({Key? key}) : super(key: key);

  final _filterListCheckboxBloc = List.generate(3, (index) => CheckboxBloc(false));
  final _sortBloc = SortBloc('По популярности');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Expanded(
            child: PopupMenuButton(
              itemBuilder: (context) => [
                ...List.generate(
                  _filterListCheckboxBloc.length,
                  (index) => PopupMenuItem(
                    child: BlocBuilder<CheckboxBloc, bool>(
                        bloc: _filterListCheckboxBloc[index],
                        builder: (context, state) {
                          return CheckboxListTile(
                            value: state,
                            title: Text(
                              'Filter $index',
                              style: const TextStyle(fontSize: 12),
                            ),
                            onChanged: (value) {
                              if (value != null) _filterListCheckboxBloc[index].add(value);
                            },
                          );
                        }),
                  ),
                ),
              ],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(width: 12),
                  SizedBox(child: Image(image: AssetImage('assets/filter.png'), height: 16, width: 16)),
                  SizedBox(width: 8),
                  Text(
                    'Фильтры',
                    style: TextStyle(
                        fontFamily: 'Open Sans', fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.black),
                  ),
                ],
              ),
            ),
          ),
          Container(height: 24, width: 1, color: const Color.fromRGBO(138, 136, 132, 0.24)),
          Expanded(
            child: BlocBuilder<SortBloc, String>(
                bloc: _sortBloc,
                builder: (context, state) {
                  return Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 40),
                        child: DropdownButton<String>(
                          value: state,
                          underline: const SizedBox(),
                          iconEnabledColor: Colors.transparent,
                          // icon: const Icon(Icons.compare_arrows_sharp, size: 16,),
                          // iconSize: 16,
                          alignment: AlignmentDirectional.center,
                          style: const TextStyle(
                            fontFamily: 'Open Sans',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                          onChanged: (String? newValue) {
                            if (newValue != null) _sortBloc.add(SortEvent(newValue));
                          },
                          items: _sortBloc.sortingTypes
                              .map<DropdownMenuItem<String>>((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
                              .toList(),
                        ),
                      ),
                      const Positioned(
                        child: SizedBox(child: Image(image: AssetImage('assets/sorting.png'), height: 16, width: 16)),
                        top: 12,
                        left: 16,
                      ),
                    ],
                  );
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.compare_arrows_sharp, size: 16),
                      Text(
                        'По популярности',
                        style: TextStyle(
                            fontFamily: 'Open Sans', fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.black),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
