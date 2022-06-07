import 'dart:ffi';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uni/model/erasmus/erasmus_db.dart';
import 'package:uni/model/erasmus/universityItem.dart';
import 'package:uni/model/erasmus/universityReview.dart';
import 'package:uni/view/Widgets/Erasmus/star_evaluation_view.dart';

void main() {
  ErasmusDB.fetchData();
  group('Database Tests', () {
    final UniversityItem university = UniversityItem(
        label: 'TESTUNI',
        name: 'University of Testing',
        rank: '500',
        value: 1000,
        country: 'Portugal',
        course: 'Educação',
        link: 'https://www.google.com/',
        imgUrl: 'https://picsum.photos/200',
        description: 'The best testing University',
        stars: UniversityStarEvaluation(1, 1, 1, 1),
        location: LatLng(50.0123456, 19.7654321));

    final UniversityReview review = UniversityReview(
      uniID: '30',
      studentID: '202004891',
      text: 'TDD might be better than I thought',
      stars: UniversityStarEvaluation(1, 1, 1, 1)
    );

    test('Addinng and Removing a University', () async {
      await ErasmusDB.addUni(university);
      await ErasmusDB.fetchData();

      List<UniversityItem> universities = ErasmusDB.getUnis();
      bool found = false;
      universities.forEach((element) {
        if (element.label == university.label) {
          found = true;
        }
      });

      expect(found, true);

      await ErasmusDB.deleteUni(1000);
      await ErasmusDB.fetchData();

      bool deleted = true;
      universities.forEach((element) {
        if (element.label == university.label) {
          deleted = false;
        }
      });

      expect(deleted, true);
    });

    test('Addinng and Removing a Review', () async {
      await ErasmusDB.addReview(review);
      await ErasmusDB.fetchData();

      List<UniversityReview> reviews = await ErasmusDB.getReviews();
      bool found = false;
      reviews.forEach((element) {
        if (element.uniID == review.uniID && element.text == review.text && element.studentID == review.studentID) {
          found = true;
        }
      });


      expect(found, true);

      await ErasmusDB.deleteReview(reviews.length + 2);
      await ErasmusDB.fetchData();

      bool deleted = true;
      reviews.forEach((element) {
        if (element == review) {
          deleted = false;
        }
      });

      expect(deleted, true);


    });
  });
}
