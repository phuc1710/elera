import 'package:auto_route/auto_route.dart';
import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/router/routes.dart';
import '../../../core/params/appbar_params.dart';
import '../../../core/utils/alert.dart';
import '../../../data/models/payment/payment_response_model.dart';
import '../../../injector/injector.dart';
import '../../widgets/base_appbar.dart';
import '../../widgets/base_button.dart';
import '../bloc/payment_bloc.dart';
import '../widgets/payment_tile.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return BlocProvider(
      create: (context) => getIt<PaymentBloc>()..add(PaymentStarted()),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: buildAppBar(
          AppBarParams(
            context,
            title: l10n.payment,
            backgroundColor: Colors.transparent,
            actions: [const Icon(Icons.more_horiz_outlined)],
          ),
        ),
        body: BlocConsumer<PaymentBloc, PaymentState>(
          listener: (context, state) {
            if (state is PaymentFailure) {
              Alert.showAlert(context, state.msg);
            }
          },
          buildWhen: (_, currentState) => currentState is PaymentFetchSuccess,
          builder: (context, state) {
            if (state is PaymentFetchSuccess) {
              return buildBody(context, state.data);
            }

            if (state is PaymentInProgress) {
              return const Center(child: CircularProgressIndicator());
            }

            return Center(child: Text(l10n.noContent));
          },
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context, PaymentDataModel? data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            height: double.maxFinite,
            width: double.maxFinite,
            child: ListView.separated(
              itemCount: data?.items.length ?? 0,
              separatorBuilder: (_, __) => const SizedBox(height: 15),
              itemBuilder: (_, index) => PaymentTile(data: data?.items[index]),
            ),
          ),
          buildAddButton(context),
        ],
      ),
    );
  }

  Widget buildAddButton(BuildContext context) {
    return Positioned(
      bottom: 40,
      left: 0,
      right: 0,
      child: BaseButton(
        title: AppLocalizations.of(context).addNewCard,
        titleColor: Colors.white,
        color: Theme.of(context).colorScheme.primary,
        onTap: () => context.router.pushNamed(Routes.newCard),
        shadow: const [
          BoxShadow(
            color: Color.fromRGBO(51, 94, 247, 0.25),
            blurRadius: 24,
            offset: Offset(4, 8),
          )
        ],
      ),
    );
  }
}
