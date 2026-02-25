import 'package:flutter/material.dart';
import 'package:kyrgyz_tili_web_site/features/site/domain/entities/site_locale.dart';

class LanguageSwitch extends StatelessWidget {
  const LanguageSwitch({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final SiteLocale value;
  final ValueChanged<SiteLocale> onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
        SegmentedButton<SiteLocale>(
          segments: SiteLocale.values
              .map(
                (locale) => ButtonSegment<SiteLocale>(
                  value: locale,
                  label: Text(locale.code),
                ),
              )
              .toList(),
          selected: {value},
          onSelectionChanged: (selection) => onChanged(selection.first),
        ),
      ],
    );
  }
}
