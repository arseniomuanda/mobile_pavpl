import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:mobile_pavpl/app/routing/route_handler.dart';
import 'package:mobile_pavpl/app/style/hexadecimal_color.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 8,
    lineLength: 120,
    colors: true,
    printEmojis: true,
    printTime: true,
  ),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const PavplApp(),
  );
}

class PavplApp extends StatelessWidget {
  const PavplApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'PAVPL',
        onGenerateRoute: MRRoute().onRouteGenerator,
        initialRoute: MRRoutes.splash,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          timePickerTheme:
              const TimePickerThemeData(backgroundColor: Colors.white),
          colorScheme: ColorScheme(
            background: MRColor.fromHex('#FA8000'),
            brightness: Brightness.light,
            error: MRColor.fromHex('#FA8000'),
            onBackground: MRColor.fromHex('#FFFFFF'),
            onError: MRColor.fromHex('#FFFFFF'),
            onPrimary: MRColor.fromHex('#FFFFFF'),
            onSecondary: MRColor.fromHex('#000000'),
            onSurface: MRColor.fromHex('#000000'),
            primary: MRColor.fromHex('#FA8000'),
            secondary: MRColor.fromHex('#000000'),
            surface: MRColor.fromHex('#000000'),
          ),
        ));
  }
}
