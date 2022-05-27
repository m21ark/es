// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:uni/model/erasmus/universityItem.dart';
import 'package:uni/model/erasmus/erasmus_db.dart';
import 'package:uni/utils/constants.dart' as Constants;
import '../generic_card.dart';

class ErasmusCard extends GenericCard {
  final List<UniversityItem> unis = ErasmusDB.getTop(3);

  ErasmusCard({Key key}) : super(key: key);

  ErasmusCard.fromEditingInformation(
      Key key, bool editingMode, Function onDelete)
      : super.fromEditingInformation(key, editingMode, onDelete);

  @override
  String getTitle() => 'Erasmus Unite';

  @override
  onClick(BuildContext context) =>
      Navigator.pushNamed(context, '/' + Constants.navErasmusUniversitiesList);

  @override
  Widget buildCardContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: new List.generate(
          unis.length,
          (index) => buildRow(
              context, unis[index].label, unis[index].rank, index + 1)),
    );
  }

  Widget buildRow(BuildContext context, String label, String rank, int pos) {
    return Container(
      padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
      width: 300,
      margin: EdgeInsets.all(8),
      color: Colors.grey[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              text: '($posº)',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
          RichText(
            text: TextSpan(
              text: '$label',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
          RichText(
            text: TextSpan(
              text: 'Ranking: $rank',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
