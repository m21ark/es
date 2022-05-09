import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/utils/constants.dart' as Constants;
import '../../Widgets/Erasmus/erasmus_nav_card.dart';

class ErasmusUniversityPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ErasmusUniversityPageViewState();
}

/// Manages the 'about' section of the app.
class ErasmusUniversityPageViewState extends GeneralPageViewState {
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
                  'Universities \n\n',
                  textScaleFactor: 1.5,
                ),
                ErasmusNavigationCard(
                    'Listed',
                    'Find your next erasmus experience in a list',
                    Constants.navErasmusUniversitiesList),
                ErasmusNavigationCard(
                    'Map',
                    'A Map with all the possible adventures you could have',
                    Constants.navErasmusMap),
              ]),
            ))
      ],
    );
  }
}
