import 'dart:js';
import 'package:connectify/login/login.dart';
import 'home/home.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen()
};
