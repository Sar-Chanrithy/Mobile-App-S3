import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import '../apps/my_app.dart';
import '../providers/theme_provider.dart';
import 'my_home.dart';
import 'setting_screen.dart';

void main() => runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );

class PersistenBottomNavBarDemo extends StatelessWidget {
  const PersistenBottomNavBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MyApp(),
    );
  }
}

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  late final PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    // Default to index 2 (Settings tab) as displayed in the screenshot
    _controller = PersistentTabController(initialIndex: 2);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = ref.watch(themeColorProvider);

    return PersistentTabView(
      controller: _controller,
      tabs: [
        PersistentTabConfig(
          screen: const MyHomePage(title: 'Home'),
          item: ItemConfig(
            icon: const Icon(Icons.home),
            title: "Home",
          ),
        ),
        PersistentTabConfig(
          screen: const YourSecondScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.message),
            title: "Messages",
          ),
        ),
        PersistentTabConfig(
          screen: const SettingsScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.settings),
            title: "Settings",
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          color: themeColor is MaterialColor
              ? (themeColor[200] ?? themeColor.withValues(alpha: 0.35))
              : themeColor.withValues(alpha: 0.35),
        ),
      ),
    );
  }
}

class YourFirstScreen extends StatelessWidget {
  const YourFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

class YourSecondScreen extends StatelessWidget {
  const YourSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}

class YourThirdScreen extends ConsumerWidget {
  const YourThirdScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SettingsScreen();
  }
}

typedef FirstScreen = YourFirstScreen;
typedef SecondScreen = YourSecondScreen;
typedef ThirdScreen = YourThirdScreen;