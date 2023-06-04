// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:lojahub/repositories/auth_repository.dart';
import 'package:lojahub/presenter/screens/DashboardScreen.dart';
import 'package:lojahub/presenter/screens/LoginPage.dart';

import 'presenter/ui/components/LogoHeaderComponent.dart';
import 'domain/repositories/sales_repository.dart';

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
    // initialization();
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
    // FlutterNativeSplash.remove();
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
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<SalesRepository>(
            create: (context) => SalesRepository(),
          ),
          RepositoryProvider<AuthRepository>(
            create: (context) => AuthRepository(),
          ),
        ],
        child: const LoginPage(),
      ),
    );
  }
}
