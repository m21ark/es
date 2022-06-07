import 'package:flutter/material.dart';
import 'package:uni/model/erasmus/universityItem.dart';
import 'package:uni/utils/constants.dart' as Constants;

import '../../../model/erasmus/studentItem.dart';
import '../../../model/erasmus/universityReview.dart';
import 'erasmus_nav_card.dart';

class UniversityRows extends StatelessWidget {
  final List<UniversityItem> items;

  UniversityRows({
    Key key,
    @required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (items == null) return Text('\tProbleam fetching data...');
    return Container(
        child: Container(
      padding: EdgeInsets.only(left: 12.0, bottom: 8.0, right: 12),
      margin: EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
            children: getUniversityRows(context),
          ))
        ],
      ),
    ));
  }

  List<Widget> getUniversityRows(BuildContext context) {
    final List<Widget> widgets = [];

    items.forEach((element) async {
      widgets.add(
        ErasmusUniversityCard(
          element,
          Constants.navErasmusUniversityPage,
        ),
      );
    });

    return widgets;
  }
}


class ReviewRows extends StatelessWidget {
  final List<UniversityReview> items;

  ReviewRows({
    Key key,
    @required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
          padding: EdgeInsets.only(left: 12.0, bottom: 8.0, right: 12),
          margin: EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Column(
                    children: getReviewRows(context),
                  ))
            ],
          ),
        ));
  }

  List<Widget> getReviewRows(BuildContext context) {
    final List<Widget> widgets = [];

    items.forEach((element) async {
      widgets.add(
        ErasmusReviewCard(
          element,
          Constants.navErasmusReviewList,
        ),
      );
    });

    return widgets;
  }
}


class StudentRows extends StatelessWidget {
  final List<StudentItem> items;

  StudentRows({
    Key key,
    @required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
          padding: EdgeInsets.only(left: 12.0, bottom: 8.0, right: 12),
          margin: EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Column(
                    children: getStudentRows(context),
                  ))
            ],
          ),
        ));
  }

  List<Widget> getStudentRows(BuildContext context) {
    final List<Widget> widgets = [];

    items.forEach((element) async {
      widgets.add(
        ErasmusStudentCard(
          element,
          Constants.navErasmusStudentsList,
        ),
      );
    });

    return widgets;
  }
}
