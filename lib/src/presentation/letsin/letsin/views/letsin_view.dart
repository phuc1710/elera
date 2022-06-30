import 'package:flutter/material.dart';

import '../widgets/scaffold_body.dart';

class LetsIn extends StatelessWidget {
  const LetsIn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(''),
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: MediaQuery.of(context).size.height * 0.0995,
        ),
        body: const ScaffoldBody(),
      ),
    );
  }
}
