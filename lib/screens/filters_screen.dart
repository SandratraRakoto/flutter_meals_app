import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/widgets/filter_item.dart';
import 'package:meals/providers/filters_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    final filters = ref.watch(filtersProvider);
    final setFilter = ref.read(filtersProvider.notifier).setFilter;

    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body: Column(
        children: [
          FilterItem(
            value: filters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              setFilter(Filter.glutenFree, isChecked);
            },
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals.',
          ),
          FilterItem(
            value: filters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              setFilter(Filter.lactoseFree, isChecked);
            },
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals.',
          ),
          FilterItem(
            value: filters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              setFilter(Filter.vegetarian, isChecked);
            },
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals.',
          ),
          FilterItem(
            value: filters[Filter.vegan]!,
            onChanged: (isChecked) {
              setFilter(Filter.vegan, isChecked);
            },
            title: 'Vegan',
            subtitle: 'Only include vegan meals.',
          )
        ],
      ),
    );
  }
}
