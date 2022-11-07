import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injector/injector.dart';
import '../bloc/e_receipt_bloc.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/barcode_widget.dart';
import '../widgets/e_receipt_bottom_body.dart';
import '../widgets/e_receipt_mid_body.dart';
import '../widgets/e_receipt_top_body.dart';

class EReceiptView extends StatelessWidget {
  const EReceiptView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final String title = l10n.eReceipt;

    final String text = l10n.course;

    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<EReceiptBloc>()..add(EReceiptStarted()),
        child: BlocBuilder<EReceiptBloc, EReceiptState>(
          builder: (context, state) {
            if (state is EReceiptFetchSuccess) {
              return Column(
                children: [
                  AppBarWidget(title: title),
                  const BarcodeWidget(img: 'assets/images/img_barcode.png'),
                  EReceiptTopBody(text: text, value: state.eReceipt),
                  EReceiptMidBody(text: text, value: state.eReceipt),
                  EReceiptBottomBody(value: state.eReceipt),
                ],
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
