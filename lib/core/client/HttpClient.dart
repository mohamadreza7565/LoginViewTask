import 'package:dio/dio.dart';
import 'package:loginuitask/data/model/error.dart';
import 'package:loginuitask/data/model/login.dart';

import '../BaseDataState.dart';

class HttpClient {
  static Dio instance =
      Dio(BaseOptions(baseUrl: 'http://82.115.20.136:4000/api/v1'));
}


Future<Result<Login>> login(String phoneNumber) async {

  try {

    final response = await HttpClient.instance
        .post('/auth/login', data: {'phoneNumber': phoneNumber});

    final result = Login.fromJson(response.data["data"]);

    return Success(
      result,
    );
  } catch (e) {
    return handleError(e);
  }
}


Error<Login> handleError(Object e) {
  if (e is DioError) {
    if(e.response==null){
      return Error(ErrorModel(0, ["Error"], "Error"));
    }else{
      final error = ErrorModel.fromJson(e.response!.data["error"]);
      return Error(error);
    }
  } else {
    return Error(ErrorModel(0, ["Error"], "Error"));
  }
}
