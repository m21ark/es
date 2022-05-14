import 'package:flutter/gestures.dart';
import 'package:tuple/tuple.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/view/Pages/Erasmus/erasmus_paperwork_view.dart';

import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:url_launcher/url_launcher.dart';

class ErasmusPaperworkModel extends StatefulWidget {
  const ErasmusPaperworkModel({Key key}) : super(key: key);

  @override
  _ErasmusPaperworkModelState createState() => _ErasmusPaperworkModelState();
}

class _ErasmusPaperworkModelState extends SecondaryPageViewState
    with SingleTickerProviderStateMixin {
  TabController tabController;
  ScrollController scrollViewController;

  final List<String> tabs = [
    'Who can participate',
    'How to candidate',
    'Scholarships',
    'More about Erasmus'
  ];

  List<RichText> createText(BuildContext context) {
    List<RichText> text = [
      /// tab no. 1
      RichText(
          text: TextSpan(children: [
        TextSpan(
            text: 'WHO CAN PARTICIPATE \n\n',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        TextSpan(
          text:
              'If you want to participate in this experience, you have to meet '
              'all the following requirements at the (pre-)application date:\n'
              '\n	      - Be regularly enrolled in a UP study cycle, conferring'
              " a Master's degree. In case you are also enrolled in a "
              "Bachelor's degree we would like to stress that you will NOT "
              'have the opportunity to request exemption from classes; \n\n'
              '       - Be a UE state-member citizen or from a country that '
              'participates in the program. The participation is equally '
              'extensible to political refugees and permanent residents;\n\n'
              '       - Never had participated in the ERASMUS+ program '
              '(with or without a scholarship);\n\n'
              '       - Do not benefit, at that moment, from any '
              'community financial support, through another program or action '
              'of the European Union.\n\n'
              'The selected students must not only have their tuition fees '
              'at UP in order, but they must be able to maintain their '
              'enrolment at UP in the year in which they are going to carry '
              'out the mobility. In case of expiration, the mobility will be '
              'cancelled.\n\nYou can check the link'
              ' below for all the rules of the mobility program.\n\n',
          style: TextStyle(color: Colors.black),
        ),
        TextSpan(
            text:
                'https://sigarra.up.pt/feup/pt/web_gessi_docs.download_file?p_name=F-1421452736/Regras%20Mobilidade%20OUT_ESTUDOS_2022_2023.pdf',
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()
              ..onTap = () => launch(
                  'https://sigarra.up.pt/feup/pt/web_gessi_docs.download_file?p_name=F-1421452736/Regras%20Mobilidade%20OUT_ESTUDOS_2022_2023.pdf')),
      ])),

      /// tab no. 2
      RichText(
          text: TextSpan(children: [
        TextSpan(
            text: '\n\nHOW TO CANDIDATE \n\n',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        TextSpan(
            text: 'Pre-Applications:\n\n',
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()
              ..onTap = () => launch(
                  'https://sigarra.up.pt/feup/pt/coop_candidatura_geral.inicio')),
        TextSpan(
            text: '1st call',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        TextSpan(
            text: ' - January or February of the previous academic year '
                '(for 1st and 2nd semester)\n\n',
            style: TextStyle(color: Colors.black)),
        TextSpan(
            text: '2nd call',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        TextSpan(
            text: ' - September (for remaining 2nd semester openings) \n\n\n',
            style: TextStyle(color: Colors.black)),
        TextSpan(
            text: 'Applications:\n\n',
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()
              ..onTap = () => launch(
                  'https://sigarra.up.pt/feup/pt/coop_candidatura_geral.ver_mobilidades')),
        TextSpan(
            text: '   As soon as the list resulting from the selection process '
                'is released, as a selected candidate you should formalize '
                'your, application in SIGARRA so that it can be validated and '
                'accepted by your College, according to this ',
            style: TextStyle(color: Colors.black)),
        TextSpan(
            text: 'schedule.\n',
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()
              ..onTap = () => launch(
                  'https://sigarra.up.pt/feup/pt/web_base.gera_pagina?P_pagina=1656')),
        TextSpan(
            text:
                '   Before you submit your application, you must get approval '
                'from the',
            style: TextStyle(color: Colors.black)),
        TextSpan(
            text: 'Course Mobility Coordinator.\n\n',
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()
              ..onTap = () => launch(
                  'https://sigarra.up.pt/feup/pt/web_base.gera_pagina?P_pagina=31531#Quais%20s%C3%A3o%20os%20Professores%20Respons%C3%A1veis%20pela%20Mobilidade%20de%20cada%20curso%20e%20qual%20o%20seu%20papel?'))
      ])),

      /// tab no. 3
      RichText(
          text: TextSpan(children: [
        TextSpan(
            text: '\n\nSCHOLARSHIPS AND FINANCING\n\n',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        TextSpan(
            text: '   At UP, funding is managed by the International Relations '
                'Service (SRI) of rectorate, which will communicate to all '
                'mobility students, whether or not a grant has been awarded. '
                'This communication usually takes place in June/July '
                '(1st stage) and December/January (2nd stage).\n\n'
                '   All students who are selected for Erasmus+ mobility, and '
                'have completed the application process properly, '
                'are automatically eligible for a scholarship. \n\n',
            style: TextStyle(color: Colors.black)),
        TextSpan(
            text: 'Please note: Erasmus+ financial support is only for '
                'up to four months (120 days) of mobility.',
            style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic))
      ])),

      /// tab no. 4
      RichText(
          text: TextSpan(children: [
        TextSpan(
            text: '\n\nMORE ABOUT ERASMUS\n\n  - ',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        TextSpan(
            text: 'Here',
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()
              ..onTap = () => launch(
                  'https://sigarra.up.pt/feup/pt/web_base.gera_pagina?P_pagina=31535')),
        TextSpan(
            text: ' you can find the websites and contacts for all the IESs.'
                ' If you have any questions, clarify them through these ',
            style: TextStyle(color: Colors.black)),
        TextSpan(
            text: 'contacts',
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()
              ..onTap = () => launch(
                  'https://sigarra.up.pt/feup/pt/web_base.gera_pagina?p_pagina=31544')),
        TextSpan(
            text: '\n\n\nFor more information about this program '
                'check the following links: \n\n',
            style: TextStyle(color: Colors.black)),
        TextSpan(
            text: 'Erasmus program Overview \n\n',
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()
              ..onTap = () => launch(
                  'https://sigarra.up.pt/feup/pt/WEB_BASE.GERA_PAGINA?p_pagina=erasmus')),
        TextSpan(
            text:
                'https://sigarra.up.pt/feup/pt/web_base.gera_pagina?P_pagina=31518',
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()
              ..onTap = () => launch(
                  'https://sigarra.up.pt/feup/pt/web_base.gera_pagina?P_pagina=31518'))
      ])),
    ];
    return text;
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: tabs.length);
    tabController.animateTo((tabController.index));
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget getBody(BuildContext context) {
    return StoreConnector<AppState, Tuple2<List<Lecture>, RequestStatus>>(
      converter: (store) => Tuple2(store.state.content['schedule'],
          store.state.content['scheduleStatus']),
      builder: (context, lectureData) {
        return ErasmusPaperworkView(
          tabController: tabController,
          scrollViewController: scrollViewController,
          tabBarContent: tabs,
          text: createText(context),
        );
      },
    );
  }
}
