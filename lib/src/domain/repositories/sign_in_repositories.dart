import '../../core/resources/data_state.dart';

abstract class SignInRepository {
  Future<DataState<String>> getUser();
}
