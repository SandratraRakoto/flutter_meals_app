import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersProviderNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersProviderNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  void setFilters(Map<Filter, bool> filters) {
    state = filters;
  }

  void setFilter(Filter filter, bool value) {
    state = {...state, filter: value};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersProviderNotifier, Map<Filter, bool>>(
        (ref) => FiltersProviderNotifier());

final filteredMealsProvider = Provider((ref) {
  final filters = ref.watch(filtersProvider);
  return dummyMeals
      .where((meal) =>
          (!filters[Filter.glutenFree]! || meal.isGlutenFree) &&
          (!filters[Filter.lactoseFree]! || meal.isLactoseFree) &&
          (!filters[Filter.vegetarian]! || meal.isVegetarian) &&
          (!filters[Filter.vegan]! || meal.isVegan))
      .toList();
});
