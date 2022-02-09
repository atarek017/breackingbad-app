import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:breackingbad/app_route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BreakingBadApp(appRouter: AppRouter(),));
}

class BreakingBadApp extends StatelessWidget {
  final AppRouter appRouter;

  BreakingBadApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
