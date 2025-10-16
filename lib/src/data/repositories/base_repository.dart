import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fake_store/src/config/config.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/dio.dart';

abstract class APIBaseRepository {
  @protected
  Future<DataState<T>> getStateOf<T>({
    required Future<HttpResponse<T>> Function() request,
  }) async {
    try {
      final httpResponse = await request();
      if (httpResponse.response.statusCode == HttpStatus.ok ||
          httpResponse.response.statusCode == HttpStatus.created ||
          httpResponse.response.statusCode == HttpStatus.notModified) {
        return DataSuccess(httpResponse.data);
      } else {
        throw DioException(
          requestOptions: httpResponse.response.requestOptions,
          response: httpResponse.response,
        );
      }
    } on DioException catch (error) {
      return DataFailed(error);
    }
  }
}
