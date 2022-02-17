import 'package:dio/native_imp.dart';
import 'package:poccash/app/shared/core/constants/constants.dart';

import 'interceptors/custom_interceptors.dart';

class WebClient extends DioForNative {
  WebClient() {
    options.baseUrl = urlBase;
    options.connectTimeout = 10000;
    options.receiveTimeout = 10000;

    interceptors.add(CustomInterceptors());
  }
}
