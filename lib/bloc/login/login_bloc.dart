import 'package:bloc/bloc.dart';
import 'package:flutter_pos_resto/core/api_exception.dart';
import 'package:flutter_pos_resto/core/session_manager.dart';
import 'package:flutter_pos_resto/params/auth_param.dart';
import 'package:flutter_pos_resto/repo/auth_repository.dart';
import 'package:flutter_pos_resto/response/login_response.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final authRepository = AuthRepository();
  final sessionManager = SessionManager();

  LoginBloc() : super(LoginInitial()) {
    on<LoginPressed>(_onLoginPressed);
    on<LoginReset>(_onLoginReset);
  }

  void _onLoginPressed(LoginPressed event, Emitter<LoginState> emit) async{
    emit(LoginLoading());
    try{
      final param = AuthParam(username: event.param.username, password: event.param.password);
      LoginResponse response = await authRepository.signIn(param);
      sessionManager.setSession(
          response.authResponse!.token!,
          response.authResponse!.id!,
          response.authResponse!.firstName!,
          response.authResponse!.lastName!,
          response.authResponse!.email!);
      emit(LoginSuccess(loginResponse: response));
    } on ApiException catch(apiException){
      emit(LoginError(message: apiException.toString()));
    } catch(e) {
      emit(LoginFatalError(message: e.toString()));
    }
  }

  void _onLoginReset(LoginReset event, Emitter<LoginState> emit) {
    emit(LoginInitial());
  }
}