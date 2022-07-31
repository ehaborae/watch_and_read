import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_and_read/cubit/states.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(Initial());

  int counter = 0;

  void incrementCounter() {
    counter++;
    emit(Tapped());
  }
}
