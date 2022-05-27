import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:uni/view/Widgets/Erasmus/star_evaluation_view.dart';

class UniversityItem {
  final String label;
  final String name;
  final String rank;
  final String country;
  final String course;
  final String link;
  final String imgUrl;
  final String description;

  final LatLng location;

  final UniversityStarEvaluation stars;
  dynamic value;

  factory UniversityItem.fromSheets(List<String> input) => UniversityItem(
      label: input[0],
      name: input[1],
      rank: input[2],
      value: input[3],
      country: input[4],
      course: input[5],
      link: input[6],
      description: input[7],
      stars: UniversityStarEvaluation(int.parse(input[8]), int.parse(input[9]),
          int.parse(input[10]), int.parse(input[11])),
      imgUrl: input[12],
      location: LatLng(double.parse(input[13]), double.parse(input[14])));

  UniversityItem(
      {this.label,
      this.name,
      this.rank,
      this.value,
      this.country,
      this.link,
      this.course,
      this.imgUrl,
      this.description,
      this.stars,
      this.location});

  factory UniversityItem.fromJson(Map<String, dynamic> json) {
    return UniversityItem(
        label: json['label'],
        name: json['name'],
        rank: json['rank'],
        value: json['value'],
        country: json['country'],
        course: json['course'],
        link: json['link'],
        imgUrl: json['imgUrl'],
        description: json['description']);
  }
}
