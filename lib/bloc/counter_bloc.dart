// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;

  CounterBloc() : super(CounterInitial()) {
    on<CounterDecrease>(onCounterDecrease);
    on<CounterReset>(onCounterReset);
    on<CounterIncrease>(onCounterIncrease);
  }

  void onCounterDecrease(
      CounterDecrease event, Emitter<CounterState> emit) async {
    counter--;
    emit(CounterUpdate(counter));
  }

  void onCounterReset(CounterReset event, Emitter<CounterState> emit) async {
    counter = 0;
    emit(CounterUpdate(counter));
  }

  void onCounterIncrease(
      CounterIncrease event, Emitter<CounterState> emit) async {
    counter++;
    emit(CounterUpdate(counter));
  }
}
