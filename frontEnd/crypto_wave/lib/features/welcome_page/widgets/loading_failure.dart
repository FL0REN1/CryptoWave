import 'package:flutter/material.dart';

import 'routed_button.dart';

class LoadingFailure extends StatefulWidget {
  const LoadingFailure({super.key, required this.restart});

  final void Function() restart;

  @override
  State<LoadingFailure> createState() => _LoadingFailureState();
}

class _LoadingFailureState extends State<LoadingFailure> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: SizedBox(
        width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Something went wrong', style: theme.textTheme.titleLarge),
            const SizedBox(height: 10),
            Text('Please try again later', style: theme.textTheme.labelMedium),
            const SizedBox(height: 30),
            RoutedButton(
              onPressed: () => widget.restart(),
              routedButtonText: 'Try again',
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
