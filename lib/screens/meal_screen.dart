import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../providers/meal_provider.dart';

import '../models/meal_model.dart';

class MealScreen extends ConsumerStatefulWidget {
  const MealScreen({super.key});

  @override
  ConsumerState<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends ConsumerState<MealScreen> {
  @override
  Widget build(BuildContext context) {
    final mealsAsync = ref.watch(mealsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Screen"),
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [
          IconButton(
            onPressed: () {
              ref.read(mealsProvider.notifier).refreshMeals();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ), // AppBar
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(mealsProvider.notifier).refreshMeals();
        },
        child: mealsAsync.when(
          data: (List<Meal> items) {
            return _buildGridView(items);
          },
          error: (e, s) => Center(child: Text("Error = ${e.toString()}")),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ), // RefreshIndicator
    ); // Scaffold
  }

  Widget _buildGridView(List<Meal> items) {
    if (items.isEmpty) {
      return const Center(child: Text("No Meal"));
    }

    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
      ), // SliverGridDelegateWithFixedCrossAxisCount
      itemBuilder: (context, index) {
        final item = items[index];
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('/detail', arguments: item.idMeal);
          },
          child: Card(
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      item.strMealThumb,
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                      height: double.maxFinite,
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(child: Icon(Icons.broken_image)),
                    ),
                  ), // ClipRRect
                ), // Expanded
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.strMeal,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ), // Padding
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.strCountry.isNotEmpty ? item.strCountry : item.strArea,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ), // Padding
              ],
            ),
          ),
        );
      },
    );
  }
}
