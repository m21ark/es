import 'package:uni/view/Widgets/Erasmus/star_evaluation_view.dart';

class UniversityReview {
  final String uniID;
  final String studentID;
  final String text;
  final UniversityStarEvaluation stars;

  factory UniversityReview.fromSheets(List<String> input) => UniversityReview(
        uniID: input[0],
        studentID: input[1],
        stars: UniversityStarEvaluation(int.parse(input[2]),
            int.parse(input[3]), int.parse(input[4]), int.parse(input[5])),
        text: input[6],
      );

  UniversityReview({this.uniID, this.studentID, this.text, this.stars});

  factory UniversityReview.fromJson(Map<String, dynamic> json) {
    return UniversityReview(
        uniID: json['uniID'], studentID: json['studentID'], text: json['text']);
  }
}
