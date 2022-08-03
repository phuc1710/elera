import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../bloc/home_bloc.dart';
import 'deal_page.dart';
import 'page_indicator.dart';

class DealsSlider extends StatefulWidget {
  const DealsSlider({Key? key}) : super(key: key);

  @override
  State<DealsSlider> createState() => _DealsSliderState();
}

class _DealsSliderState extends State<DealsSlider> {
  final _controller = PageController();
  var page = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeFetchFailure) {
          Utils.showAppSnackBar(context, state.error.errorMessage);
        }
      },
      buildWhen: (prev, curr) =>
          prev is HomeFetchInProgress && curr is HomeFetchSuccess,
      builder: (context, state) {
        if (state is HomeFetchInProgress)
          return const Center(child: CircularProgressIndicator());
        if (state is HomeFetchSuccess)
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.03,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Theme.of(context).primaryColor,
                boxShadow: getButtonBoxShadow(context),
              ),
              height: MediaQuery.of(context).size.height * 0.22,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PageView(
                    controller: _controller,
                    onPageChanged: (index) => setState(() {
                      page = index;
                    }),
                    children:
                        List.generate(state.data?.deals?.length ?? 0, (index) {
                      final deal = state.data?.deals?[index];

                      return DealPage(
                        title: deal?.title,
                        subtitle: deal?.subtitle,
                        description: deal?.description,
                        deal: deal?.deal,
                      );
                    }),
                  ),
                  PageIndicator(
                    controller: _controller,
                    pageCount: state.data?.deals?.length ?? 0,
                  )
                ],
              ),
            ),
          );

        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  List<BoxShadow>? getButtonBoxShadow(BuildContext context) {
    return [
      const BoxShadow(
        color: Color.fromRGBO(51, 94, 247, 0.25),
        blurRadius: 24,
        offset: Offset(4, 8),
      )
    ];
  }
}
