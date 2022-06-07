import 'package:flutter/material.dart';
import 'package:uni/model/erasmus/erasmus_db.dart';
import 'package:uni/model/erasmus/studentItem.dart';
import 'package:uni/view/Pages/general_page_view.dart';

import '../../Widgets/Erasmus/eramus_nav_card_rows.dart';

class ErasmusStudentListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ErasmusStudentListViewState();
}

class ErasmusStudentListViewState extends GeneralPageViewState {
  String selectedErasmusState = 'All';
  String selectedLang = 'All';
  List<StudentItem> students = ErasmusDB.getStudents();

  void getReviews() {
    students = ErasmusDB.getStudents();
  }

  @override
  Widget getBody(BuildContext context) {
    getReviews();
    return ListView(
      key: Key('key_students_list'),
      children: <Widget>[
        ListTile(
          title: Text('State'),
          trailing: DropdownButton<String>(
            hint: Text('State'),
            items: [DropdownMenuItem<String>(value: "inGoing",
                child: Text("inGoing")),
              DropdownMenuItem<String>(value: "outGoing",
                  child: Text("outGoing")),
                DropdownMenuItem<String>(value: "All",
                    child: Text("All")
                )
            ],
            onChanged: (value) {
              setState(() {
                selectedErasmusState = value;
              });
            },
            value: selectedErasmusState,
          ),
        ),
        ListTile(
          title: Text('Preferred Language.'),
          trailing: DropdownButton<String>(
            hint: Text('Preferred Language'),
            items: ErasmusDB.languages
                .map((e) =>
                DropdownMenuItem<String>(value: e, child: Text(e)))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedLang = value;
              });
            },
            value: selectedLang,
          ),
        ),
        StudentRows(items: students.where((element) =>
        (element.inOutgoing == (selectedErasmusState == 'outGoing'? '1':'0')
          || selectedErasmusState == 'All')
            && (selectedLang == ErasmusDB.languages[int.parse(element.language)]
          || selectedLang == 'All'))
            .toList())
      ],
    );
  }
}
