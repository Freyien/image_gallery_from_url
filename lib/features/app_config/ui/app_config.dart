import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_from_url/di/dependency_injection.dart';
import 'package:image_gallery_from_url/features/app_config/ui/bloc/app_config_bloc.dart';

class AppConfigPage extends StatelessWidget {
  const AppConfigPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppConfigBloc(sl())
        ..add(
          LoadCredentialsEvent(),
        ),
      child: BlocListener<AppConfigBloc, AppConfigState>(
        listener: (context, state) {
          if (state is LoadedState) {
            final islogged = state.appConfigEntity.islogged;

            if (islogged) {
              Navigator.pushReplacementNamed(context, 'home');
            } else {
              Navigator.pushReplacementNamed(context, 'login');
            }
          } else if (state is FailedState) {
            Navigator.pushReplacementNamed(context, 'login');
          }
        },
        child: const Scaffold(),
      ),
    );
  }
}
