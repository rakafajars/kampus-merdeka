import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/contact/contact_page.dart';
import 'package:flutter_application_1/contact/contact_provider.dart';
import 'package:flutter_application_1/switch_color/gabungan_dua_provider.dart';
import 'package:flutter_application_1/switch_color/switch_color_page.dart';
import 'package:flutter_application_1/switch_color/switch_color_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContactProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SwitchColorProvider(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: GabunganDuaProvider(),
    );
  }
}
