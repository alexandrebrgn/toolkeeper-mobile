import 'package:campus/config/app_settings.dart';
import 'package:http/http.dart' as http;

import 'api_response.dart';
import 'dart:developer' as developer;

class Api {

  static String token ='';

  static Future<ApiResponse> get({required String? route, Map<String, String>? urlParams, token=false}) async{
    developer.log('Api - get(): \n\t Route: $route \n\t UrlParams : ${urlParams.toString()}\n\t Token expected : $token');
    Status status = Status.BUSY;

    if (route != null) {
      final uri = Uri(scheme: 'http',
          host: AppSettings.API_URI,
          port: 8080,
          path: '${AppSettings.API_PATH}/${AppSettings.API_VERSION}$route');

      Map<String, String> headers = {
        "Accept": "*/*",
        "Content-Type": "application/json"
      };

      if (token) {
        headers.addAll({"Authorization" : "Bearer ${Api.token}"});
      }

      final resp = await http.get(uri, headers: headers);

      switch (resp.statusCode) {
        case 200 :
          status = Status.COMPLETED;
          developer.log('Api - post(): \n\tAPI is responding : ${resp.statusCode} - ${resp.body}');
          break;
        default:
          developer.log('Api - post(): \n\tAPI respond with an error : ${resp.statusCode} - ${resp.body}');
          status = Status.ERROR;
      }
      return ApiResponse(status, resp.body, resp.statusCode.toString());
    }
    developer.log('Api - post(): \n\t No route specified');
    return ApiResponse(Status.ERROR, null, 'No route specified');
  }

  static Future<ApiResponse> post({required String? route, Map<String, String>? bodyParams, token=false}) async{
    developer.log('Api - post(): \n\t Route: $route');
    Status status = Status.BUSY;

    // Création de la route
    if (route != null) {
      final uri = Uri(scheme: 'http',
      host: AppSettings.API_URI,
      port: 8080,
      path: '${AppSettings.API_PATH}/${AppSettings.API_VERSION}$route');

      final resp = await http.post(uri, body: bodyParams);

      switch (resp.statusCode) {
        case 200 :
          status = Status.COMPLETED;
          developer.log('Api - post(): \n\tAPI is responding : ${resp.statusCode} - ${resp.body}');
          break;
        default:
          developer.log('Api - post(): \n\tAPI respond with an error : ${resp.statusCode} - ${resp.body}');
          status = Status.ERROR;
      }
      return ApiResponse(status, resp.body, resp.statusCode.toString());
    }
    developer.log('Api - post(): \n\t No route specified');
    return ApiResponse(Status.ERROR, null, 'No route specified');
  }

  static void put(String route) {

  }

  static void delete(String route) {

  }
}

