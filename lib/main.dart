import 'package:flutter/material.dart';
import 'package:flutter_assignment/model/product.dart';
import 'package:flutter_assignment/provider.dart';
import 'package:flutter_assignment/routes.dart';
import 'package:flutter_assignment/view/homepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  runApp(
    MultiBlocProvider(
      child: MyApp(),
      providers: provider,
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assignment',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffeae6e6),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Color(0xffeae6e6),
          centerTitle: true,
        ),
        primarySwatch: Colors.amber,
      ),
      onGenerateRoute: AssignmentRoutes.generateRoute,
      initialRoute: HomePage.Route,
    );
  }
}
