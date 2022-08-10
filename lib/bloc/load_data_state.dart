part of 'load_data_bloc.dart';

abstract class LoadDataState extends Equatable {
  const LoadDataState();

  @override
  List<Object> get props => [];
}

class LoadDataInitial extends LoadDataState {}

class LoadDataLoading extends LoadDataState {}

class LoadDataError extends LoadDataState {}

class LoadDataSuccessful extends LoadDataState {
  final NewsModel newsData;

  const LoadDataSuccessful(this.newsData);
}
