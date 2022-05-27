import 'package:flutter/material.dart';

class UniversityStarEvaluation {
  final int expenses;
  final int experience;
  final int knowledge;
  final int country;

  UniversityStarEvaluation(
      this.country, this.expenses, this.experience, this.knowledge);
}

class StarContainer extends StatelessWidget {
  final String header;
  final int value;
  final double leftMargin;
  const StarContainer(
      String this.header, int this.value, double this.leftMargin,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: EdgeInsets.only(left: leftMargin, bottom: 20),
      child: Center(
        child: Column(children: [
          Text(
            '$header',
            textScaleFactor: 1.2,
          ),
          IconTheme(
            data: IconThemeData(
              color: Theme.of(context).colorScheme.secondary,
              size: 30,
            ),
            child: StarDisplay(value: value),
          ),
        ]),
      ),
      color: Colors.grey[300],
    );
  }
}

class StarDisplay extends StatelessWidget {
  final int value;

  const StarDisplay({Key key, this.value = 0})
      : assert(value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
        );
      }),
    );
  }
}
