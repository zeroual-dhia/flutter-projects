import 'package:cofee/routes/hero.dart';
import 'package:cofee/routes/home.dart';
import 'package:cofee/routes/login.dart';
import 'package:cofee/routes/register.dart';
import 'package:flutter/material.dart';
import 'package:cofee/routes/coffeepage.dart';

class RouteGenerator {
  static const String hero = '/', login = '/login', register = '/register';
  static const String home = '/home';
  static const String coffepage = '/coffepage';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case hero:
        return MaterialPageRoute(builder: (_) => const herosection());
      case home:
        return MaterialPageRoute(builder: (_) => const Home());
      case coffepage:
        final arg = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) => Coffeepage(
                  coffe: arg,
                ));
      case login:
        return MaterialPageRoute(builder: (_) => const Login());
      case register:
        return MaterialPageRoute(builder: (_) => const Register());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Page not found!'),
        ),
      ),
    );
  }
}
