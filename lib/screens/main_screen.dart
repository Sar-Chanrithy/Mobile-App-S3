import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'meal_screen.dart';
import 'settings_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: const MealScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.home),
            title: "Home",
            activeForegroundColor: Theme.of(context).colorScheme.onPrimary,
            inactiveForegroundColor: Theme.of(context).colorScheme.onPrimary,
          ), // ItemConfig
        ), // PersistentTabConfig
        PersistentTabConfig(
          screen: Container(color: Colors.blue),
          item: ItemConfig(
            icon: const Icon(Icons.message),
            title: "Messages",
            activeForegroundColor: Theme.of(context).colorScheme.onPrimary,
            inactiveForegroundColor: Theme.of(context).colorScheme.onPrimary,
          ), // ItemConfig
        ), // PersistentTabConfig
        PersistentTabConfig(
          screen: const SettingsScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.settings),
            title: "Settings",
            activeForegroundColor: Theme.of(context).colorScheme.onPrimary,
            inactiveForegroundColor: Theme.of(context).colorScheme.onPrimary,
          ), // ItemConfig
        ), // PersistentTabConfig
      ],
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}