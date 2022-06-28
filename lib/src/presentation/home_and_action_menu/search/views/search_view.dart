import 'package:flutter/material.dart';

import '../../home/widgets/search_bar.dart';
import '../widgets/recent_search_list_view.dart';
import '../widgets/search_result_tab_bar_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final GlobalKey<RecentSearchListViewState> _key = GlobalKey();
  final _searchController = TextEditingController();
  bool searchSubmitted = false;
  String searchPhrase = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Column(
              children: [
                Hero(
                  tag: 'searchBar',
                  child: Material(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: SearchBar(
                        atHome: false,
                        onSubmitted: _onSearchSubmitted,
                        controller: _searchController,
                      ),
                    ),
                  ),
                ),
                if (searchSubmitted)
                  SearchResultTabView(searchPhrase: searchPhrase)
                else
                  RecentSearchListView(
                    key: _key,
                    onSuggestPressed: () {
                      setState(() {
                        searchPhrase = _key.currentState!.searchPhrase;
                        searchSubmitted = true;
                      });
                    },
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSearchSubmitted(String searchWords) {
    setState(() {
      searchPhrase = searchWords;
      searchSubmitted = true;
    });
  }
}
