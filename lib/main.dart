import 'package:flutter/material.dart';
import 'package:flutter_breaking/app_router/app_router.dart';
import 'package:flutter_breaking/presentation/screens/character_screen.dart';

import 'constants/strings.dart';


void main() {
  runApp(BreakingBadApp(appRouter: AppRouter()));
}

class BreakingBadApp extends StatelessWidget {
  const BreakingBadApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute:appRouter.generateRoute ,
      initialRoute: 'CharacterScreen',
      title: 'Breaking Bad series',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
// This trailing comma makes auto-formatting nicer for build methods.



