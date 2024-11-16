import 'package:abbey_road_store/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Abbey Road Store',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme(
            primary: Color(0xFF1A237E),
            secondary: Color(0xFF7986CB),
            surface: Colors.white,
            error: Colors.red,
            onPrimary: Colors.white,
            onSecondary: Colors.white,
            onSurface: Colors.black,
            onError: Colors.white,
            brightness: Brightness.light,
          ),
        ),
        home: const LoginPage()
      ),
    );
  }
}