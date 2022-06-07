import 'package:flutter/material.dart';
import 'package:uni/model/erasmus/erasmus_db.dart';
import 'package:uni/model/erasmus/studentItem.dart';

class ErasmusProfileCard extends StatefulWidget {
  ErasmusProfileCard({Key key}) : super(key: key);

  @override
  State<ErasmusProfileCard> createState() => _ErasmusProfileCardState();
}

class _ErasmusProfileCardState extends State<ErasmusProfileCard> {
  bool isErasmusStudent = false;
  bool isOutgoing = true;
  int selectedValue = 0;
  bool inDb = false;
  int sID = 0;
  bool isInitialization = true;

  bool isDbLoaded = true;

  String getStudentNumber() {
    return ErasmusDB.getStudentNumber().toString();
  }

  void updateSID() async {
    sID = await ErasmusDB.getNewStudentID();
    await ErasmusDB.fetchStudents();
    setValuesIfInDB();
  }

  void setValuesIfInDB() {
    isInitialization = false;
    List<StudentItem> students = ErasmusDB.getStudents();

    if (students.isEmpty) isDbLoaded = false;

    students = students
        .where((elem) => (elem.studentID == getStudentNumber()))
        .toSet()
        .toList();

    if (students.isNotEmpty) {
      sID = int.parse(students[0].id);
      inDb = true;
      isErasmusStudent = true;
      isOutgoing = students[0].inOutgoing == '1' ? true : false;
      selectedValue = int.parse(students[0].language);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isInitialization) setValuesIfInDB();
    if (!isDbLoaded) return Text('Problem fetching data...');
    return Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        color: Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(0x1c, 0, 0, 0),
                    blurRadius: 7.0,
                    offset: Offset(0.0, 1.0))
              ],
              color: Theme.of(context).dividerColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 60.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              width: (double.infinity),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: [
                      Flexible(
                          child: Container(
                        child: Text('Erasmus Unite',
                            style: Theme.of(context).textTheme.headline1.apply(
                                fontSizeDelta: -53, fontWeightDelta: -3)),
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.only(top: 15, bottom: 10),
                      )),
                    ].where((e) => e != null).toList(),
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      bottom: 10,
                    ),
                    child: buildContent(),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void checkBoxChange(bool boolean) {
    if (isErasmusStudent) return;
    setState(() {
      if (!isErasmusStudent && !inDb) {
        inDb = true;
        ErasmusDB.addStudent(StudentItem(null, getStudentNumber(),
            '${isOutgoing ? 1 : 0}', '$selectedValue'));
        updateSID();
      }
      isErasmusStudent = !isErasmusStudent;
      if (!isErasmusStudent) {
        ErasmusDB.deleteStudent(sID);
        inDb = false;
      }
    });
  }

  Widget myCheckBox(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Theme.of(context).colorScheme.secondary;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isErasmusStudent,
      onChanged: (boolean) => (checkBoxChange(boolean)),
    );
  }

  Widget themeText(BuildContext context, String text) {
    return Text(text,
        style: Theme.of(context).textTheme.headline4.apply(fontSizeDelta: 0));
  }

  Widget myToggleSwitch(BuildContext context) {
    return Switch(
      value: isOutgoing,
      onChanged: (value) {
        setState(() {
          isOutgoing = value;
          ErasmusDB.setStudentValue(sID, 3, isOutgoing ? '1' : '0');
        });
      },
      activeTrackColor: Colors.grey,
      inactiveTrackColor: Colors.grey,
      activeColor: Theme.of(context).colorScheme.secondary,
      inactiveThumbColor: Theme.of(context).colorScheme.secondary,
    );
  }

  Widget myDropDownButton(BuildContext context) {
    return DropdownButton(
        value: selectedValue,
        items: List.generate(ErasmusDB.languages.length, (index) {
          return DropdownMenuItem(
            child: Text(ErasmusDB.languages[index]),
            value: index,
          );
        }),
        onChanged: (value) {
          setState(() {
            selectedValue = value;
            ErasmusDB.setStudentValue(sID, 4, '$selectedValue');
          });
        });
  }

  Widget buildContent() {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              themeText(context, 'Erasmus Student?'),
              Spacer(),
              myCheckBox(context),
            ],
          ),
          SizedBox(height: 10),
          if (isErasmusStudent)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                themeText(context, 'Ingoing Student'),
                Spacer(),
                myToggleSwitch(context),
                Spacer(),
                themeText(context, 'Outgoing Student'),
              ],
            ),
          SizedBox(height: 10),
          if (isOutgoing && isErasmusStudent)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                themeText(context, 'Prefered Language:'),
                Spacer(),
                myDropDownButton(context),
              ],
            )
        ],
      ),
    );
  }
}
