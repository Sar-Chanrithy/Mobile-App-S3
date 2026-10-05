import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const List<String> availableBackgroundImages = [
  'image/back1.png',
  'image/back2.png',
  'image/back3.png',
  'image/back4.png',
];

class ImageNotifier extends StateNotifier<int> {
  ImageNotifier() : super(0) {
    _load();
  }

  final _key = "ImageNotifier";
  final _storage = const FlutterSecureStorage();

  void _load() async {
    String value = await _storage.read(key: _key) ?? "0";
    final index = int.tryParse(value) ?? 0;
    if (index >= 0 && index < availableBackgroundImages.length) {
      state = index;
    } else {
      state = 0;
    }
  }

  void changeIndex(int index) {
    if (index >= 0 && index < availableBackgroundImages.length) {
      state = index;
      _storage.write(key: _key, value: state.toString());
    }
  }
}

final imageProvider = StateNotifierProvider<ImageNotifier, int>((ref) {
  return ImageNotifier();
});

final backgroundImageIndexProvider = imageProvider;

final backgroundImageProvider = Provider<String>((ref) {
  final imageIndex = ref.watch(imageProvider);
  if (imageIndex >= 0 && imageIndex < availableBackgroundImages.length) {
    return availableBackgroundImages[imageIndex];
  }
  return availableBackgroundImages[0];
});
