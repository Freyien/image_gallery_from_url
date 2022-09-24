import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_from_url/core/ui/utils/keyboard.dart';
import 'package:image_gallery_from_url/core/ui/utils/toast.dart';
import 'package:image_gallery_from_url/core/ui/widgets/circle_icon_button.dart';
import 'package:image_gallery_from_url/core/ui/widgets/input_text.dart';
import 'package:image_gallery_from_url/core/ui/widgets/primary_button.dart';
import 'package:image_gallery_from_url/core/ui/widgets/scroll_fill_remaining.dart';
import 'package:image_gallery_from_url/di/dependency_injection.dart';
import 'package:image_gallery_from_url/features/login/domain/entities/entities.dart';
import 'package:image_gallery_from_url/features/login/ui/bloc/login_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

part 'package:image_gallery_from_url/features/login/ui/widgets/form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginBloc>(),
      child: BlocListener<LoginBloc, LoginState>(
        listener: _loginListener,
        child: Scaffold(
          body: SafeArea(
            child: ScrollFillRemaining(
              child: Column(
                children: const [
                  SizedBox(height: 24),

                  // Logo
                  Expanded(
                    flex: 3,
                    child: FlutterLogo(
                      size: 150,
                      style: FlutterLogoStyle.stacked,
                    ),
                  ),
                  SizedBox(height: 24),

                  // Form
                  _Form(),

                  // Empty space
                  Expanded(
                    child: SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _loginListener(BuildContext context, LoginState state) {
    if (state is LoadingState) {
      context.loaderOverlay.show();
    } else if (state is InvalidCredentialsState) {
      context.loaderOverlay.hide();
      Toast.showError('Credenciales inválidas');
    } else if (state is FailedState) {
      context.loaderOverlay.hide();
      Toast.showError('Ha ocurrido un error inesperado');
    } else if (state is SuccessLoginState) {
      context.loaderOverlay.hide();
      Navigator.pushReplacementNamed(context, 'home');
    }
  }
}
