import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:uni/model/erasmus/erasmus_db.dart';
import 'package:uni/view/Pages/general_page_view.dart';

import '../../Widgets/Erasmus/eramus_nav_card_rows.dart';

class ErasmusUniversityListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ErasmusUniversityListViewState();
}

class ErasmusUniversityListViewState extends GeneralPageViewState {
  String selectedCountry = 'All';
  String selectedCourse = 'All';
  String searchUni = '';

  List<String> unis;

  void getUnisInfo() async {
    await ErasmusDB.fetchData();
    final unisList = ErasmusDB.getUnis();
    final set = unisList.map((e) => e.label).toSet();
    set.add('');
    unis = set.toList();
  }

  @override
  Widget getBody(BuildContext context) {
    getUnisInfo();
    return ListView(
      key: Key('key_Universities List'),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: DropdownSearch<dynamic>(
            mode: Mode.MENU,
            items: ErasmusDB.getAvailableUniversities(),
            showSearchBox: true,
            onChanged: (value) {
              setState(() {
                searchUni = value;
              });
            },
            selectedItem: searchUni,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  title: Text('Country'),
                  trailing: DropdownButton<String>(
                    hint: Text('Country'),
                    items: ErasmusDB.getAvailableCountries()
                        .map((e) =>
                            DropdownMenuItem<String>(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCountry = value;
                      });
                    },
                    value: selectedCountry,
                  ),
                ),
                ListTile(
                  title: Text('Course'),
                  trailing: DropdownButton<String>(
                    hint: Text('Course'),
                    items: ErasmusDB.getAvailableCourses()
                        .map((e) =>
                            DropdownMenuItem<String>(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCourse = value;
                      });
                    },
                    value: selectedCourse,
                  ),
                ),
              ]),
        ),
        UniversityRows(
            items: ErasmusDB.getUniversitiesFromSearch(
                searchUni, selectedCountry, selectedCourse)),
      ],
    );
  }
}
