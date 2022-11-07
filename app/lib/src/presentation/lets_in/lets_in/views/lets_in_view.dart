import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../widgets/lets_in_body.dart';

class LetsInView extends StatelessWidget {
  const LetsInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Icon(IconlyLight.arrow_left),
          toolbarHeight: MediaQuery.of(context).size.height * 0.0995,
        ),
        body: const LetsInBody(),
      ),
    );
  }
}
