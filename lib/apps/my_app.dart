import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/theme_provider.dart';
import '../screens/main_screen.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool dark = ref.watch(themeProvider);
    final Color themeColor = ref.watch(themeColorProvider);

    return MaterialApp(
      title: 'Persistent Bottom Navigation Bar Demo',
      debugShowCheckedModeBanner: false,
      themeMode: dark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: themeColor,
          brightness: Brightness.light,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: themeColor,
          foregroundColor: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: themeColor,
          brightness: Brightness.dark,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: themeColor is MaterialColor
              ? (themeColor[900] ?? themeColor)
              : themeColor,
          foregroundColor: Colors.white,
        ),
      ),
      home: const MainScreen(),
    );
  }
}