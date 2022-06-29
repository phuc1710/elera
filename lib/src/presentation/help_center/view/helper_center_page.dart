import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import '../../../core/params/appbar_params.dart';
import '../../../core/utils/utils.dart';
import '../../widgets/base_appbar.dart';

class HelpeCenterPage extends StatefulWidget {
  const HelpeCenterPage({Key? key}) : super(key: key);

  @override
  State<HelpeCenterPage> createState() => _HelpeCenterPageState();
}

class _HelpeCenterPageState extends State<HelpeCenterPage> {
  final List<String> _filterFAQList = [
    'General',
    'Account',
    'Course',
    'Payment',
  ];

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
      body: SizedBox(
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
    );
  }

  Widget buildFAQ(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 35,
            margin: const EdgeInsets.only(top: 30),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _filterFAQList.length,
              separatorBuilder: (_, index) => const SizedBox(width: 10),
              itemBuilder: (_, index) {
                final isSelected = selectedFAQ == index;

                return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
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
                        _filterFAQList[index],
                        style:
                            Theme.of(context).textTheme.displayLarge?.copyWith(
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
          )
        ],
      ),
    );
  }
}
