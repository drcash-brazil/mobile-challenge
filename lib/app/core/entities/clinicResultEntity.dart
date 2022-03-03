import 'package:equatable/equatable.dart';

//import './entities.dart';

class ClinicResultEntity extends Equatable {
  //final List<ClinicDetailsEntity> data;
  final int? pageNumber;
  final int? pageSize;
  final int? totalElements;
  final int? nextPage;
  final int? previousPage;
  final int? totalActiveClinic;

  @override
  List get props => [
        //data,
        pageNumber,
        pageSize,
        totalActiveClinic,
        nextPage,
        previousPage,
        totalActiveClinic
      ];

  const ClinicResultEntity({
    //required this.data,
    this.pageNumber,
    this.pageSize,
    this.totalElements,
    this.nextPage,
    this.previousPage,
    this.totalActiveClinic,
  });
}
