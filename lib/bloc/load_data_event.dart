part of 'load_data_bloc.dart';

abstract class LoadDataEvent extends Equatable {
  const LoadDataEvent();

  @override
  List<Object> get props => [];
}

class LoadNewsData extends LoadDataEvent {}
