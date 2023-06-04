import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lojahub/auth/form_submission_status.dart';
import 'package:lojahub/auth/login/login_bloc.dart';
import 'package:lojahub/auth/login/login_events.dart';
import 'package:lojahub/auth/login/login_states.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    print("Login button : ${formKey.currentState}");
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.formStatus is FormSubmitting
            ? const CircularProgressIndicator(
                backgroundColor: Color.fromRGBO(239, 156, 0, 1),
                color: Color.fromRGBO(228, 124, 27, 1),
              )
            : TextButton(
                onPressed: () {
                  final bool isValidated =
                      formKey.currentState?.validate() ?? false;
                  print(isValidated);
                  if (isValidated) {
                    print("validado");
                    context.read<LoginBloc>().add(LoginSubmited());
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  fixedSize: Size(MediaQuery.of(context).size.width - 70, 60),
                ),
                child: const Text(
                  "Entrar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
      },
    );
  }
}
