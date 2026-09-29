import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ColorNotifier extends Notifier<int> {
  static const _key = 'selected_color_index';
  final _storage = const FlutterSecureStorage();

  @override
  int build() {
    _load();
    return 0;
  }

  Future<void> _load() async {
    final savedIndex = await _storage.read(key: _key) ?? '0';
    final index = int.tryParse(savedIndex) ?? 0;
    state = index;
  }

  Future<void> changeIndex(int index) async {
    state = index;
    await _storage.write(key: _key, value: index.toString());
  }
}

final colorProvider = NotifierProvider<ColorNotifier, int>(ColorNotifier.new);
