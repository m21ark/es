import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uni/view/Pages/general_page_view.dart';

class ErasmusStudentListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ErasmusStudentListViewState();
}

/// Manages the 'about' section of the app.
class ErasmusStudentListViewState extends GeneralPageViewState {
  @override
  Widget getBody(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    return ListView(
      children: <Widget>[
        Container(
            child: SvgPicture.asset(
          'assets/images/ni_logo.svg',
          color: Theme.of(context).colorScheme.secondary,
          width: queryData.size.height / 7,
          height: queryData.size.height / 7,
        )),
        Center(
            child: Padding(
          padding: EdgeInsets.only(
              left: queryData.size.width / 12,
              right: queryData.size.width / 12,
              top: queryData.size.width / 12,
              bottom: queryData.size.width / 12),
          child: Column(children: <Widget>[
            Text(
              'Student list \n\n',
              textScaleFactor: 1.5,
            ),
            Text('TODO')
          ]),
        ))
      ],
    );
  }
}
