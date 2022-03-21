import 'package:equatable/equatable.dart';

class ClinicParams extends Equatable {
  final int pageNumber;
  final int pageSize;
  final String orderBy;
  final String city;
  final String state;

  const ClinicParams(
      {this.pageNumber, this.pageSize, this.orderBy, this.city, this.state});

  @override
  List<Object> get props => [pageNumber, pageSize, orderBy, city, state];
}
