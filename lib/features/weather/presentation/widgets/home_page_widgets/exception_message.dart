import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExceptionMessage extends StatelessWidget {
  const ExceptionMessage({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            CupertinoIcons.clear_circled,
            color: theme.colorScheme.error,
            size: 100,
          ),
          Text(
            message,
            style: TextStyle(color: theme.colorScheme.error, fontSize: 30),
          ),
        ],
      ),
    );
    ;
  }
}
