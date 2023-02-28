
import 'package:json_annotation/json_annotation.dart';
part 'error.g.dart';


@JsonSerializable()
class ErrorModel {
  final int statusCode;
  final List<String> message;
  final String error;

  ErrorModel(this.statusCode, this.message, this.error);

  factory ErrorModel.fromJson(Map<String, dynamic> json) => _$ErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);

}
