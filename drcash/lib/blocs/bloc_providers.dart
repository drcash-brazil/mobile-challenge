import 'package:dio/dio.dart';
import 'package:drcash/blocs/auth/auth_cubit.dart';
import 'package:drcash/blocs/clinics/clinics_cubit.dart';
import 'package:drcash/repositories/auth_repository.dart';
import 'package:drcash/repositories/clinic_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlockProviders {
  static final Dio _dio = Dio();

  static final List<BlocProvider> providers = [
    BlocProvider<AuthCubit>(
      create: (_) => AuthCubit(AuthRepository(_dio)),
    ),
    BlocProvider<ClinicsCubit>(
      create: (_) => ClinicsCubit(ClinicRepository(_dio)),
    ),
  ];
}
