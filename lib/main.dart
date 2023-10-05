import 'package:flutter/material.dart';

import 'config/routes/routes.dart';
import 'config/theme/app_themes.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      initialRoute: '/',
    );
  }
}
