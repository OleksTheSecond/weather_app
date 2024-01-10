import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsButton extends StatelessWidget {
  const DetailsButton({super.key, required this.text, required this.onPressed});
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      borderRadius: BorderRadius.circular(20),
      color: Theme.of(context).colorScheme.primary,
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
