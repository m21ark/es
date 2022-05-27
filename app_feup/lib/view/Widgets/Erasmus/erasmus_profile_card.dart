import 'package:flutter/material.dart';

class ErasmusProfileCard extends StatefulWidget {
  ErasmusProfileCard({Key key}) : super(key: key);

  @override
  State<ErasmusProfileCard> createState() => _ErasmusProfileCardState();
}

class _ErasmusProfileCardState extends State<ErasmusProfileCard> {
  bool isErasmusStudent = true;
  bool isOutgoing = true;
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
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
    setState(() {
      isErasmusStudent = !isErasmusStudent;
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
        items: [
          DropdownMenuItem(
            child: Text('Portuguese'),
            value: 0,
          ),
          DropdownMenuItem(
            child: Text('English'),
            value: 1,
          ),
          DropdownMenuItem(child: Text('Others'), value: 2),
        ],
        onChanged: (value) {
          setState(() {
            selectedValue = value;
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
