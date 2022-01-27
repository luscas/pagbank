import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pagbank/routes.dart';
import 'package:pagbank/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.white,
    statusBarBrightness: Brightness.dark
  ));

  runApp(const BootstrapApp());
}

class BootstrapApp extends StatelessWidget {
  const BootstrapApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PagBank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppTheme().primary,
        fontFamily: 'Work Sans',
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const HomeScreen(),
        '/dashboard': (ctx) => const DashboardScreen(),
      }
    );
  }
}