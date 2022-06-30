import 'package:flutter/material.dart';

import '../../search/views/search_view.dart';
import '../../search/widgets/filter_bottom_sheet_content.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.atHome,
    this.onSubmitted,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  final bool atHome;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        autofocus: !atHome,
        onTap: atHome
            ? (() => Navigator.push<Object?>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (context) => const SearchView(),
                  ),
                ))
            : () {},
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey[400],
          ),
          suffixIcon: atHome
              ? Icon(
                  Icons.filter_alt_outlined,
                  color: Theme.of(context).primaryColor,
                )
              : IconButton(
                  onPressed: () => showSearchFilterBottomSheet(context),
                  icon: Icon(
                    Icons.filter_alt_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                  splashRadius: 10,
                ),
          hintText: 'Search',
          hintStyle: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(color: Colors.grey[400]),
        ),
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }

  dynamic showSearchFilterBottomSheet(BuildContext context) {
    return showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, void Function(void Function()) setState) {
            return const FilterBottomSheetContent();
          },
        );
      },
    );
  }
}
