import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poccash/app/shared/core/constants/constants.dart';
import 'package:poccash/app/shared/repositories/storage_repository.dart';
import 'package:poccash/app/shared/settings/global_setting.dart';

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Content-Type'] = "application/json";

    if (GlobalSettings.globalInfoModel.accessToken.isNotEmpty) {
      var token = options.path == urlAuthRrefreshToken
          ? GlobalSettings.globalInfoModel.refreshToken
          : GlobalSettings.globalInfoModel.accessToken;
      options.headers['Authorization'] = "Bearer $token";
    }

    return super.onRequest(options, handler);
  }

  // @override
  // onResponse(Response response, ResponseInterceptorHandler handler) {

  //   return super.onResponse(response, handler);
  // }

  @override
  onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response == null || err.response?.statusCode == 0) {
      return super.onError(err, handler);
    }
    try {
      if (err.response?.statusCode == 401) {
        final StorageRepository storage = Modular.get();
        var dio = Modular.get<DioForNative>();
        var options = err.response!.requestOptions;
        var optionsRefresh = options.copyWith();
        optionsRefresh.path = urlAuthRrefreshToken;
        optionsRefresh.method = "POST";
        dio.fetch(optionsRefresh).then(
          (refresh) async {
            GlobalSettings.globalInfoModel.accessToken =
                refresh.data[storage.accessToken];
            await storage.saveStorage();

            dio.fetch(options).then((req) => handler.resolve(req));
          },
        );
        return;
      }
    } catch (_) {}
    //  return handler.next(err);
    return super.onError(err, handler);
  }
}
