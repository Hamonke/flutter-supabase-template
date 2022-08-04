import 'package:flutter/material.dart';
import 'package:flutter_supabase_complete/app.dart';
import 'package:flutter_supabase_complete/constants.dart';
import 'package:flutter_supabase_complete/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Shared `runApp` configuration.
///
/// Used to initialize all required dependencies, packages, and constants.
Future<void> mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Dependency injection (injectable)
  configureDependencies();

  await Supabase.initialize(
    url: Constants.supabaseUrl,
    anonKey: Constants.supabaseAnnonKey,
  );

  runApp(App());
}
