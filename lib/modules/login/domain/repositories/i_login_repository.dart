abstract class ILoginRepository {
  Future call(String email, String password);
}
