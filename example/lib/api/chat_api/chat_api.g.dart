// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ChatApi implements ChatApi {
  _ChatApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'http://152.136.93.14:8888';
  }

  final Dio _dio;

  String baseUrl;

  @override
  login(map) async {
    ArgumentError.checkNotNull(map, 'map');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request('/login',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ChatResponse<Login>.fromJson(_result.data);
    return Future.value(value);
  }
}
