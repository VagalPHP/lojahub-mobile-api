import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lojahub/auth/login/login_bloc.dart';
import 'package:lojahub/auth/login/login_events.dart';
import 'package:lojahub/auth/login/login_states.dart';
import 'package:lojahub/presenter/ui/components/login/EmailInputField.dart';
import 'package:lojahub/presenter/ui/components/login/LoginButton.dart';
import 'package:lojahub/repositories/auth_repository.dart';

import '../ui/components/LogoHeaderComponent.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _hidePassword = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print(_formKey.currentState?.validate());
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(
          RepositoryProvider.of<AuthRepository>(context),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 37),
              child: Center(
                child: Column(
                  children: [
                    const LogoHeaderComponent(
                      headerText: "Faça o seu login para acessar",
                    ),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 92),
                        child: Column(
                          children: [
                            const EmailInputField(),
                            Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Container()),
                            PasswordFormField(), // Manipula states da aplicação, precisa ser um método que retorna a widget
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: LoginButton(
                                formKey: _formKey,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Esqueceu a senha?",
                                  style: TextStyle(
                                      color: Color.fromRGBO(28, 25, 57, 0.8),
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      color: Color.fromRGBO(170, 170, 170, 1),
                      thickness: 1,
                      indent: 70,
                      endIndent: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 91),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(239, 156, 0, 1),
                          fixedSize:
                              Size(MediaQuery.of(context).size.width - 70, 60),
                        ),
                        child: const Text(
                          "Cadastre-se",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// PasswordFormField
  /// Gera um campo de senha, com a opção de exibir/ocultar senha enquanto digita.
  /// final bool _hidePassword (esse formato de variável é necessário na statefull widget na qual será inserido)
  BlocBuilder<LoginBloc, LoginState> PasswordFormField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        obscureText: _hidePassword,
        decoration: InputDecoration(
          hoverColor: const Color.fromRGBO(113, 101, 227, 1),
          border: InputBorder.none,
          hintText: "Senha",
          hintStyle: const TextStyle(
            color: Color.fromRGBO(44, 41, 72, 1),
            fontSize: 15,
          ),
          prefixIcon: const Icon(Icons.lock_rounded),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _hidePassword = !_hidePassword;
              });
            },
            icon: const Icon(Icons.remove_red_eye),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) => state.isValidPassword
            ? null
            : 'A senha deve conter, pelo menos, 6 caracteres.',
        onChanged: (value) =>
            context.read<LoginBloc>().add(LoginPasswordChanged(value)),
      );
    });
  }
}
