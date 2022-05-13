import 'package:flutter/material.dart';
import 'package:uni/view/Widgets/page_title.dart';
import 'package:uni/view/Widgets/request_dependent_widget_builder.dart';

/// Manages the 'paperwork' sections of the app
class ErasmusPaperworkView extends StatelessWidget {
  ErasmusPaperworkView(
      {Key key,
      @required this.tabController,
      @required this.tabBarContent,
      @required this.text,
      this.scrollViewController});

  final List<String> tabBarContent;
  final List<RichText> text;
  final TabController tabController;
  final ScrollController scrollViewController;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);

    return Column(children: <Widget>[
      ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          PageTitle(name: 'Paperwork'),
          TabBar(
            controller: tabController,
            isScrollable: true,
            tabs: createTabs(queryData, context),
          ),
        ],
      ),
      Expanded(
          child: TabBarView(
        controller: tabController,
        children: createPaperwork(context),
      ))
    ]);
  }

  List<Widget> createTabs(queryData, BuildContext context) {
    final List<Widget> tabs = <Widget>[];
    for (var i = 0; i < tabBarContent.length; i++) {
      tabs.add(Container(
        color: Theme.of(context).backgroundColor,
        width: queryData.size.width * 1 / 3,
        child: Tab(key: Key('paperwork-page-tab-$i'), text: tabBarContent[i]),
      ));
    }
    return tabs;
  }

  List<Widget> createPaperwork(context) {
    final List<Widget> tabBarViewContent = <Widget>[];
    for (int i = 0; i < tabBarContent.length; i++) {
      tabBarViewContent.add(createTabBody(context, i));
    }
    return tabBarViewContent;
  }

  Widget Function(dynamic textContent, BuildContext context) displayTabContent(
      int i) {
    Widget tabContent(textContent, BuildContext context) {
      return Container(
          key: Key('paperwork-page-day-column-$i'),
          child: ListView(
            children: <Widget>[
              Center(
                  child: Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
                child: textContent,
              ))
            ],
          ));
    }

    return tabContent;
  }

  Widget createTabBody(BuildContext context, int i) {
    return RequestDependentWidgetBuilder(
      context: context,
      contentGenerator: displayTabContent(i),
      content: text[i],
      contentChecker: true,
      onNullContent: Center(child: Text('Página em construção...')),
      index: i,
      status: null,
    );
  }
}
