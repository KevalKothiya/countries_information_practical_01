import 'package:flutter/material.dart';
import 'package:info/screens/detailspage.dart';
import 'package:info/screens/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        'DetailsPage': (context) => const DetailsPage(),
      },
    ),
  );
}
