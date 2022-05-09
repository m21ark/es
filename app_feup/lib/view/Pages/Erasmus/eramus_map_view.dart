import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uni/view/Pages/general_page_view.dart';

class ErasmusMapView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ErasmusMapViewState();
}

/// Manages the 'about' section of the app.
class ErasmusMapViewState extends GeneralPageViewState {
  @override
  Widget getBody(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    return ListView(
      children: <Widget>[
        Container(
            child: SvgPicture.asset(
          'assets/images/ni_logo.svg',
          color: Theme.of(context).accentColor,
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
              'Erasmus map \n\n',
              textScaleFactor: 1.5,
            ),
            Text('TODO')
          ]),
        ))
      ],
    );
  }
}
