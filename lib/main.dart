import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/my_app.dart';
import 'package:test_task/services/logger.dart';

void main() {
  Bloc.observer = Observer();
  runApp(MyApp());
}

class Observer extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    Logger.log('${bloc.runtimeType} $change');
  }

  @override
  void onEvent(bloc, event) {
    super.onEvent(bloc, event);
    Logger.log('Event: ${bloc.runtimeType} $event');
  }
}
