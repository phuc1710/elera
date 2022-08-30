import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/params/course_details_fetch_request_params.dart';
import '../../core/params/course_fetch_request_params.dart';
import '../../core/params/course_lessons_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/utils/extensions.dart';
import '../../domain/repositories/course_repository.dart';
import '../datasources/remote/course_api_service.dart';
import '../models/course/course_fetch_response_model.dart';
import '../models/course_details/course_details_fetch_response_model.dart';
import '../models/course_lessons/course_lessons_fetch_response_model.dart';

@Injectable(as: CourseRepository)
class CourseRepositoryImpl implements CourseRepository {
  CourseRepositoryImpl(this._courseApiService);

  final CourseApiService _courseApiService;

  @override
  Future<DataState<CourseFetchResponseModel>> getCourseFetchRequest(
    CourseFetchRequestParams? params,
  ) async {
    try {
      final httpResponse = await _courseApiService.getCourseFetchRequest(
        isMockup: true,
        query: params,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }

      return DataFailed(httpResponse.dioError);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<CourseDetailsFetchResponseModel>>
      getCourseDetailsFetchRequest(
    CourseDetailsFetchRequestParams? params,
  ) async {
    try {
      final httpResponse = await _courseApiService.getCourseDetailsFetchRequest(
        isMockup: true,
        query: params,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }

      return DataFailed(httpResponse.dioError);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<CourseLessonsFetchResponseModel>>
      getCourseLessonsFetchRequest(
    CourseLessonsFetchRequestParams? params,
  ) async {
    try {
      final httpResponse = await _courseApiService.getCourseLessonsFetchRequest(
        isMockup: true,
        query: params,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }

      return DataFailed(httpResponse.dioError);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
