// ignore_for_file: avoid_print

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

abstract class IHttpClient {
  Future<Response> get(String? endPoint, {Map<String, String>? headers});
  Future<Response> post(String? endPoint, String body,
      {Map<String, String>? headers});
  Future<Response> patch(String? endPoint, String body,
      {Map<String, String>? headers});
  Future<Response> put(String? endPoint, String body,
      {Map<String, String>? headers});
  Future<Response> delete(String? endPoint, {Map<String, String>? headers});
}

class HttpClient extends IHttpClient implements InterceptorContract {
  late HttpClientWithInterceptor _client;

  HttpClient() {
    _client = HttpClientWithInterceptor.build(interceptors: [this]);
  }

  @override
  Future<RequestData> interceptRequest({RequestData? data}) async {
    var token = await ParseUser.currentUser();
    data?.headers['Content-Type'] = "application/json";
    if (data!.headers.containsKey('Authorization')) {
      data.headers["Authorization"] = token;
    }

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData? data}) async {
    print('Response ${data!.url}');
    print('status code:  ${data.statusCode}');
    print('headers ${data.headers}');
    print('body: ${data.body}');

    return data;
  }

  @override
  Future<Response> get(String? endPoint,
      {Map<String, dynamic>? headers}) async {
    final response = await _client.get(
      endPoint!.toUri(),
      headers: {
        'X-Parse-Application-Id': 'bZTSzIYal3FzAcLtuMVclhWMj7lbmGBednBdb2TX',
        'X-Parse-REST-API-Key': 'VkJxEmNtjkJgnnq2eZdnj0fj4I85AgZCVnBNv7x0',
        'Content-Type': 'application/json'
      },
    );
    return response;
  }

  @override
  Future<Response> post(
    String? endPoint,
    String body, {
    Map<String, String>? headers,
  }) async {
    final response = await _client.post(
      endPoint!.toUri(),
      body: body,
      headers: {
        'X-Parse-Application-Id': 'bZTSzIYal3FzAcLtuMVclhWMj7lbmGBednBdb2TX',
        'X-Parse-REST-API-Key': 'VkJxEmNtjkJgnnq2eZdnj0fj4I85AgZCVnBNv7x0',
        'Content-Type': 'application/json'
      },
    );
    return response;
  }

  @override
  Future<Response> put(
    String? endPoint,
    String body, {
    Map<String, String>? headers,
  }) async {
    final response = await _client.put(
      endPoint!.toUri(),
      body: body,
      headers: {
        'X-Parse-Application-Id': 'bZTSzIYal3FzAcLtuMVclhWMj7lbmGBednBdb2TX',
        'X-Parse-REST-API-Key': 'VkJxEmNtjkJgnnq2eZdnj0fj4I85AgZCVnBNv7x0',
        'Content-Type': 'application/json'
      },
    );
    return response;
  }

  @override
  Future<Response> patch(
    String? endPoint,
    String body, {
    Map<String, String>? headers,
  }) async {
    final response = await _client.patch(
      endPoint!.toUri(),
      body: body,
      headers: {
        'X-Parse-Application-Id': 'bZTSzIYal3FzAcLtuMVclhWMj7lbmGBednBdb2TX',
        'X-Parse-REST-API-Key': 'VkJxEmNtjkJgnnq2eZdnj0fj4I85AgZCVnBNv7x0',
        'Content-Type': 'application/json'
      },
    );
    return response;
  }

  @override
  Future<Response> delete(String? endPoint,
      {Map<String, String>? headers}) async {
    final response = await _client.delete(
      endPoint!.toUri(),
      headers: {
        'X-Parse-Application-Id': 'bZTSzIYal3FzAcLtuMVclhWMj7lbmGBednBdb2TX',
        'X-Parse-REST-API-Key': 'VkJxEmNtjkJgnnq2eZdnj0fj4I85AgZCVnBNv7x0',
        'Content-Type': 'application/json'
      },
    );
    return response;
  }
}
