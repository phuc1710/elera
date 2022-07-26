import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../../../../injector/injector.dart';
import '../bloc/search_bloc.dart';
import '../widgets/recent_search_list_view.dart';
import '../widgets/search_bar.dart';
import '../widgets/search_result_tab_bar_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final GlobalKey<RecentSearchListViewState> _key = GlobalKey();
  final _searchController = TextEditingController();
  String searchPhrase = '';

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: BlocProvider<SearchBloc>(
            create: (context) =>
                injector()..add(RecentSearchFetched('user@email.com')),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                children: [
                  Hero(
                    tag: 'searchBar',
                    child: Material(
                      color: Colors.white,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                        child: SearchBar(
                          atHome: false,
                          onFocus: () {},
                          onSubmitted: (value) => setState(() {
                            searchPhrase = '$value';
                          }),
                          controller: _searchController,
                        ),
                      ),
                    ),
                  ),
                  getSearchContent()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getSearchContent() {
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) {
        if (state is SearchFetchFailure)
          Utils.showAppSnackBar(context, state.error.errorMessage);
      },
      buildWhen: (prev, curr) =>
          (prev is RecentSearchFetchInProgress &&
              curr is RecentSearchFetchSuccess) ||
          (prev is RecentSearchAdditionSuccess && curr is SearchFetchSuccess),
      builder: (context, state) {
        if (state is SearchFetchSuccess) {
          return SearchResultTabView(
            searchPhrase: searchPhrase,
            courseList: state.data?.courses,
            mentorList: state.data?.mentors,
          );
        }
        if (state is RecentSearchFetchSuccess) {
          return RecentSearchListView(
            key: _key,
            searchList: state.data?.searchList,
            onSuggestPressed: () {
              setState(
                () => searchPhrase = _key.currentState?.searchPhrase ?? '',
              );
              context.read<SearchBloc>().add(
                    RecentSearchAdded(searchPhrase),
                  );
              context.read<SearchBloc>().add(SearchFetched(searchPhrase));
            },
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
