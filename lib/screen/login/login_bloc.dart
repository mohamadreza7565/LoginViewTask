import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:loginuitask/core/base_api_data_state.dart';
import 'package:loginuitask/data/model/error.dart';
import 'package:loginuitask/data/model/login.dart';
import 'package:meta/meta.dart';

import '../../data/repo/auth_repo.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepo mAuthRepo;

  LoginBloc(this.mAuthRepo) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {

      if (event is LoginStart) {

        emit(LoginLoading());

        await mAuthRepo.login(event.phoneNumber).then((value){

          if(value is Success<Login>){
            emit(LoginSuccess(value.data));
          }else if(value is Error<Login>){
            emit(LoginError(value.error));
          }

        });
      }

    });
  }
}
