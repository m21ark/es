import 'package:flutter/material.dart';

import '../../../model/erasmus/erasmus_api.dart';
import '../../Pages/Erasmus/erasmus_uni_page_view.dart';
import '../generic_card.dart';

class ErasmusNavigationCard extends GenericCard {
  final String title;
  final String text;
  final gotoPage;

  ErasmusNavigationCard(this.title, this.text, this.gotoPage);

  ErasmusNavigationCard.fromEditingInformation(Key key, bool editingMode,
      Function onDelete, this.title, this.text, this.gotoPage)
      : super.fromEditingInformation(key, editingMode, onDelete);

  @override
  Widget buildCardContent(BuildContext context) {
    return Column(
      children: [
        Text(''),
        Text(this.text, style: Theme.of(context).textTheme.headline4),
      ],
      //key: Key('$title'),
    );
  }

  @override
  String getTitle() => this.title;

  @override
  onClick(BuildContext context) {
    Navigator.pushNamed(context, '/' + this.gotoPage);
  }
}

class ErasmusUniversityCard extends GenericCard {
  final UniversityItem uni;
  final gotoPage;

  ErasmusUniversityCard(this.uni, this.gotoPage);

  ErasmusUniversityCard.fromEditingInformation(
      Key key, bool editingMode, Function onDelete, this.uni, this.gotoPage)
      : super.fromEditingInformation(key, editingMode, onDelete);

  @override
  Widget buildCardContent(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);

    return Row(children: [
      Container(
          width: queryData.size.height / 7,
          height: queryData.size.height / 7,
          child: Image.network(uni.imgUrl)),
      SizedBox(width: 30),
      Expanded(
        child: Column(
          children: [
            Text(uni.name,
                softWrap: true, style: Theme.of(context).textTheme.headline2),
            SizedBox(height: 10),
            Text('International Ranking:',
                style: Theme.of(context).textTheme.subtitle2),
            SizedBox(height: 5),
            Text(uni.rank,
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .apply(fontSizeDelta: -57, fontWeightDelta: -3)),
          ],
        ),
      ),
    ]);
  }

  @override
  String getTitle() => this.uni.label;

  @override
  onClick(BuildContext context) {
    Navigator.pushNamed(context, '/' + this.gotoPage);
    ErasmusUniversityPageViewState.university = this.uni;
  }
}
