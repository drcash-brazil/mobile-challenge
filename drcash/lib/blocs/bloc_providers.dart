import 'package:drcash/blocs/auth/auth_cubit.dart';
import 'package:drcash/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlockProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<AuthCubit>(
      create: (_) => AuthCubit(AuthRepository()),
    ),
  ];
}
