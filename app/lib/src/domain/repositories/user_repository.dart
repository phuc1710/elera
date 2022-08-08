import '../../core/params/contact_fetch_request_params.dart';
import '../../core/params/contact_selection_request_params.dart';
import '../../core/params/create_new_pin_request_params.dart';
import '../../core/params/fill_your_profile_request_params.dart';
import '../../core/params/friend_invite_params.dart';
import '../../core/params/new_card_params.dart';
import '../../core/params/password_creation_request_params.dart';
import '../../core/params/pin_entry_request_params.dart';
import '../../core/params/pin_sending_request_params.dart';
import '../../core/params/sign_in_request_params.dart';
import '../../core/params/sign_up_request_params.dart';
import '../../core/params/update_profile_params.dart';
import '../../core/resources/data_state.dart';
import '../../data/models/contact_selection/contact_fetch_response_model.dart';
import '../../data/models/contact_selection/contact_selection_response_model.dart';
import '../../data/models/create_new_pin/create_new_pin_response_model.dart';
import '../../data/models/fill_your_profile/fill_your_profile_response_model.dart';
import '../../data/models/friends/friend_response_model.dart';
import '../../data/models/general_response/general_response_model.dart';
import '../../data/models/password_creation/password_creation_response_model.dart';
import '../../data/models/payment/payment_response_model.dart';
import '../../data/models/pin_entry/pin_entry_response_model.dart';
import '../../data/models/pin_sending/pin_sending_response_model.dart';
import '../../data/models/profile/profile_response_model.dart';
import '../../data/models/sign_in/sign_in_response_model.dart';
import '../../data/models/sign_up/sign_up_response_model.dart';

abstract class UserRepository {
  Future<bool> saveAccessToken(final String? token);

  Future<String> get accessToken;

  Future<DataState<SignInResponseModel>> postSignInRequest(
    SignInRequestParams? params,
  );

  Future<DataState<SignUpResponseModel>> postSignUpRequest(
    SignUpRequestParams? params,
  );

  Future<DataState<FillYourProfileResponseModel>> postFillYourProfileRequest(
    FillYourProfileRequestParams? params,
  );

  Future<DataState<CreateNewPinResponseModel>> postCreateNewPinRequest(
    CreateNewPinRequestParams? params,
  );

  Future<DataState<ContactFetchResponseModel>> getContactFetchRequest(
    ContactFetchRequestParams? params,
  );

  Future<DataState<ContactSelectionResponseModel>> postContactSelectionRequest(
    ContactSelectionRequestParams? params,
  );

  Future<DataState<PinSendingResponseModel>> getPinSendingRequest(
    PinSendingRequestParams? params,
  );

  Future<DataState<PinEntryResponseModel>> postPinEntryRequest(
    PinEntryRequestParams? params,
  );

  Future<DataState<PasswordCreationResponseModel>> postPasswordCreationRequest(
    PasswordCreationRequestParams? params,
  );

  Future<DataState<ProfileResponseModel?>> getProfile();

  Future<DataState<GeneralResponseModel?>> updateProfile(
    UpdateProfileParams params,
  );

  Future<DataState<GeneralResponseModel?>> addNewCard(NewCardParams params);

  Future<DataState<FriendResponseModel?>> getInviteFriends();

  Future<DataState<FriendResponseModel?>> inviteFriend(
    FriendInviteParams params,
  );

  Future<DataState<PaymentResponseModel?>> getPayments();
}
