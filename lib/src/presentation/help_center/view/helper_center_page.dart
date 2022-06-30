import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/api_models.dart';

import '../../../core/params/appbar_params.dart';
import '../../home_and_action_menu/home/widgets/search_bar.dart';
import '../../widgets/base_appbar.dart';
import '../bloc/helper_center_bloc.dart';

class HelpeCenterPage extends StatefulWidget {
  const HelpeCenterPage({Key? key}) : super(key: key);

  @override
  State<HelpeCenterPage> createState() => _HelpeCenterPageState();
}

class _HelpeCenterPageState extends State<HelpeCenterPage> {
  final TextEditingController _searchController = TextEditingController();

  var selectedFAQ = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        AppBarParams(
          context,
          title: 'Help Center',
        ),
      ),
      body: BlocProvider(
        create: (context) => HelperCenterBloc()..add(HelperCenterStarted()),
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  labelStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Theme.of(context).primaryColor),
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Tab(text: 'FAQ'),
                    Tab(text: 'Contact Us'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      buildFAQ(context),
                      Container(color: Colors.amber),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFAQ(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: BlocBuilder<HelperCenterBloc, HelperCenterState>(
        buildWhen: (_, current) => current is HelperCenterFetchSuccess,
        builder: (context, state) {
          if (state is HelperCenterFetchSuccess) {
            return Column(
              children: [
                buildFAQFilterList(context, faqData: state.data?.faqs ?? []),
                const SizedBox(height: 20),
                SearchBar(
                  atHome: false,
                  controller: _searchController,
                  onChanged: (text) {},
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: ListView.separated(
                    itemCount: state.data?.faqs[selectedFAQ]?.items.length ?? 0,
                    separatorBuilder: (_, __) => const SizedBox(height: 15),
                    itemBuilder: (_, index) {
                      final item = state.data?.faqs[selectedFAQ]?.items[index];

                      return buildFAQItem(context, item);
                    },
                  ),
                ),
              ],
            );
          }

          return const Center(
            child: Text('Chưa có nội dung'),
          );
        },
      ),
    );
  }

  Card buildFAQItem(
    BuildContext context,
    FAQModel? item,
  ) {
    return Card(
      elevation: 2,
      child: ExpandablePanel(
        header: ListTile(
          title: Text(
            item?.title ?? '',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.black),
          ),
        ),
        collapsed: const SizedBox(),
        expanded: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(15),
          child: Text(
            item?.answer ?? '',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Colors.black,
                  fontSize: 18,
                ),
          ),
        ),
      ),
    );
  }

  Widget buildFAQFilterList(
    BuildContext context, {
    required List<FAQSectionModel?> faqData,
  }) {
    return Container(
      width: double.maxFinite,
      height: 35,
      margin: const EdgeInsets.only(top: 30),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: faqData.length,
        separatorBuilder: (_, index) => const SizedBox(width: 10),
        itemBuilder: (_, index) {
          final isSelected = selectedFAQ == index;

          return Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(20),
              color: isSelected ? Theme.of(context).primaryColor : null,
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedFAQ = index;
                });
              },
              child: Center(
                child: Text(
                  faqData[index]?.name ?? '',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: isSelected
                            ? Colors.white
                            : Theme.of(context).primaryColor,
                      ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
