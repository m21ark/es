import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:uni/model/erasmus/erasmus_db.dart';
import 'package:uni/model/erasmus/universityReview.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/view/Widgets/Erasmus/star_evaluation_view.dart';

class ErasmusUniversityReviewView extends StatefulWidget {
  const ErasmusUniversityReviewView({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ErasmusUniversityReviewViewState();
}

class RatingWraper {
  int value;
  String description;
  IconData icon;

  RatingWraper(int valueRating, String descriptionRating, IconData iconRating) {
    this.value = valueRating;
    this.description = descriptionRating;
    this.icon = iconRating;
  }
}

/// Manages the 'about' section of the app.
class ErasmusUniversityReviewViewState extends GeneralPageViewState {
  static final _formKey = GlobalKey<FormState>();

  String comment;
  final String commentString = 'Write your comment here';

  RatingWraper expensesWraper = RatingWraper(3, 'Expenses', Icons.euro);
  RatingWraper experienceWraper = RatingWraper(3, 'Experience', Icons.star);
  RatingWraper knowledgeWraper = RatingWraper(3, 'Knowledge', Icons.school);
  RatingWraper countryWraper = RatingWraper(3, 'Country Culture', Icons.public);

  // chamar funcao para guardar na database a review
  void postReview(UniversityReview review) async {
    await ErasmusDB.addReview(review);
  }

  int getStudentNumber() {
    return ErasmusDB.getStudentNumber();
  }

  Widget getRatingForm(RatingWraper ratingWraper) {
    final MediaQueryData queryData = MediaQuery.of(context);

    return Container(
      width: queryData.size.width / 2.6,
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            ratingWraper.description,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
            child: RatingBar.builder(
              initialRating: ratingWraper.value.toDouble(),
              minRating: 1,
              maxRating: 5,
              direction: Axis.horizontal,
              itemCount: 5,
              itemSize: 25,
              itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
              itemBuilder: (context, _) => Icon(
                ratingWraper.icon,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onRatingUpdate: (rating) {
                ratingWraper.value = rating.ceil();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget getReviewForm(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);

    return Form(
      key: _formKey,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            getRatingForm(expensesWraper),
            getRatingForm(experienceWraper),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            getRatingForm(knowledgeWraper),
            getRatingForm(countryWraper),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: queryData.size.width / 1.4,
          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: TextFormField(
            onSaved: (String value) {
              comment = value;
            },
            minLines: 1,
            maxLines: 5,
            decoration: InputDecoration(
              helperStyle: TextStyle(color: Colors.black),
              labelText: commentString,
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              icon: Icon(Icons.notes),
            ),
            validator: (value) {
              if (value.isEmpty) return 'Please fill this field';
              return null;
            },
          ),
        ),
        SizedBox(
          height: 30,
        ),
        OutlinedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).colorScheme.secondary,
                )),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                final arguments = (ModalRoute.of(context)?.settings.arguments ??
                    <String, dynamic>{}) as Map;
                //print(arguments['uniID']);
                final UniversityReview review = UniversityReview(
                    uniID: arguments['uniID'],
                    studentID: getStudentNumber().toString(),
                    text: comment,
                    stars: UniversityStarEvaluation(
                        expensesWraper.value,
                        experienceWraper.value,
                        knowledgeWraper.value,
                        countryWraper.value));
                postReview(review);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Publish',
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ))
      ]),
    );
  }

  @override
  Widget getBody(BuildContext context) {
    getStudentNumber();

    final MediaQueryData queryData = MediaQuery.of(context);
    return ListView(
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Make Review",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 28,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.shadow,
            border: Border.all(color: Colors.grey, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Fill your review",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              getReviewForm(context),
            ],
          ),
        )
      ],
    );
  }
}
