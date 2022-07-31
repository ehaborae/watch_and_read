import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_and_read/pages/result/result_cubit/state.dart';

class ResultCubit extends Cubit<ResultCubitState> {
  ResultCubit() : super(ResultInitial());

  int counter = 0;

  void counterGet({required int amount}) {
    counter = amount;
    emit(CounterGet());
  }

  void incrementCounter() {
    counter += 1;
    emit(ResultTaped());
  }
}
