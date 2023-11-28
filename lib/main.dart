import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepointtest/calculate/views/calculate_provider.dart';
import 'package:moniepointtest/homepage/views/homepagescreen.dart';
import 'package:moniepointtest/mywidgets/myavatar.dart';
import 'package:moniepointtest/mywidgets/navbar.dart';
import 'package:moniepointtest/search/views/searchscreen.dart';
import 'package:moniepointtest/theme/palette.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CalculateProvider>(create: (_) => CalculateProvider()),

      ],
      child:
        MaterialApp(
          title: 'Moniepoint Test',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Noto',
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a blue toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomePage(),
        ),

    );
  }
}


