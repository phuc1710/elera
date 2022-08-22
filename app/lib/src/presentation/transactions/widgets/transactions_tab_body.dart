import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injector/injector.dart';
import '../bloc/transactions_bloc.dart';
import 'items_transactions.dart';

class TransactionsTabBody extends StatelessWidget {
  const TransactionsTabBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<TransactionsBloc>()..add(TransactionsStarted()),
      child: BlocBuilder<TransactionsBloc, TransactionsState>(
        builder: (context, state) {
          if (state is TransactionsFetchSuccess) {
            final data = state.transactions?.items;

            return Expanded(
              child: ListView.builder(
                itemCount: data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemsTransactionsTab(
                    courseImage: data?[index].courseImage ?? '',
                    courseName: data?[index].courseName ?? '',
                    status: data?[index].status ?? '',
                  );
                },
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
