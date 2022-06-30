import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../core/network_old/api.dart';
import '../../../../core/utils/constants.dart';
import '../../../../data/models/course/course_response_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeCourseInitial()) {
    on<CourseFetched>(_onCourseFetched);
  }

  Future<void> _onCourseFetched(
    CourseFetched event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeCourseLoading());
    try {
      Future<dynamic>.delayed(const Duration(seconds: 1));
      final res = await Api.getCourses();
      if (res?.status == StatusCode.success) {
        emit(HomeCourseSuccess(res?.data?.courseList ?? []));
      } else {
        emit(HomeCourseFailed(res?.message));
      }
    } catch (_) {
      emit(HomeCourseFailed(null));
    }
  }
}
