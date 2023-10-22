import 'package:jp_app_flutter/domain/models/base/base_error_model.dart';

abstract class Result<T> {}

class Failure<T> implements Result<T> {
  T? data;
  BaseErrorModel error;
  Failure({
    this.data,
    required this.error
  });
}

class Success<T> implements Result<T> {
  T data;
  Success({
    required this.data
  });
}