abstract class IStorageRepository {
  Future<String> getAccessToken();
  setAccessToken(String value);
  Future<String> getRefreshToken();
  setRefreshToken(String value);
  Future<String> getDateToken();
  setDateToken(String value);
  Future<String> getUserCpf();
  setUserCpf(String value);
  Future<int> getUserId();
  setUserId(int value);
  Future<String> getUserName();
  setUserName(String value);
  Future<void> loadVariables();
  Future<void> saveStorage();
  Future<bool> removeAll();
}
