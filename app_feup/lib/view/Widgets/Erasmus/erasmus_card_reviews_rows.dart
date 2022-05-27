import 'package:flutter/material.dart';
import 'package:uni/utils/constants.dart' as Constants;

import '../../../model/erasmus/universityReview.dart';
import 'erasmus_nav_card.dart';

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
