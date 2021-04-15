import 'package:json_annotation/json_annotation.dart';

part 'invalid_request_exception.g.dart';

/// Returned by the GPT-3 API when there is an error.
@JsonSerializable()
class InvalidRequestException implements Exception {
  final String message;

  InvalidRequestException(this.message);

  @override
  String toString() {
    return 'InvalidRequestException: $message';
  }

  factory InvalidRequestException.fromJson(Map<String, dynamic> json) =>
      _$InvalidRequestExceptionFromJson(json);

  Map<String, dynamic> toJson() => _$InvalidRequestExceptionToJson(this);
}
