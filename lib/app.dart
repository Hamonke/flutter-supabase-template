import 'package:flutter/material.dart';
import 'package:flutter_supabase_complete/core/routes/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Entry widget of the app
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    SupabaseAuth.instance.onAuthChange.listen((event) {
      if (event == AuthChangeEvent.signedIn) {
        _appRouter.push(const HomeRoute());
      } else if (event == AuthChangeEvent.signedOut) {
        _appRouter.push(const SignUpRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
