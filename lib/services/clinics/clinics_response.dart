class ClinicsResponse {
  final List? content;
  final int? pageNumber;
  final int? pageSize;

  ClinicsResponse({
    this.content,
    this.pageNumber,
    this.pageSize,
  });

  ClinicsResponse.fromResponse({required Map data})
      : this.content = data["data"],
        this.pageNumber = data["pageNumber"],
        this.pageSize = data["pageSize"];
}
