import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twitter_clone/pages/navigation_pages/main_page/main_page.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(21, 32, 43, 1), systemNavigationBarColor: Color.fromRGBO(21, 32, 43, 1)));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter Clone App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          splashColor: const Color.fromRGBO(16, 27, 38, 1),
          floatingActionButtonTheme:
              const FloatingActionButtonThemeData(backgroundColor: Color.fromRGBO(29, 155, 240, 1)),
          colorScheme: const ColorScheme.dark(),
          textTheme: const TextTheme(
              subtitle1: TextStyle(fontWeight: FontWeight.bold),
              subtitle2: TextStyle(
                color: Colors.white38,
                overflow: TextOverflow.ellipsis,
              ),
              button: TextStyle(color: Colors.white54)),
          appBarTheme: const AppBarTheme(
            color: Color.fromRGBO(21, 32, 43, 1),
          ),
          iconTheme: const IconThemeData(color: Colors.white, size: 28),
          scaffoldBackgroundColor: const Color.fromRGBO(21, 32, 43, 1),
          drawerTheme: const DrawerThemeData(backgroundColor: Color.fromRGBO(21, 32, 43, 1))),
      home: const SafeArea(child: MainPage()),
    );
  }
}
