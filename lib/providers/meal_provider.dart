import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal_detail_model.dart';
import '../models/meal_model.dart';
import '../services/meal_service.dart';

final mealServiceProvider = Provider<MealService>((ref) {
  return MealService();
}); // Provider

class MealsNotifier extends AsyncNotifier<List<Meal>> {
  @override
  Future<List<Meal>> build() async {
    final service = ref.watch(mealServiceProvider);
    return service.fetchMeals();
  }

  Future<void> refreshMeals() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final service = ref.read(mealServiceProvider);
      return service.fetchMeals();
    });
  }
}

final mealsProvider =
    AsyncNotifierProvider<MealsNotifier, List<Meal>>(MealsNotifier.new);

// final mealDetailProvider = FutureProvider.family<List<MealElement>, String>((ref, id) async{
final mealDetailProvider =
    FutureProvider.autoDispose.family<List<MealElement>, String>((ref, id) async {
  final service = ref.watch(mealServiceProvider);
  return service.get(id);
});
