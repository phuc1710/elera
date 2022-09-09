import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final bodyGlobalKey = GlobalKey();
  final List<Widget> myTabs = [
    const Tab(text: 'auto short'),
    const Tab(text: 'auto long'),
    const Tab(text: 'fixed'),
  ];
  TabController? _tabController;
  ScrollController? _scrollController;
  bool fixedScroll = false;

  Widget _buildCarousel() {
    return Stack(
      children: const <Widget>[
        Placeholder(fallbackHeight: 100),
        Positioned.fill(child: Align(child: Text('Slider'))),
      ],
    );
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController?.addListener(_scrollListener);
    _tabController = TabController(length: 3, vsync: this);
    _tabController?.addListener(_smoothScrollToTop);

    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _scrollController?.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (fixedScroll) {
      _scrollController?.jumpTo(0);
    }
  }

  void _smoothScrollToTop() {
    _scrollController?.animateTo(
      0,
      duration: const Duration(microseconds: 300),
      curve: Curves.ease,
    );

    setState(() {
      fixedScroll = _tabController?.index == 2;
    });
  }

  Widget _buildTabContext(int lineCount) => ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: lineCount,
        itemBuilder: (BuildContext context, int index) {
          return const Text('some content');
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(child: _buildCarousel()),
            SliverToBoxAdapter(
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.redAccent,
                isScrollable: true,
                tabs: myTabs,
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildTabContext(2),
            _buildTabContext(200),
            _buildTabContext(2)
          ],
        ),
      ),
    );
  }
}
