import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/params/contact_fetch_request_params.dart';
import '../../../core/params/contact_selection_request_params.dart';
import '../../../core/params/create_new_pin_request_params.dart';
import '../../../core/params/fill_your_profile_request_params.dart';
import '../../../core/params/friend_invite_params.dart';
import '../../../core/params/new_card_params.dart';
import '../../../core/params/sign_in_request_params.dart';
import '../../../core/params/sign_up_request_params.dart';
import '../../../core/params/update_profile_params.dart';
import '../../models/contact_selection/contact_fetch_response_model.dart';
import '../../models/contact_selection/contact_selection_response_model.dart';
import '../../models/create_new_pin/create_new_pin_response_model.dart';
import '../../models/fill_your_profile/fill_your_profile_response_model.dart';
import '../../../core/nd_network/network/end_points.dart';
import '../../models/friends/friend_response_model.dart';
import '../../models/general_response/general_response_model.dart';
import '../../models/payment/payment_response_model.dart';
import '../../models/profile/profile_response_model.dart';
import '../../models/sign_in/sign_in_response_model.dart';
import '../../models/sign_up/sign_up_response_model.dart';

part 'user_api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class UserApiService {
  factory UserApiService(Dio dio, {String baseUrl}) = _UserApiService;

  @POST(EndPoints.signIn)
  Future<HttpResponse<SignInResponseModel>> postSignInRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() SignInRequestParams? body,
  });

  @POST(EndPoints.signUp)
  Future<HttpResponse<SignUpResponseModel>> postSignUpRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() SignUpRequestParams? body,
  });

  @POST(EndPoints.fillYourProfile)
  Future<HttpResponse<FillYourProfileResponseModel>>
      postFillYourProfileRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() FillYourProfileRequestParams? body,
  });

  @POST(EndPoints.createNewPin)
  Future<HttpResponse<CreateNewPinResponseModel>> postCreateNewPinRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() CreateNewPinRequestParams? body,
  });

  @GET(EndPoints.fetchContact)
  Future<HttpResponse<ContactFetchResponseModel>> getContactFetchRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() ContactFetchRequestParams? query,
  });

  @POST(EndPoints.selectContact)
  Future<HttpResponse<ContactSelectionResponseModel>>
      postContactSelectionRequest({
    @Header('isMockup') bool? isMockup,
    @Body() ContactSelectionRequestParams? body,
  });

  @GET(EndPoints.profile)
  Future<HttpResponse<ProfileResponseModel?>> getProfile({
    @Header('isMockup') bool? isMockup,
  });

  @POST(EndPoints.profile)
  Future<HttpResponse<GeneralResponseModel?>> updateProfile(
    @Queries() UpdateProfileParams params, {
    @Header('isMockup') bool? isMockup,
  });

  @POST(EndPoints.addNewCard)
  Future<HttpResponse<GeneralResponseModel?>> addNewCard(
    @Queries() NewCardParams params, {
    @Header('isMockup') bool? isMockup,
  });

  @GET(EndPoints.inviteFriends)
  Future<HttpResponse<FriendResponseModel?>> getInviteFriends({
    @Header('isMockup') bool? isMockup,
  });

  @POST(EndPoints.inviteFriends)
  Future<HttpResponse<FriendResponseModel?>> inviteFriend(
    @Queries() FriendInviteParams params, {
    @Header('isMockup') bool? isMockup,
  });

  @GET(EndPoints.payments)
  Future<HttpResponse<PaymentResponseModel?>> getPayments({
    @Header('isMockup') bool? isMockup,
  });
}
