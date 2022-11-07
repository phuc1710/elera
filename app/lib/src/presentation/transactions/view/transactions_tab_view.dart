import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';

import '../../my_course/my_courses/widgets/title_app_bar.dart';
import '../widgets/transactions_tab_body.dart';

class TransactionsTabView extends StatelessWidget {
  const TransactionsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAppBar(title: AppLocalizations.of(context).transactions),
        const TransactionsTabBody(),
      ],
    );
  }
}
