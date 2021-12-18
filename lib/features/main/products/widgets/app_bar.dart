import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/features/main/bloc/main_bloc.dart';
import 'package:test_task/resources/app_colors.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool? isChecked1 = true;
    bool? isChecked2 = false;
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Expanded(
            child: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: StatefulBuilder(builder: (context, state) {
                    return CheckboxListTile(
                      value: isChecked1,
                      title: Text('test'),
                      onChanged: (value) {
                        print('Checkbox: value = $value');
                        state(() => isChecked1 = value);
                        // context.read<MainBloc>().add(OnFilterTap(value));
                        // context.read<MainBloc>().emit(ShowScreen());
                      },
                    );
                  }),
                ),
              ],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.settings_outlined, size: 16),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.compare_arrows_sharp, size: 16),
                Text(
                  'По популярности',
                  style: TextStyle(
                      fontFamily: 'Open Sans', fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
