import 'package:poccash/app/shared/database/storage/shared_prefs_storage.dart';
import 'package:poccash/app/shared/repositories/interfaces/i_storage_repository.dart';
import 'package:poccash/app/shared/settings/global_setting.dart';

class StorageRepository implements IStorageRepository {
  late SharedPreferenceStorage sharedPreferenceStorage;

  StorageRepository() {
    sharedPreferenceStorage = SharedPreferenceStorage.instance;
  }

  String accessToken = "access_token";
  String refreshToken = "refresh_token";
  String dateToken = "date_token";
  String userCpf = "user_cpf";
  String userId = "user_id";
  String userName = "user_name";

  @override
  Future<String> getAccessToken() async {
    return await sharedPreferenceStorage.getString(accessToken);
  }

  @override
  Future<String> getRefreshToken() async {
    return await sharedPreferenceStorage.getString(refreshToken);
  }

  @override
  Future<String> getDateToken() async {
    return await sharedPreferenceStorage.getString(dateToken);
  }

  @override
  Future<String> getUserCpf() async {
    return await sharedPreferenceStorage.getString(userCpf);
  }

  @override
  Future<int> getUserId() async {
    return await sharedPreferenceStorage.getInt(userId);
  }

  @override
  Future<String> getUserName() async {
    return await sharedPreferenceStorage.getString(userName);
  }

  @override
  setAccessToken(String value) async {
    return await sharedPreferenceStorage.setString(accessToken, value);
  }

  @override
  setRefreshToken(String value) async {
    return await sharedPreferenceStorage.setString(refreshToken, value);
  }

  @override
  setDateToken(String value) async {
    return await sharedPreferenceStorage.setString(dateToken, value);
  }

  @override
  setUserCpf(String value) async {
    return await sharedPreferenceStorage.setString(userCpf, value);
  }

  @override
  setUserId(int value) async {
    return await sharedPreferenceStorage.setInt(userId, value);
  }

  @override
  setUserName(String value) async {
    return await sharedPreferenceStorage.setString(userName, value);
  }

  @override
  Future<void> loadVariables() async {
    GlobalSettings.globalInfoModel.accessToken = await getAccessToken();
    GlobalSettings.globalInfoModel.refreshToken = await getRefreshToken();
  }

  @override
  Future<void> saveStorage() async {
    await setAccessToken(GlobalSettings.globalInfoModel.accessToken);
    await setRefreshToken(GlobalSettings.globalInfoModel.refreshToken);
  }

  @override
  Future<bool> removeAll() async {
    await sharedPreferenceStorage.remove(accessToken);
    await sharedPreferenceStorage.remove(refreshToken);

    return Future.value(true);
  }
}
