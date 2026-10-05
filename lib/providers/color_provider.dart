import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ColorNotifier extends StateNotifier<int> {
  ColorNotifier() : super(0) {
    _load();
  }

  final _key = "ColorNotifier";
  final _storage = const FlutterSecureStorage();

  void _load() async {
    String value = await _storage.read(key: _key) ?? "0";
    state = int.tryParse(value) ?? 0;
  }

  void changeIndex(int index) {
    state = index;
    _storage.write(key: _key, value: state.toString());
  }
}

final colorProvider = StateNotifierProvider<ColorNotifier, int>((ref) {
  return ColorNotifier();
});
