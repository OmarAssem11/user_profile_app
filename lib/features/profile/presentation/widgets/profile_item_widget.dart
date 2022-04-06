import 'package:flutter/material.dart';

class ProfileItemWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  const ProfileItemWidget({
    required this.text,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(
        right: 22,
        left: 22,
        top: 16,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.secondary,
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 28,
            color: colorScheme.primary,
          ),
          const SizedBox(width: 16),
          Text(
            text,
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
