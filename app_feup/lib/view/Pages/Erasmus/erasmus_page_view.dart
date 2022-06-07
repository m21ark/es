import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:uni/model/erasmus/erasmus_db.dart';

import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/utils/constants.dart' as Constants;

import '../../Widgets/Erasmus/erasmus_nav_card.dart';

class ErasmusMainPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ErasmusMainPageViewState();
}

/// Manages the 'about' section of the app.
class ErasmusMainPageViewState extends GeneralPageViewState {
  gotoErasmusAbout(BuildContext context) =>
      Navigator.pushNamed(context, '/' + Constants.navErasmusAbout);

  @override
  Widget getBody(BuildContext context) {
    ErasmusDB.fetchStudentInfo();
    ErasmusDB.fetchStudents();

    final MediaQueryData queryData = MediaQuery.of(context);
    return ListView(
      children: <Widget>[
        Container(
            child: SvgPicture.asset(
          'assets/images/ni_logo.svg',
          color: Theme.of(context).colorScheme.secondary,
          width: queryData.size.height / 10,
          height: queryData.size.height / 10,
        )),
        Center(
            child: Padding(
          padding: EdgeInsets.only(
              left: queryData.size.width * 0.06,
              right: queryData.size.width * 0.06,
              top: queryData.size.width * 0.06,
              bottom: queryData.size.width * 0.06),
          child: Column(children: <Widget>[
            Text(
              'Erasmus Unite \n\n',
              textScaleFactor: 1.5,
              key: Key('Erasmus Unite Title'),
            ),
            ErasmusNavigationCard('Students', 'Find other Erasmus students',
                Constants.navErasmusStudentsList),
            ErasmusNavigationCard(
                'Universities',
                'Find info about Erasmus Universities',
                Constants.navErasmusMainUni),
            ErasmusNavigationCard(
                'Paperwork',
                'Find all you need to enroll in Erasmus',
                Constants.navErasmusPaperwork),
            TextButton(
                onPressed: () {
                  gotoErasmusAbout(context);
                },
                child: Text('About Erasmus')),
          ]),
        ))
      ],
    );
  }
}
