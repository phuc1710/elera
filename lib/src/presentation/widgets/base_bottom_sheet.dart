// Flutter imports:
import 'package:flutter/material.dart';

class BaseBottomSheet extends StatelessWidget {
  const BaseBottomSheet({
    Key? key,
    required this.title,
    required this.child,
    this.height,
  }) : super(key: key);

  final String title;

  final Widget child;

  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? MediaQuery.of(context).size.height * 372 / 812,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 5,
              width: 30,
            ),
          ),
          headerBottomSheet(context, title),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              color: Colors.white,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

Widget headerBottomSheet(BuildContext context, String title) {
  return Column(
    children: [
      Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.red, fontSize: 22),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Divider(
          color: Colors.grey[200],
        ),
      ),
    ],
  );
}

void showBaseBottomSheet({
  required BuildContext context,
  required String title,
  required Widget child,
  double? height,
}) {
  showModalBottomSheet<void>(
    backgroundColor: Colors.white,
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
    builder: (context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: BaseBottomSheet(
          title: title,
          height: height,
          child: child,
        ),
      );
    },
  );
}
