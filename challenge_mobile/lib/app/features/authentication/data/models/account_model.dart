import 'package:challenge_mobile/app/features/authentication/domain/entities/account_entity.dart';
import 'package:meta/meta.dart';

class AcccountModel extends AccountEntity {
  const AcccountModel({
    @required String accessToken,
    @required String refreshToken,
    @required String tokenType,
    @required int expiresIn,
  });

  factory AcccountModel.fromJson(Map<String, dynamic> json) {
    return AcccountModel(
      accessToken: json["access_token"],
      refreshToken: json["refresh_token"],
      expiresIn: json["expires_in"],
      tokenType: json["token_type"],
    );
  }
}
