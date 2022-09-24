part of 'package:image_gallery_from_url/features/login/ui/login_page.dart';

class _Form extends StatelessWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();

    return Form(
      key: key,
      child: Column(
        children: [
          // Email input
          const _EmailInput(),
          const SizedBox(height: 12),

          // Password input
          const _PasswordInput(),
          const SizedBox(height: 48),

          // Sign in button
          PrimaryButton(
            text: 'Sign In',
            onPressed: () {
              Keyboard.close(context);
              if (!key.currentState!.validate()) {
                return;
              }

              context.read<LoginBloc>().add(SignInEvent());
            },
          ),
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputText(
      hintText: 'Email',
      prefixIcon: const Icon(Icons.mail_outline),
      keyboardType: TextInputType.emailAddress,
      onChanged: (email) {
        final bloc = context.read<LoginBloc>();
        bloc.add(ChangeEmailEvent(email));
      },
      validator: (_) {
        final bloc = context.read<LoginBloc>();
        final email = bloc.state.loginForm.email;
        if (email.valid) return null;

        switch (email.error!) {
          case EmailValidationError.invalid:
            return 'Email inválido';
        }
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();

    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (p, c) => c is ShowPasswordChangedState,
      builder: (context, state) {
        final showPassword = !state.loginForm.showPassword;

        return InputText(
          hintText: 'Password',
          prefixIcon: const Icon(Icons.lock_outline),
          suffixIcon: CircleIconButton(
            onPressed: () {
              bloc.add(ChangeShowPasswordEvent());
            },
            icon: showPassword
                ? const Icon(CupertinoIcons.eye_slash)
                : const Icon(CupertinoIcons.eye),
          ),
          obscureText: showPassword,
          textInputAction: TextInputAction.done,
          onChanged: (password) {
            bloc.add(ChangePasswordEvent(password));
          },
          validator: (_) {
            final password = bloc.state.loginForm.password;
            if (password.valid) return null;

            switch (password.error!) {
              case PasswordError.empty:
                return 'Campo obligatorio';
            }
          },
        );
      },
    );
  }
}
