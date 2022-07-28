import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enums/helper_contact_type.dart';
import '../../../core/params/appbar_params.dart';
import '../../../data/models/api_models.dart';
import '../../../injector/injector.dart';
import '../../home_and_action_menu/home/widgets/search_bar.dart';
import '../../widgets/base_appbar.dart';
import '../bloc/helper_center_bloc.dart';

class HelperCenterView extends StatefulWidget {
  const HelperCenterView({Key? key}) : super(key: key);

  @override
  State<HelperCenterView> createState() => _HelperCenterViewState();
}

class _HelperCenterViewState extends State<HelperCenterView> {
  final TextEditingController _searchController = TextEditingController();

  var selectedFAQ = 0;
  FAQModel? searchedFAQItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: buildAppBar(
          AppBarParams(
            context,
            title: 'Help Center',
            actions: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child:
                    const Icon(Icons.more_horiz_rounded, color: Colors.black),
              )
            ],
          ),
        ),
        body: BlocProvider(
          create: (context) =>
              injector<HelperCenterBloc>()..add(HelperCenterStarted()),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
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
                        buildContacts(context),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContacts(BuildContext context) {
    return BlocBuilder<HelperCenterBloc, HelperCenterState>(
      builder: (_, state) {
        if (state is HelperCenterFetchSuccess) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 20),
            itemCount: state.data?.contacts.length ?? 0,
            separatorBuilder: (_, __) => const SizedBox(height: 20),
            itemBuilder: (_, index) {
              final item = state.data?.contacts[index];

              return buildContactItem(context, item);
            },
          );
        }

        return const Center(child: Text('Chưa có nội dung'));
      },
    );
  }

  Widget buildContactItem(BuildContext context, HelperContactModel? item) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      onTap: () => onContactTap(context, item),
      tileColor: Colors.white,
      contentPadding: const EdgeInsets.all(10),
      leading: Image.network(item?.img ?? '', width: 30, height: 30),
      title: Text(
        item?.name ?? '',
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Colors.black),
      ),
    );
  }

  Widget buildFAQ(BuildContext context) {
    return BlocBuilder<HelperCenterBloc, HelperCenterState>(
      buildWhen: (_, current) => current is HelperCenterFetchSuccess,
      builder: (_, state) {
        if (state is HelperCenterFetchSuccess) {
          return Column(
            children: [
              buildFAQFilterList(context, faqData: state.data?.faqs ?? []),
              const SizedBox(height: 20),
              SearchBar(
                onFocus: () {},
                atHome: false,
                controller: _searchController,
                data: state.data?.faqs[selectedFAQ]?.items
                        .map((e) => e?.title)
                        .toList() ??
                    [],
                showOverlayResultPrediction: true,
                onChanged: (_) {
                  searchedFAQItem = null;
                  setState(() {});
                },
                onSubmitted: (selected) {
                  searchedFAQItem = itemWithTitle(state.data, selected);
                  setState(() {});
                },
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.separated(
                  itemCount: searchedFAQItem != null
                      ? [searchedFAQItem].length
                      : state.data?.faqs[selectedFAQ]?.items.length ?? 0,
                  separatorBuilder: (_, __) => const SizedBox(height: 15),
                  itemBuilder: (_, index) {
                    final item = searchedFAQItem ??
                        state.data?.faqs[selectedFAQ]?.items[index];

                    return buildFAQItem(context, item);
                  },
                ),
              ),
            ],
          );
        }

        return const Center(child: Text('Chưa có nội dung'));
      },
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
        expanded: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(color: Colors.grey),
            ),
            Container(
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
          ],
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
                  faqData[index]?.type ?? '',
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

  FAQModel? itemWithTitle(HelperCenterDataModel? data, String? title) {
    final sectionContainsTitle = data?.faqs.firstWhereOrNull(
      (e) => e?.items.firstWhereOrNull((item) => item?.title == title) != null,
    );

    return sectionContainsTitle?.items
        .firstWhereOrNull((item) => item?.title == title);
  }

  void onContactTap(BuildContext context, HelperContactModel? item) {
    final contactType = HelperContactType.values
        .whereIndexed((index, element) => index == item?.id)
        .firstOrNull;

    switch (contactType) {
      case HelperContactType.customerService:

      case HelperContactType.whatsapp:

      case HelperContactType.website:

      case HelperContactType.facebook:

      case HelperContactType.twitter:

      case HelperContactType.instagram:

      case null:
        break;
    }
  }
}
