import 'package:dio/dio.dart';
import 'package:loginuitask/data/model/error.dart';
import 'package:loginuitask/data/model/login.dart';

import '../base_api_data_state.dart';

class HttpClient {
  static Dio instance =
      Dio(BaseOptions(baseUrl: 'http://82.115.20.136:4000/api/v1'));
}



Error<Login> handleError(Object e) {
  if (e is DioError) {
    if (e.response == null) {
      return Error(ErrorModel(0, ["Error"], "Error"));
    } else {
      final error = ErrorModel.fromJson(e.response!.data["error"]);
      return Error(error);
    }
  } else {
    return Error(ErrorModel(0, ["Error"], "Error"));
  }
}

