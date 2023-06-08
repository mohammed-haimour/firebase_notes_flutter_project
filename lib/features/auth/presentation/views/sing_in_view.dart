import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_fire_base/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:notes_app_with_fire_base/features/auth/data/repos/auth_repo_impl.dart';
import 'package:notes_app_with_fire_base/features/auth/presentation/maneger/sing_in_cubit/sing_in_cubit.dart';
import 'package:notes_app_with_fire_base/features/auth/presentation/views/widgets/sing_in_view_body_bloc_consumer.dart';

class SingInView extends StatelessWidget {
  const SingInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SingInCubit(userSingin: AuthRepoImpl(AuthRemoteDataSourceImpl())),
      child: const Scaffold(
        body: SingInViewBodyBlocConsumer(),
      ),
    );
  }
}
