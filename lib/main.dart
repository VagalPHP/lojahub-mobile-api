// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lojahub/screens/DashboardScreen.dart';

import 'repositories/sales_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lojahub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(16, 48, 79, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'DM Sans',
      ),
      home: RepositoryProvider(
        create: (context) => SalesRepository(),
        child: const DashboardScreen(),
      ),
    );
  }
}
