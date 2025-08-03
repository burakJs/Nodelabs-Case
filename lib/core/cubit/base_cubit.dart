import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<State> extends Cubit<State> {
  BaseCubit(super.initialState);

  void safeEmit(State state) {
    if (isClosed) return;
    emit(state);
  }
}
