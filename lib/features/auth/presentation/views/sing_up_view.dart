import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_fire_base/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:notes_app_with_fire_base/features/auth/data/repos/auth_repo_impl.dart';
import 'package:notes_app_with_fire_base/features/auth/presentation/maneger/sing_up_cubit/sing_up_cubit.dart';
import 'package:notes_app_with_fire_base/features/auth/presentation/views/widgets/sing_up_view_body_bloc_consumer.dart';

class SingUpView extends StatelessWidget {
  const SingUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SingUpCubit(AuthRepoImpl(AuthRemoteDataSourceImpl())),
      child: const Scaffold(
        body: SingUpViewBodyBlocConsumer(),
      ),
    );
  }
}
