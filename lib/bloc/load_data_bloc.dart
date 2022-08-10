// ignore_for_file: void_checks

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_sampel/model/news_model.dart';
import 'package:equatable/equatable.dart';

import '../service/loadDataService.dart';

part 'load_data_event.dart';

part 'load_data_state.dart';

class LoadDataBloc extends Bloc<LoadDataEvent, LoadDataState> {
 LoadDataBloc() : super(LoadDataLoading());
//   LoadDataBloc() : super(LoadDataLoading()) {
//     on<LoadDataEvent>((event, emit) async* {
//       if (event is LoadDataInitial) {
//         yield (LoadDataInitial());
//       } else if (event is LoadNewsData) {
//         var result = await NewsDataService().fetchNewsData();
//         if (result == null) {
//           yield (LoadDataError());
//         } else {
//           yield (LoadDataSuccessful(result));
//             }}});}


  LoadDataState get initialState => LoadDataLoading();


  @override
  Stream<LoadDataState> mapEventToState(LoadDataEvent event,) async* {
    if (event is LoadDataInitial) {
      yield (LoadDataInitial());
    } else if (event is LoadNewsData) {
      var result = await NewsDataService().fetchNewsData();
      if (result == null) {
        yield (LoadDataError());
      } else {
        yield (LoadDataSuccessful(result));
      }
    }
  }
  }