import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:uni/view/Pages/general_page_view.dart';

import '../../Widgets/Erasmus/eramus_nav_card_rows.dart';
import '../../../model/erasmus/erasmus_api.dart';


class ErasmusUniversityListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ErasmusUniversityListViewState();
}

class ErasmusUniversityListViewState extends GeneralPageViewState {
  String selectedCountry = 'All';
  String selectedCourse = 'All';
  String searchUni = '';

  @override
  Widget getBody(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: DropdownSearch<dynamic>(
            mode: Mode.MENU,
            items: ErasmusAPI.getAvailableUniversities(),
            showSearchBox: true,
            onChanged: (value){
              setState(() {
                searchUni = value;
              });
            },
            selectedItem: searchUni,
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child:
            Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
                ListTile(
                  title: Text('Country'),
                  trailing: DropdownButton<String>(
                    hint: Text('Country'),
                    items: ErasmusAPI.getAvailableCountries().map((e)
                    =>DropdownMenuItem<String>(
                        value: e, child: Text(e))
                    ).toList(),
                    onChanged: (value){
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
                    items: ErasmusAPI.getAvailableCourses().map((e)
                    =>DropdownMenuItem<String>(
                        value: e, child: Text(e))
                    ).toList(),
                    onChanged: (value){
                      setState(() {
                        selectedCourse = value;
                      });
                    },
                    value: selectedCourse,
                  ),
                ),
            ]
            ),
        ),
        UniversityRows(items:
          ErasmusAPI.getUniversitiesFromSearch(searchUni
                , selectedCountry, selectedCourse)
        ),
      ],
    );
  }
}
