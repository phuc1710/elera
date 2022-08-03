import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/params/appbar_params.dart';

AppBar buildAppBar(AppBarParams params) {
  return AppBar(
    backgroundColor: params.backgroundColor,
    elevation: 0,
    title: Text(
      '${params.title}',
      style: Theme.of(params.context).textTheme.headline6,
    ),
    leadingWidth: 35,
    centerTitle: params.centerTitle,
    leading: params.leading ??
        (params.hasBack
            ? (params.backButton ??
                IconButton(
                  onPressed: params.onExit ?? () => params.context.router.pop(),
                  iconSize: 30,
                  icon: const Icon(Icons.arrow_back, color: Color(0xff212121)),
                ))
            : null),
    actions: params.actions,
  );
}

class TopAppBar extends StatelessWidget {
  const TopAppBar(
    this.params, {
    Key? key,
  }) : super(key: key);

  final AppBarParams params;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.maxFinite,
      child: Row(
        children: [
          if (params.leading != null) params.leading!,
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              params.title ?? '',
              style: Theme.of(params.context).textTheme.headline6,
            ),
          ),
          if (params.actions.isNotEmpty)
            ...params.actions
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: e,
                  ),
                )
                .toList(),
        ],
      ),
    );
  }
}
