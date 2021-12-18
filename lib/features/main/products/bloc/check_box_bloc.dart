import 'package:flutter_bloc/flutter_bloc.dart';

class CheckboxBloc extends Bloc<bool, bool> {
  CheckboxBloc(bool initialState) : super(initialState) {
    on<bool>((event, emit) => emit(event));
  }
}