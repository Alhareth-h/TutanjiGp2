import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gp2/models/user_model.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<MainEvent>((event, emit) {});
    on<RebuildUiEvent>(onRebuildUiEvent);
  }

  static RegularUserInfoModel? regularUserInfoModel;


  FutureOr<void> onRebuildUiEvent(
      RebuildUiEvent event, Emitter<MainState> emit) {
    emit(RebuildUiState());
  }


}
