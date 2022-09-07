import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/params/mentor_courses_fetch_request_params.dart';
import '../../core/params/mentor_fetch_request_params.dart';
import '../../core/params/mentor_students_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/utils/extensions.dart';
import '../../domain/repositories/mentor_repository.dart';
import '../datasources/remote/mentor_api_service.dart';
import '../models/mentor/mentor_fetch_response_model.dart';
import '../models/mentor_courses/mentor_courses_fetch_response_model.dart';
import '../models/mentor_students/mentor_students_fetch_response_model.dart';

@Injectable(as: MentorRepository)
class MentorRepositoryImpl implements MentorRepository {
  MentorRepositoryImpl(this._mentorApiService);

  final MentorApiService _mentorApiService;

  @override
  Future<DataState<MentorFetchResponseModel>> getMentorFetchRequest(
    MentorFetchRequestParams? params,
  ) async {
    try {
      final httpResponse = await _mentorApiService.getMentorFetchRequest(
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
  Future<DataState<MentorCoursesFetchResponseModel>>
      getMentorCoursesFetchRequest(
    MentorCoursesFetchRequestParams? params,
  ) async {
    try {
      final httpResponse = await _mentorApiService.getMentorCoursesFetchRequest(
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
  Future<DataState<MentorStudentsFetchResponseModel>>
      getMentorStudentsFetchRequest(
    MentorStudentsFetchRequestParams? params,
  ) async {
    try {
      final httpResponse = await _mentorApiService.getMentorStudentsFetchRequest(
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
