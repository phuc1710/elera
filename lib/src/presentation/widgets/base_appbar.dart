import 'package:flutter/material.dart';

import '../../core/params/appbar_params.dart';

AppBar buildAppBar(AppBarParams params) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Text(
      params.title ?? '',
      style: Theme.of(params.context).textTheme.titleLarge,
    ),
    centerTitle: params.centerTitle,
    leading: params.hasBack
        ? (params.backButton ??
            IconButton(
              onPressed: params.onExit ??
                  () {
                    Navigator.pop(params.context);
                  },
              iconSize: 30,
              icon: const Icon(Icons.arrow_back, color: Colors.black),
            ))
        : null,
    actions: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: const Icon(
          Icons.more_horiz_rounded,
          color: Colors.black,
        ),
      )
    ],
  );
}
