// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:lojahub/screens/DashboardScreen.dart';

import 'components/LogoHeaderComponent.dart';
import 'repositories/sales_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lojahub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(16, 48, 79, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'DM Sans',
      ),
      home: RepositoryProvider(
        create: (context) => SalesRepository(),
        child: const LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 37),
          child: Center(
            child: Column(
              children: [
                LogoHeaderComponent(
                  headerText: "Faça o seu login para acessar",
                ),
                Padding(
                  padding: EdgeInsets.only(top: 92),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hoverColor: Color.fromRGBO(113, 101, 227, 1),
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.email),
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(44, 41, 72, 1),
                            fontSize: 15,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: TextFormField(
                          obscureText: hidePassword,
                          decoration: InputDecoration(
                            hoverColor: Color.fromRGBO(113, 101, 227, 1),
                            border: InputBorder.none,
                            hintText: "Senha",
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(44, 41, 72, 1),
                              fontSize: 15,
                            ),
                            prefixIcon: Icon(Icons.lock_rounded),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              icon: Icon(Icons.remove_red_eye),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            fixedSize: Size(
                                MediaQuery.of(context).size.width - 70, 60),
                          ),
                          child: Text(
                            "Entrar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Esqueceu a senha?",
                            style: TextStyle(
                                color: Color.fromRGBO(28, 25, 57, 0.8),
                                fontSize: 15),
                          ),
                        ),
                      ),
                      Divider(
                        color: Color.fromRGBO(170, 170, 170, 1),
                        thickness: 1,
                        indent: 70,
                        endIndent: 70,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 91),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Color.fromRGBO(239, 156, 0, 1),
                            fixedSize: Size(
                                MediaQuery.of(context).size.width - 70, 60),
                          ),
                          child: Text(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
