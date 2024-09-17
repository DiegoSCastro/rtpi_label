import 'package:flutter/material.dart';
import 'package:rtpi_label/app/features/label_edit/label_edit_page.dart';

class RtpiLabelApp extends StatelessWidget {
  const RtpiLabelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LabelEditPage(),
      },
    );
  }
}
