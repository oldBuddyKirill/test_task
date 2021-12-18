import 'package:flutter_bloc/flutter_bloc.dart';

class SortBloc extends Bloc<SortEvent, String> {
  SortBloc(String initialState) : super(initialState) {
    on<SortEvent>((event, emit) {
      emit(event.item);
    });
  }
  List<String> sortingTypes = ['По популярности', 'По стоимости', 'По необходимости'];
}

class SortEvent {
  final String item;
  SortEvent(this.item);
}