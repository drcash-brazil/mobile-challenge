class ClinicsException {
  final int errorStatus;
  final String errorMessage;

  ClinicsException(this.errorStatus, this.errorMessage);

  ClinicsException.fromMap(Map map)
      : this.errorMessage = map["errors"][0],
        this.errorStatus = map["errorStatus"] ?? map["httpStatus"];
}
