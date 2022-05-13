import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/utils/constants.dart' as Constants;

import '../../Widgets/Erasmus/erasmus_nav_card.dart';

class ErasmusMainUniView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ErasmusMainUniViewState();
}

/// Manages the 'about' section of the app.
class ErasmusMainUniViewState extends GeneralPageViewState {
  gotoErasmusAbout(BuildContext context) =>
      Navigator.pushNamed(context, '/' + Constants.navErasmusAbout);

  @override
  Widget getBody(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    return ListView(
      children: <Widget>[
        Container(
          child: SvgPicture.asset(
            'assets/images/ni_logo.svg',
            color: Theme.of(context).colorScheme.secondary,
            width: queryData.size.height / 10,
            height: queryData.size.height / 10,
          )
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(
              left: queryData.size.width * 0.06,
              right: queryData.size.width * 0.06,
              top: queryData.size.width * 0.06,
              bottom: queryData.size.width * 0.06
            ),

            child: Column(
                children: <Widget>[
              Text(
                'Universities Main \n\n',
                textScaleFactor: 1.5,
                key: Key('Universities Main Title'),
              ),
              ErasmusNavigationCard(
                'University List',
                'Find all available universities',
                Constants.navErasmusUniversitiesList,
              ),
              ErasmusNavigationCard(
                'University Map',
                'Find universities using an interactive map',
                Constants.navErasmusMap
              ),
            ]),
          )
        )
      ],
    );
  }
}
