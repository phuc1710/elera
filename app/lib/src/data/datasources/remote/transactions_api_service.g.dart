// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _TransactionsApiService implements TransactionsApiService {
  _TransactionsApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://103.63.215.141:7412/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<TransactionsResponseModel>> getTransactionsRequest(
      {isMockup, query}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(query?.toJson() ?? <String, dynamic>{});
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'isMockup': isMockup};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<TransactionsResponseModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/transaction',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionsResponseModel.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
