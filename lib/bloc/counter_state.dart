part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterUpdate extends CounterState {
  late final int counter;
  CounterUpdate(this.counter);
}
