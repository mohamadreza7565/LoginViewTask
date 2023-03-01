
import 'package:loginuitask/core/base_api_data_state.dart';
import 'package:loginuitask/data/model/login.dart';

import '../../core/client/auth_api_service.dart';

class AuthRepo {

 final AuthApiService mAuthApiService;

  AuthRepo(this.mAuthApiService);


  Future<Result<Login>> login(String phoneNumber) {
    return mAuthApiService.login(phoneNumber);
  }

}