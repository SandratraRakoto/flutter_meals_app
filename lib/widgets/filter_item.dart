import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  const FilterItem(
      {required this.title,
      this.subtitle,
      required this.value,
      required this.onChanged,
      super.key});

  final bool value;
  final String title;
  final String? subtitle;
  final void Function(bool isChecked) onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      contentPadding: const EdgeInsets.only(left: 16, right: 22),
      activeColor: Theme.of(context).colorScheme.tertiary,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            )
          : null,
    );
  }
}
