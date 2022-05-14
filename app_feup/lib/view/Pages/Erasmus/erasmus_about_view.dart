import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uni/view/Pages/general_page_view.dart';

class ErasmusABoutView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ErasmusABoutViewState();
}

/// Manages the 'about' section of the app.
class ErasmusABoutViewState extends GeneralPageViewState {
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
              'Erasmus Unite About\n\n',
              textScaleFactor: 1.5,
            ),
            Text(
              'CREDITOS: \n\n',
              textScaleFactor: 1.2,
            ),
            Text('João Ricardo Alves - up202007614\n\n'
                'Marco André Rocha - up202004891\n\n'
                'Matilde Pinho Borges Sequeira - up202007623\n\n'
                'Ricardo André Araújo de Matos - up202007962'),
          ]),
        ))
      ],
    );
  }
}
