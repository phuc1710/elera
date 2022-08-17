import 'package:flutter/material.dart';

import '../../my_course/my_courses/widgets/title_app_bar.dart';
import '../widgets/transactions_tab_body.dart';

class TransactionsTabView extends StatelessWidget {
  const TransactionsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TitleAppBar(title: 'Transations'),
        TransactionsTabBody(),
      ],
    );
  }
}
