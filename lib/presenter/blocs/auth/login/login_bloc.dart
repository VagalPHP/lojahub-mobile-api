import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lojahub/auth/form_submission_status.dart';
import 'package:lojahub/auth/login/login_events.dart';
import 'package:lojahub/auth/login/login_states.dart';
import 'package:lojahub/repositories/auth_repository.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  final AuthRepository authRepository;

  LoginBloc(this.authRepository) : super(LoginState()) {
    @override
    Stream<LoginState> mapEventToState(LoginEvents event) async* {
      if (event is LoginEmailChanged) {
        yield state.copyWith(email: event.email);
      }
      if (event is LoginPasswordChanged) {
        yield state.copyWith(email: event.password);
      }
    }
    // on<LoginEmailChanged>((event, emit) async {
    //   state.copyWith(email: event.email);
    // });

    // on<LoginPasswordChanged>((event, emit) async {
    //   state.copyWith(password: event.password);
    // });

    // on<LoginSubmited>((event, emit) async {
    //   state.copyWith(formStatus: FormSubmitting());

    //   try {
    //     authRepository.login();
    //   } catch (e) {
    //     state.copyWith(formStatus: SubmissionFailed(e as Exception));
    //   }
    // });
  }
}
