import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

enum HttpMethod { GET, POST, PUT, PATCH, DELETE }

class NetworkApiServices {
  Future<dynamic> apiRequest({
    required HttpMethod method,
    required String url,
    dynamic body,
    Map<String, String>? headers,
  }) async {
    if (kDebugMode) print('Request URL: $url');
    if (kDebugMode) print('Request Body: $body');

    dynamic responseJson;
    headers ??= {
      "Authorization": "Bearer",
      "Content-Type": "application/json",
    };

    try {
      var uri = Uri.parse(url);
      http.Response response;

      switch (method) {
        case HttpMethod.GET:
          response = await http.get(uri, headers: headers);
          break;
        case HttpMethod.POST:
          response = await http.post(
            uri,
            body: body != null ? jsonEncode(body) : null,
            headers: headers,
          );
          break;
        case HttpMethod.PUT:
          response = await http.put(
            uri,
            body: body != null ? jsonEncode(body) : null,
            headers: headers,
          );
          break;
        case HttpMethod.PATCH:
          response = await http.patch(
            uri,
            body: body != null ? jsonEncode(body) : null,
            headers: headers,
          );
          break;
        case HttpMethod.DELETE:
          response = await http.delete(uri, headers: headers);
          break;
        default:
          throw UnsupportedError("Unsupported HTTP method");
      }

      responseJson = _returnJsonResponse(response);
    } catch (e) {
      if (kDebugMode) print('Error occurred: $e');
      rethrow; // Propagate the exception to be handled by the caller
    }
    return responseJson;
  }

  dynamic _returnJsonResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        return jsonDecode(response.body);
      default:
        throw Exception();
    }
  }


}
