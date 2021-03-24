import 'package:drohealth/providers/__providers.dart';
import 'package:drohealth/routes/route_generator.dart';
import 'package:drohealth/style/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]
  ).then((val) {
     runApp(ProviderScope(child: Page()));
  });
  
}

class Page extends HookWidget {
  @override
  Widget build(BuildContext context) {

    final lightModeEnabled = useProvider(appThemeStateNotifier.state);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dro Health",
      theme: AppTheme.lightTheme,
      themeMode: lightModeEnabled ? ThemeMode.light : ThemeMode.dark,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      );
  }
  
}