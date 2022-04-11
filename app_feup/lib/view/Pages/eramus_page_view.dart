import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uni/view/Pages/general_page_view.dart';

class ErasmusPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ErasmusPageViewState();
}

/// Manages the 'about' section of the app.
class ErasmusPageViewState extends GeneralPageViewState {
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
                Text('CREDITOS: \n\n', textScaleFactor: 1.5,),
                Text('Eva Filipa Silva Correia Carvalho - up202006379\n\n'
                    'João Ricardo Alves - up202007614\n\n'
                    'Marco André Rocha - up202004891\n\n'
                    'Matilde Pinho Borges Sequeira - up202007623\n\n'
                    'Ricardo André Araújo de Matos - up202007962')
              ]),
            ))
      ],
    );
  }
}
