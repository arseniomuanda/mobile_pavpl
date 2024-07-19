import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:pavpl_app/app/routing/route_handler.dart';
import 'package:pavpl_app/app/style/hexadecimal_color.dart';

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
    const ProviderScope(child: PavplApp()),
  );
}

class PavplApp extends StatelessWidget {
  const PavplApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('pt'),
      title: 'PAVPL',
      onGenerateRoute: MRRoute().onRouteGenerator,
      initialRoute: MRRoutes.splash,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cardTheme: const CardTheme(color: Colors.white),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black
          )
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MRColor.fromHex('#FA8000'), width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MRColor.fromHex('#FA8000'), width: 2.0),
          ),
        ),
        textTheme: GoogleFonts.robotoTextTheme(const TextTheme()),
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
          onSurface: MRColor.fromHex('#FA8000'),
          primary: MRColor.fromHex('#FA8000'),
          secondary: MRColor.fromHex('#000000'),
          surface: MRColor.fromHex('#FA8000'),
        ),
      ),
    );
  }
}
