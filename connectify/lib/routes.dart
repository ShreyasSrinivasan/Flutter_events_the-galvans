import 'package:connectify/login/login.dart';
import 'package:connectify/profile/profie.dart';
import 'home/home.dart';
import 'register/register.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/register': (context) => const RegisterScreen(),
  '/profile': (context) => const ProfileScreen()
};
