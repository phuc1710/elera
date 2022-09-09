import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class BottomPromptRow extends StatelessWidget {
  const BottomPromptRow({
    Key? key,
    required this.promptText,
    required this.path,
    required this.actionText,
  }) : super(key: key);

  final String promptText;
  final String path;
  final String actionText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            promptText,
            style: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(color: const Color(0xff9e9e9e)),
          ),
          TextButton(
            onPressed: () => context.router.replaceNamed(path),
            child: Text(
              actionText,
              style: Theme.of(context).textTheme.caption?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
