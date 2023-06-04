import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lojahub/auth/login/login_bloc.dart';
import 'package:lojahub/auth/login/login_events.dart';
import 'package:lojahub/auth/login/login_states.dart';

class TextFormFieldInputComponent extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;

  const TextFormFieldInputComponent({
    super.key,
    required this.hintText,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
            hoverColor: const Color.fromRGBO(113, 101, 227, 1),
            border: InputBorder.none,
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color.fromRGBO(44, 41, 72, 1),
              fontSize: 15,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: (value) => state.isValidEmail
              ? null
              : 'A senha deve conter, pelo menos, 6 caracteres.',
          onChanged: (value) => BlocProvider.of<LoginBloc>(context).add(
            LoginEmailChanged(value),
          ),
        );
      },
    );
  }
}
