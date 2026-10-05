import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'color_provider.dart';

export 'color_provider.dart';
export 'image_provider.dart';

class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier() : super(false) {
    _load();
  }

  final _key = "ThemeNotifier";
  final _storage = const FlutterSecureStorage();

  void _load() async {
    String value = await _storage.read(key: _key) ?? "false";
    state = bool.tryParse(value) ?? false;
  }

  void toggleDark() {
    state = !state;
    _storage.write(key: _key, value: state.toString());
  }

  void setDark(bool value) {
    state = value;
    _storage.write(key: _key, value: state.toString());
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, bool>((ref) {
  return ThemeNotifier();
});

const List<Color> availableThemeColors = [
  Colors.yellow,
  Colors.orange,
  Colors.deepOrange,
  Colors.pink,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.lime,
  Colors.lightGreen,
  Colors.green,
  Colors.cyan,
  Colors.lightBlue,
  Colors.blue,
  Colors.blueGrey,
];

final themeColorProvider = Provider<Color>((ref) {
  final colorIndex = ref.watch(colorProvider);
  if (colorIndex >= 0 && colorIndex < availableThemeColors.length) {
    return availableThemeColors[colorIndex];
  }
  return availableThemeColors[0];
});