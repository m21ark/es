import 'package:gsheets/gsheets.dart';
import 'package:uni/controller/local_storage/app_shared_preferences.dart';

import 'package:uni/model/erasmus/universityItem.dart';
import 'package:uni/model/erasmus/universityReview.dart';
import 'package:uni/view/Widgets/Erasmus/star_evaluation_view.dart';

const String _credentials = r'''
{
"type": "service_account",
"project_id": "erasmus-unite-db",
"private_key_id": "19dd4d4ec71b92104f71da69ba1ce907d02a9927",
"private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQD3au6AdJKgx8KI\n2krR31zXaWTHr/k/fjt9psCbygnB5eBXwhXHDLnE6ePeQYNjur/ZsQQhAMu6rm6/\n1Mz+o/kw69f9JkKUrWB/yhNe6p4tCskAS70BnUIL2/Au1SD7VTb3el4OazXahqpi\n5ZhoqYFmwubinut9sAABF8Z3Y0cJh6MOFkmw/KFfHpI4veGcxeEmNtChNea9CLR+\nGMIREvK0s7lZ6Jko71T/qqs4sZAH4RT89D5FNA9AvcEkCQeQzaJTsX6d9VOyTWor\nx0BaFJIlWWq8/eP0GwIgjUNWUUvy0WU5UpwM0hReE2PQnRY03zL/4mJxhDy6X6Qu\nJJ14f45TAgMBAAECggEAHEF5iHEHt9XoaRGo/svoAe/W4xk9OVuUtrZfA8uwjpTO\nqKcRLqDM7GibrevEchTHSTi2lIBPQ/wcyMqoOKKIWGZuzcnbS7h7L0zoJmxb8R/s\nsZx0suT/QHR3Oxn7AMkMFHpEmJf02AaOGepHnBhTn2U90f69PSbm8TkCYOsVF0jN\nQKpHqMa54DDipLQhpzUyf1bBDEn9ndmpYCmz6tHp/kkYo+Lbrz7Zv8Yvs8s4Ip2y\nN1ceaGhBYhYAniNfjan8VsSKB3tmddUbdiIV8ONTdCrLycKsI5dERLawIGYnvKKR\nldXfXjoJnHOQBkwm4HG1h7P1JswtUNiG8cJ7/4og2QKBgQD+7h04IACQd1Qf5DCC\nCGwwHBYoUf97Vf8BfKnTNCtu2romWoWy4jmRB91QZa2OZ0CwaMGt63Ruw62S6GUS\njngPdgSHz0pO2Hid1G2TSbkwUjSBAjkBDfTusY/ZArBFksB2NG2b4sCEZvQ3ArK8\nUbxSYuhIRA5lgXZRlRDXYJfq6wKBgQD4dL8ZS2aFVrj9ucloBCsdotcFIz3ymW2R\nN9CmtXBNpftSNz3WSEPdxUj4CzLMxVDs8vckm2XHtXg0hY4/gRNwq5rpS8WLz+Ak\n1f0z8sdIvIJ6yXGnfqaNEFCNvfFMDlegN2GQkgAxOHZuJ+rS8vhCk5af9Te46rEz\ndmWUvHTAOQKBgQCdyN025r/SqrjbwE2xverQYCHqtM3PFavuzK0D9w9G3oRGxtJn\npJOCy35Ui4o/UHL+fOgbcFcxU1W0Trh4Isv2rdIiCM/yOxN0hI2JkyDW4ppymuCT\nYYMO1cG1zG8zsKAEyXBqAo+ro1lWTwo3etN3npYsXEsY0mdcGUpCNBvzHwKBgQCN\nXZfx43X0vjBJpXEUbvK9TQ78zF2N8IBoFRLyF+BLPfquf+H+T2XWBE+NWonP+yEd\ngOzf9k9F/1niwG78cQvHmsxsm4FOGLwXGW6VJTkAiMnQ5Vd2jthjAPpke8OUm8B9\n16T6pifX2aGA8dNprXdWIjWc0+CdpWOnvWD07Pmc+QKBgBsMAR/b5RpqqrHrMD+9\nqVY1PlWqgUySXZgg+DhzhAr9PNgJ5RpSUmJHJBXFdJG0kz+GHoQkWaOwcQ85kAlc\n3QcPJm6w1MU9M6ImFWrtcJxWTQKu2uyjnuZIGEGvxD31rYYo0RBdbsZI7xdfMNVL\nWPH88O4bb2HwWKy/EIKlOA6l\n-----END PRIVATE KEY-----\n",
"client_email": "erasmus-unite-db@erasmus-unite-db.iam.gserviceaccount.com",
"client_id": "108566341049684390710",
"auth_uri": "https://accounts.google.com/o/oauth2/auth",
"token_uri": "https://oauth2.googleapis.com/token",
"auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
"client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/erasmus-unite-db%40erasmus-unite-db.iam.gserviceaccount.com"
}
''';

const String _ssID = '1iSVLb8uXwG8-ke1BJSDHX8q5PLCuVd7VhqWjwu_I8SU';

class ErasmusDB {
  static final _gsheets = GSheets(_credentials);
  static int _sNumber;

  static List<UniversityItem> _unis;
  static List<UniversityReview> _reviews;

  static Future<Worksheet> getTable(int sID) async {
    final ss = await _gsheets.spreadsheet(_ssID);
    final db = ss.worksheetById(sID);
    return db;
  }

  static fetchData() async {
    _unis = await _fetchUnis();
    _reviews = await _fetchReviews();
  }

  static Future<void> setValue(int sID, int row, int col, String value) async {
    final db = await getTable(sID);
    db.values.insertValue(value, row: row, column: col);
  }

  /*_________________________UNIVERSITIES_________________________*/

  static Future<List<UniversityItem>> _fetchUnis() async {
    final db = await getTable(0);

    final values = (await db.values.allRows()).skip(1).toList();

    return values.map((value) => UniversityItem.fromSheets(value)).toList();
  }

  static List<UniversityItem> getUnis() {
    return _unis;
  }

  static Future<void> addUni(UniversityItem uni) async {
    final db = await getTable(0);
    db.values.appendRow([
      uni.label,
      uni.name,
      uni.rank,
      uni.value,
      uni.country,
      uni.course,
      uni.link,
      uni.description,
      uni.stars.country,
      uni.stars.expenses,
      uni.stars.experience,
      uni.stars.knowledge,
      uni.imgUrl
    ]);
  }

  static Future<bool> deleteUni(int index) async {
    final db = await getTable(0);
    return db.deleteRow(index + 2);
  }

  //_____________________________UNIS LIST STUFF______________________

  static List<UniversityItem> getUniversitiesFromSearch(
      String search, String country, String course) {
    final list = _unis;

    if (search.isEmpty && country == 'All' && course == 'All') {
      return list;
    }
    list.removeWhere((element) {
      return !element.label.contains(search) ||
          (!element.country.contains(country) && country != 'All') ||
          (!element.course.contains(course) && course != 'All');
    });

    return list;
  }

  static List<String> getAvailableCountries() {
    final list = _unis;
    final set = list.map((e) => e.country).toSet();
    set.add('All');
    return set.toList();
  }

  static List<String> getAvailableCourses() {
    final list = _unis;
    final set = list.map((e) => e.course).toSet();
    set.add('All');
    return set.toList();
  }

  static List<String> getAvailableUniversities() {
    final list = _unis;
    final set = list.map((e) => e.label).toSet();
    set.add('');
    return set.toList();
  }

  static UniversityItem getUniversity(int id) {
    return _unis[id % _unis.length];
  }

  static List<UniversityItem> getTop(int n) {
    int calcScore(UniversityStarEvaluation score) {
      return score.country +
          score.expenses +
          score.experience +
          score.knowledge;
    }

    final unis2 = _unis;
    unis2.sort((a, b) => (calcScore(b.stars)).compareTo(calcScore(a.stars)));

    return unis2.sublist(0, n);
  }

  /*_________________________REVIEWS_________________________*/

  static Future<List<UniversityReview>> _fetchReviews() async {
    final db = await getTable(6996890);

    final values = (await db.values.allRows()).skip(1).toList();

    return values.map((value) => UniversityReview.fromSheets(value)).toList();
  }

  static List<UniversityReview> getReviews() {
    return _reviews;
  }

  static Future<void> addReview(UniversityReview review) async {
    final db = await getTable(6996890);
    db.values.appendRow([
      review.uniID,
      review.studentID,
      review.stars.country,
      review.stars.expenses,
      review.stars.experience,
      review.stars.knowledge,
      review.text
    ]);
  }

  static Future<bool> deleteReview(int index) async {
    final db = await getTable(6996890);
    return db.deleteRow(index + 2);
  }

  static fetchStudentInfo() async {
    String student = await AppSharedPreferences.getUserNumber();
    student = student.substring(2);
    _sNumber = int.parse(student);
  }

  static int getStudentNumber() {
    fetchStudentInfo();
    return _sNumber;
  }

  /*_________________________STUDENTS_________________________*/
}
