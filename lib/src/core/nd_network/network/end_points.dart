// ignore: avoid_classes_with_only_static_members
class EndPoints {
  EndPoints._();

  static const String sandboxBaseUrl = 'https://mobile-api-dev.zema.com.vn';
  static const String stagingBaseUrl = 'https://mobile-api-staging.zema.com.vn';
  static const String productionBaseUrl = 'https://mobile-api.zema.com.vn';
  static const String chatSandboxBaseUrl =
      'https://mchat-socket-dev.ngocdunggroup.com.vn';
  static const String chatProductionBaseUrl =
      'https://mchat-socket.ngocdunggroup.com.vn';
  static const String loyaltyTermsAndCondition =
      'https://thammyvienngocdung.com/quy-dinh-va-dieu-khoan/';
  static const String notificationRead = '/notifications/read';
  static const String getNotifications = '/notifications';
  static const String readAllNotifications = '/notifications/read/all';
  static const String supportRequest = '/support';
  static const String feedback = '/rating/{id}';
  static const String appointmentTicket = '/appointments/tickets';
  static const String logout = '/logout';
  static const String homeNotification = '/home/notification';
  static const String collaborator = '/collaborator';
  static const String collaboratorHistory = '/collaborator/history';
  static const String confirmOTP = '/login/validation';
  static const String homeInfo = '/home';
  static const String news = '/news';
  static const String contact = '/social';
  static const String referral = '/collaborator/referral';
  static const String signIn = '/sign_in';
  static const String signUp = '/sign_up';
  static const String profile = '/profile';
  static const String services = '/collaborator/services';
  static const String configurations = '/configurations';
  static const String listNews = '/news/hot';
  static const String newsContent = '/news/detail/{id}';
  static const String transactionHistory = '/transactionHistory';
  static const String voucherDetails = '/customer-promotion/detail/{id}';
  static const String mapVoucher = '/vouchers/rewards';
  static const String events = '/events';
  static const String eventDetails = '/events/detail';
  static const String registerEvent = '/events/register';
  static const String getDetailSubscribedEvents = '/events/register';
  static const String getHistory = '/history';
  static const String homeMenu = '/home_menu';
  static const String watchLiveStream = '/livestream';
  static const String popupHome = '/popup';
  static const String newVouchers = '/customer-promotion/available';
  static const String expiredVouchers = '/customer-promotion/used';
  static const String vouchersHistory = '/customer-promotion/history';
  static const String giveVoucher = '/vouchers/give';
  static const String province = '/branch/provinces';
  static const String branch = '/branch';
  static const String appointmentDays = '/appointments/days';
  static const String timeSlot = '/appointments/time-slot';
  static const String service = '/service';
  static const String ticket = '/appointments/tickets';
  static const String createTicket = '${EndPoints.ticket}/create';
  static const String updateTicket = '${EndPoints.ticket}/update';
  static const String cancelTicket = '${EndPoints.ticket}/cancel';
  static const String detailService = '/service/detail/{id}';
  static const String loyaltyVoucherDetails = '/member/bonus/detail/{id}';
  static const String appointmentServices = '/appointments/promotions';
  static const String appointmentShortServices = '/appointments/services';

  static const String collection = '/collection';
  static const String collectionSearchText = '/collection/search-text';
  static const String collectionSearchByText = '/collection/search';
  static const String collectionSearchByTag = '/collection/tag';
  static const String collectionSearchDelete = '/collection/search/delete';
  static const String collectionDetails = '/collection/detail/{id}';
  static const String collectionRelate = '/collection/related';
  static const String collectionAction = '/collection/action/{id}';

  static const String promotion = '/promotion';
  static const String promotionDetails = '/promotion/detail/{id}';
  static const String loyaltyVoucher = '/member/bonus';
  static const String receiveGift = '/member/bonus/receive-gift';
  static const String giveGift = '/member/bonus/give-gift';
  static const String game = '/minigame';
}

class LoyaltyEndPoints {
  static const String product = 'ZEMA-APP';
  static const String token = '31b1de9abd40e96c070ee17af7a0d8c8';
  static const String signature = '214d2922b6a2668cc444cce5204a5927';
  static const String sandboxLoyaltyBaseUrl =
      'https://gw-eloyalty-dev.zema.com.vn';
  static const String stagingLoyaltyBaseUrl =
      'https://gw-eloyalty-dev.ngocdunggroup.com';
  static const String productionLoyaltyBaseUrl =
      'https://gw-eloyalty.zema.com.vn';
  static const bag = 'ZEMA';
  static const defaultCategory = 1;
  static const defaultLimit = 5;
  static const defaultLimitFilterItems = 50;
  static const defaultSort = '-created_date';
  static const account = '/point/accounts/{accountId}';
  static const history = '/point/accounts/{accountId}/bags/{bag}/transactions';
  static const rankings = '/point/rankings/ZEMA';
  static const shopItems = '/shop/shops_aggregates';
  static const transactions = '/shop/transactions';
  static const transactionDetails = '/shop/transactions/{itemId}';
  static const shopItemnDetails = '/shop/products/{itemId}';
  static const rewards = '/shop/rewards';
  static const filterShopItems = '/shop/products';
  static const actionReward = '/action-reward/handle_action';
  static const checkActionReward = '/action-reward/handle_check_action';
  static const campaignId = 2;
}

class StaticEndPoints {
  static const String product = 'ZEMA_APP';
  static const String token = 'de4fefbc0f4602388af2';
  static const String baseUrl = 'https://upload.ngocdunggroup.com.vn';
  static const String upload = '/upload/images';
  static const String uploadFiles = '/upload/files';
  static const String uploadAudio = '/upload/audios';
}
