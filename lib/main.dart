import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/login_page.dart';
import 'viewmodels/login_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

// Application configuration.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login MVVM',
      theme: ThemeData(
        colorSchemeSeed: Colors.grey,
        useMaterial3: true,
      ),

      // Creates and provides the LoginViewModel.
      home: ChangeNotifierProvider(
        create: (_) => LoginViewModel(),
        child: const LoginPage(),
      ),
    );
  }
}
