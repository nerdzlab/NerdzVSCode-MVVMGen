import 'package:flutter/material.dart';

final class UndefinedScreen extends StatelessWidget {
  final String? name;

  const UndefinedScreen({
    super.key,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'Screen for route $name does not implement or implemented with error',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
