import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({
    super.key,
    required this.title,
    required this.body,
    this.actions = const [],
  });

  final String title;
  final String body;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final hasBody = body.trim().isNotEmpty;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            if (hasBody) ...[
              const SizedBox(height: 8),
              Text(body, style: Theme.of(context).textTheme.bodyLarge),
            ],
            if (actions.isNotEmpty) ...[
              const SizedBox(height: 14),
              Wrap(spacing: 10, runSpacing: 10, children: actions),
            ],
          ],
        ),
      ),
    );
  }
}
