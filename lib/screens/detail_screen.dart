import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../models/meal_detail_model.dart';
import '../providers/meal_provider.dart';

class DetailScreen extends ConsumerStatefulWidget {
  const DetailScreen({super.key});

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;

    final mealDetailAsync = ref.watch(mealDetailProvider(id));

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Screen: $id"),
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ), // AppBar
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(mealDetailProvider);
        },
        child: mealDetailAsync.when(
          data: (List<MealElement> items) {
            return _buildListView(items[0]);
          },
          error: (e, s) => Center(child: Text("Error = ${e.toString()}")),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ), // RefreshIndicator
    ); // Scaffold
  }

  Widget _buildListView(MealElement element) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        Card(
          child: ListTile(
            leading: const Icon(Icons.title),
            title: Text(element.strMeal),
          ),
        ),
        Card(
          child: Image.network(element.strMealThumb),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.category),
            title: Text(element.strCategory),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.language),
            title: Text(element.strCountry),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(element.strInstructions),
          ),
        ),
      ],
    ); // ListView
  }
}
