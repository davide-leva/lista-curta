import 'package:flutter/material.dart';
import 'package:lista/costants.dart';
import 'package:lista/screen/components/header.dart';
import 'package:lista/screen/lista_screen.dart';
import 'package:lista/service/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista Curta Events',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: primaryColor,
          onPrimary: Colors.white,
          secondary: Colors.grey,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.white,
          background: bgColor,
          onBackground: Colors.white,
          surface: secondaryColor,
          onSurface: Colors.white,
        ),
      ),
      home: FutureBuilder(
        future: Data.get(),
        builder: (context, snap) {
          if (snap.hasData) {
            return const ListaScreen();
          } else {
            return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              body: const SafeArea(
                child: Column(
                  children: [
                    Header(),
                    SizedBox(
                      height: defaultPadding * 3,
                    ),
                    CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
