class SessionException {
  final int errorStatus;
  final String errorMessage;

  SessionException(this.errorStatus, this.errorMessage);

  SessionException.fromMap(Map map)
      : this.errorMessage = map["errors"][0],
        this.errorStatus = map["errorStatus"] ?? map["httpStatus"];
}
