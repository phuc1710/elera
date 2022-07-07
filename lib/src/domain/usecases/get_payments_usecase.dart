import 'package:injectable/injectable.dart';

import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/payment/payment_response_model.dart';
import '../repositories/user_repository.dart';

@injectable
class GetPaymentsUseCase
    implements UseCase<DataState<PaymentResponseModel?>, void> {
  GetPaymentsUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<DataState<PaymentResponseModel?>> call({params}) {
    return _userRepository.getPayments();
  }
}
