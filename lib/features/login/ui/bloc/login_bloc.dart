import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_from_url/features/login/domain/entities/entities.dart';
import 'package:image_gallery_from_url/features/login/domain/failures/auth_failure.dart';
import 'package:image_gallery_from_url/features/login/domain/repositories/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._authRepository) : super(initialState) {
    on<ChangeEmailEvent>(_changeEmail);
    on<ChangePasswordEvent>(_changePassword);
    on<ChangeShowPasswordEvent>(_changeShowPassword);
    on<SignInEvent>(_signInEvent);
  }

  final AuthRepository _authRepository;

  static LoginState get initialState => InitialState(
        LoginFormEntity(),
      );

  void _changeEmail(ChangeEmailEvent event, Emitter<LoginState> emit) {
    emit(
      EmailChangedState(
        state.loginForm.copyWith(
          email: EmailEntity.dirty(event.email),
        ),
      ),
    );
  }

  void _changePassword(ChangePasswordEvent event, Emitter<LoginState> emit) {
    emit(
      PasswordChangedState(
        state.loginForm.copyWith(
          password: PasswordEntity.dirty(event.password),
        ),
      ),
    );
  }

  void _changeShowPassword(
    ChangeShowPasswordEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(
      ShowPasswordChangedState(
        state.loginForm.copyWith(
          showPassword: !state.loginForm.showPassword,
        ),
      ),
    );
  }

  Future<void> _signInEvent(
    SignInEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(
      LoadingState(state.loginForm),
    );

    final email = state.loginForm.email.value;
    final password = state.loginForm.password.value;

    final response = await _authRepository.signIn(email, password);

    response.fold(
      (failure) {
        if (failure is InvalidCredentialsFailure) {
          emit(
            InvalidCredentialsState(state.loginForm),
          );
        } else {
          emit(
            FailedState(state.loginForm),
          );
        }
      },
      (_) => emit(
        SuccessLoginState(state.loginForm),
      ),
    );
  }
}
