import 'package:flutter/material.dart';
import 'package:fluttercars/pages/favoritos/favoritos_bloc.dart';
import 'package:fluttercars/splash_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => FavoritosBloc(),
          dispose: (context, bloc) => bloc.dispose(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color.fromARGB(255, 0, 0, 205),
        ),
        home: SplashPage(),
      ),
    );
  }
}
