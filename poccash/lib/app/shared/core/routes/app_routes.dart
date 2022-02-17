class AppRoutes {
  //In MODULES
  static String get auth => "/auth";
  static String get home => "/home";
  static String get formSelected => "/formSelected";
  static String get photoPage => "/photoPage";
  static String get notePage => "/notePage";
  static String get signaturePage => "/sinaturePage";
//IN NAVIGATION
  static String get homeFormSelected => "/home$formSelected";
  static String get homeFormSelectedPhoto => "/home$formSelected$photoPage";
  static String get homeFormSelectedNote => "/home$formSelected$notePage";
  static String get homeFormSelectedSignature =>
      "/home$formSelected$signaturePage";
}
