// Project imports:
import '../network/end_points.dart';

final Map<String, String> mapMockApiForGetRequest = {
  EndPoints.listNews: 'list_news',
  EndPoints.voucherDetails: 'details_voucher',
  EndPoints.appointmentTicket: 'appointments',
  '${EndPoints.appointmentTicket}0': 'appointment_cancel',
  EndPoints.getNotifications: 'notifications',
  '${EndPoints.feedback}0': 'detail_feedback',
  EndPoints.supportRequest: 'supportrequest',
  EndPoints.collaboratorHistory: 'collaborator_history',
  EndPoints.eventDetails: 'detail_event',
  EndPoints.getDetailSubscribedEvents: 'detail_subscribed_event',
  EndPoints.getHistory: 'history',
  EndPoints.login: 'login',
  EndPoints.confirmOTP: 'login_validation',
  EndPoints.profile: 'profiles',
  EndPoints.homeMenu: 'home_menu',
  EndPoints.homeInfo: 'home_screen',
  EndPoints.events: 'events',
  EndPoints.logout: 'logout',
  EndPoints.configurations: 'configurations',
  EndPoints.referral: 'profiles',
  EndPoints.notificationRead: 'notifications_read',
  EndPoints.news: 'news',
  EndPoints.contact: 'contact',
  EndPoints.watchLiveStream: 'livestream',
  EndPoints.mapVoucher: 'map_voucher',
  EndPoints.newVouchers: 'new_vouchers',
  EndPoints.expiredVouchers: 'new_vouchers',
  EndPoints.vouchersHistory: 'vouchers_history',
  EndPoints.branch: 'branch',
  EndPoints.timeSlot: 'time_slot',
  EndPoints.appointmentDays: 'appointment_day',
  EndPoints.service: 'service',
  EndPoints.detailService: 'detail_service',
  EndPoints.collection: 'collection',
  EndPoints.collectionDetails: 'collection_details',
  EndPoints.collectionSearchByText: 'collection_search',
  EndPoints.province: 'province',
  EndPoints.appointmentServices: 'appointment_services',
  EndPoints.popupHome: 'popup_home',
  EndPoints.loyaltyVoucher: 'loyalty_voucher',
  EndPoints.loyaltyVoucherDetails: 'loyalty_detail_voucher',
  EndPoints.promotionDetails: 'detail_promotion',
  EndPoints.game: 'game_qa',
  EndPoints.appointmentShortServices: 'short_services.json',
  LoyaltyEndPoints.history: 'transaction_history',
  LoyaltyEndPoints.shopItems: 'shop',
  LoyaltyEndPoints.shopItemnDetails: 'shop_item_details',
  LoyaltyEndPoints.filterShopItems: 'shop_filter_products',
  LoyaltyEndPoints.transactions: 'transactions',
  LoyaltyEndPoints.transactionDetails: 'transaction_details',
  LoyaltyEndPoints.rewards: 'rewards',
  LoyaltyEndPoints.account: 'account',
  LoyaltyEndPoints.rankings: 'ranking',
};

final Map<String, String> mapMockApiForPostRequest = {
  EndPoints.listNews: 'list_news',
  EndPoints.voucherDetails: 'details_voucher',
  EndPoints.appointmentTicket: 'appointments',
  '${EndPoints.appointmentTicket}0': 'appointment_cancel',
  EndPoints.getNotifications: 'notifications',
  '${EndPoints.feedback}0': 'detail_feedback',
  EndPoints.supportRequest: 'supportrequest',
  EndPoints.collaboratorHistory: 'collaborator_history',
  EndPoints.eventDetails: 'detail_event',
  EndPoints.getDetailSubscribedEvents: 'detail_subscribed_event',
  EndPoints.getHistory: 'history',
  EndPoints.login: 'login',
  EndPoints.confirmOTP: 'login_validation',
  EndPoints.profile: 'profiles',
  EndPoints.homeMenu: 'home_menu',
  EndPoints.homeInfo: 'home_screen',
  EndPoints.events: 'events',
  EndPoints.logout: 'logout',
  EndPoints.configurations: 'configurations',
  EndPoints.referral: 'profiles',
  EndPoints.notificationRead: 'notifications_read',
  EndPoints.news: 'news',
  EndPoints.contact: 'contact',
  EndPoints.watchLiveStream: 'livestream',
  EndPoints.mapVoucher: 'map_voucher',
  EndPoints.newVouchers: 'new_vouchers',
  EndPoints.expiredVouchers: 'new_vouchers',
  EndPoints.vouchersHistory: 'vouchers_history',
  EndPoints.branch: 'branch',
  EndPoints.timeSlot: 'time_slot',
  EndPoints.appointmentDays: 'appointment_day',
  EndPoints.service: 'service',
  EndPoints.detailService: 'detail_service',
  EndPoints.collection: 'collection',
  EndPoints.collectionDetails: 'collection_details',
  EndPoints.collectionSearchByText: 'collection_search',
  EndPoints.province: 'province',
  EndPoints.appointmentServices: 'appointment_services',
  EndPoints.popupHome: 'popup_home',
  EndPoints.loyaltyVoucher: 'loyalty_voucher',
  EndPoints.loyaltyVoucherDetails: 'loyalty_detail_voucher',
  EndPoints.promotionDetails: 'detail_promotion',
  EndPoints.game: 'result_game_out_of_turn',
  LoyaltyEndPoints.history: 'transaction_history',
  LoyaltyEndPoints.shopItems: 'shop',
  LoyaltyEndPoints.shopItemnDetails: 'shop_item_details',
  LoyaltyEndPoints.filterShopItems: 'shop_filter_products',
  LoyaltyEndPoints.transactions: 'transactions',
  LoyaltyEndPoints.transactionDetails: 'transaction_details',
  LoyaltyEndPoints.rewards: 'rewards',
  LoyaltyEndPoints.account: 'account',
  LoyaltyEndPoints.rankings: 'ranking',
};

String? getJsonNameForGetRequest(
  String endpoint, {
  Map<String, dynamic>? queryParameters,
}) {
  if (endpoint.contains('/shop/products/')) {
    endpoint = LoyaltyEndPoints.shopItemnDetails;

    return mapMockApiForGetRequest[endpoint];
  }
  if (endpoint.contains('/shop/transactions/')) {
    endpoint = LoyaltyEndPoints.transactionDetails;
  }
  if (endpoint.contains('/point/accounts/') &&
      !endpoint.contains('/transactions')) {
    endpoint = LoyaltyEndPoints.account;
  }
  if (endpoint.contains('/point/accounts/') &&
      endpoint.contains('/transactions')) {
    endpoint = LoyaltyEndPoints.history;
  }
  if (endpoint.contains('/shop/products')) {
    endpoint = LoyaltyEndPoints.filterShopItems;
  }
  if (endpoint.contains('/appointments/tickets/')) {
    endpoint = '${EndPoints.appointmentTicket}0';
  }
  if (endpoint.contains('/collection/search/')) {
    endpoint = EndPoints.collectionDetails;
  }
  if (endpoint.contains('/notifications?page')) {
    endpoint = EndPoints.getNotifications;
  }
  if (endpoint.contains('/member/bonus/detail')) {
    endpoint = EndPoints.loyaltyVoucherDetails;
  }
  if (endpoint.contains('/customer-promotion/detail')) {
    endpoint = EndPoints.voucherDetails;
  }
  if (endpoint.contains('/collection/detail')) {
    endpoint = EndPoints.collectionDetails;
  }
  if (endpoint.contains('/promotion/detail/')) {
    endpoint = EndPoints.promotionDetails;
  }

  return mapMockApiForGetRequest[endpoint];
}

String? getJsonNameForPostRequest(
  String endpoint, {
  dynamic data,
  Map<String, dynamic>? queryParameters,
}) {
  if (endpoint.contains('/shop/products/')) {
    endpoint = LoyaltyEndPoints.shopItemnDetails;

    return mapMockApiForPostRequest[endpoint];
  }
  if (endpoint.contains('/shop/transactions/')) {
    endpoint = LoyaltyEndPoints.transactionDetails;
  }
  if (endpoint.contains('/point/accounts/') &&
      !endpoint.contains('/transactions')) {
    endpoint = LoyaltyEndPoints.account;
  }
  if (endpoint.contains('/point/accounts/') &&
      endpoint.contains('/transactions')) {
    endpoint = LoyaltyEndPoints.history;
  }
  if (endpoint.contains('/shop/products')) {
    endpoint = LoyaltyEndPoints.filterShopItems;
  }
  if (endpoint.contains('/appointments/tickets/')) {
    endpoint = '${EndPoints.appointmentTicket}0';
  }
  if (endpoint.contains('/collection/search/')) {
    endpoint = EndPoints.collectionDetails;
  }
  if (endpoint.contains('/notifications?page')) {
    endpoint = EndPoints.getNotifications;
  }
  if (endpoint.contains('/member/bonus/detail')) {
    endpoint = EndPoints.loyaltyVoucherDetails;
  }
  if (endpoint.contains('/customer-promotion/detail')) {
    endpoint = EndPoints.voucherDetails;
  }
  if (endpoint.contains('/collection/detail')) {
    endpoint = EndPoints.collectionDetails;
  }
  if (endpoint.contains('/promotion/detail/')) {
    endpoint = EndPoints.promotionDetails;
  }

  return mapMockApiForPostRequest[endpoint];
}
