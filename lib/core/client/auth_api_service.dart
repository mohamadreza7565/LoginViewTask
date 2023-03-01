import 'package:dio/dio.dart';

import '../../data/model/login.dart';
import '../base_api_data_state.dart';
import 'http_client.dart';

class AuthApiService {

  final Dio mDia;

  AuthApiService(this.mDia);

  Future<Result<Login>> login(String phoneNumber) async {
    try {
      final response = await mDia
          .post('/auth/login', data: {'phoneNumber': phoneNumber});

      final result = Login.fromJson(response.data['data']);

      return Success(
        result,
      );
    } catch (e) {
      return handleError(e);
    }
  }
}
