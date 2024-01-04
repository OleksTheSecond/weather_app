import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? apiException;
  final LoactionException? loactionException;

  const DataState({this.data, this.apiException, this.loactionException});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataApiException<T> extends DataState<T> {
  const DataApiException(DioException exception)
      : super(apiException: exception);
}

class DataLocationException<T> extends DataState<T> {
  const DataLocationException(LoactionException exception)
      : super(loactionException: exception);
}

class LoactionException {
  String? message;
  LoactionException(this.message);
}
