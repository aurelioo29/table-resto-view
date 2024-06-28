import 'package:bloc/bloc.dart';
import 'package:flutter_pos_resto/core/session_manager.dart';
import 'package:meta/meta.dart';

part 'appsetting_state.dart';

class AppsettingCubit extends Cubit<AppsettingState> {
  final sessionManager = SessionManager();
  AppsettingCubit() : super(AppsettingInitial()) {
    checkSession();
  }

  void checkSession() {
    sessionManager.activeSession()
        ? emit(AppsettingAuthenticated())
        : emit(AppsettingAuthenticated());
  }
}
