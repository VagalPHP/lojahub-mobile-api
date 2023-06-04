abstract class LoginEvents {}

class LoginEmailChanged extends LoginEvents {
  final String email;
  LoginEmailChanged(this.email);
}

class LoginPasswordChanged extends LoginEvents {
  final String password;
  LoginPasswordChanged(this.password);
}

class LoginSubmited extends LoginEvents {}
