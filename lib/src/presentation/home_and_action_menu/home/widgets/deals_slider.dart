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
        if (state is CourseFetchFailure) {
          Utils.showAppSnackBar(context, state.error.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is DealFetchInProgress)
          return const Center(child: CircularProgressIndicator());
        if (state is DealFetchSuccess)
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.03,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                decoration: BoxDecoration(
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
                      children: List.generate(state.deals.length, (index) {
                        final deal = state.deals[index];

                        return DealPage(
                          title: deal?.title,
                          subtitle: deal?.subtitle,
                          description: deal?.description,
                          deal: deal?.deal,
                        );
                      }),
                    ),
                    PageIndicator(
                        controller: _controller, pageCount: state.deals.length)
                  ],
                ),
              ),
            ),
          );

        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  List<BoxShadow>? getButtonBoxShadow(BuildContext context) {
    return [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 10,
        offset: const Offset(0, 3),
      )
    ];
  }
}
