import 'package:uni/view/Pages/Erasmus/star_evaluation_view.dart';

class UniversityItem {
  final String label;
  final String name;
  final String rank;
  final String country;
  final String course;
  final String link;
  final String imgUrl;
  final String description;
  final UniversityStarEvaluation stars;
  // the stars should come from the medium of the db
  dynamic value;

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
      this.stars});

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

class ErasmusAPI {
  static List<UniversityItem> fetchUniversities() {
    return [
      UniversityItem(
          label: 'FEUP',
          name: 'Faculdade de engenharia da universidade do Porto',
          rank: '124th',
          value: 30,
          country: 'Portugal',
          course: 'Engenharia de Software',
          link: 'https://fe.up.pt',
          imgUrl:
              'https://scontent.flis3-1.fna.fbcdn.net/v/t1.18169-9/13925143_10155132300429966_2629964604059470060_n.png?_nc_cat=111&ccb=1-6&_nc_sid=09cbfe&_nc_ohc=8YfdjtND2NAAX9FHSU2&_nc_ht=scontent.flis3-1.fna&oh=00_AT9mFrgUJBq1h5pwS2cXT-BDFHxCx5DIv_omR_wY5sR58w&oe=62A1726F',
          description: 'FEUP, is one of the most prestigious universities '
              'in Portugal, Oporto. The university has a great impact in the '
              'formation of students, being responsible for great achievements'
              ' in the engineering area.\n\n',
          stars: UniversityStarEvaluation(5, 5, 5, 5)),
      UniversityItem(
          label: 'Harvard',
          name: 'Harvard University',
          rank: '1th',
          value: 31,
          country: 'U.S.A',
          course: 'Direito',
          link: 'https://harvard.edu',
          imgUrl:
              'https://upload.wikimedia.org/wikipedia/pt/2/29/Harvard_Logo.svg.png',
          description: 'Harvard is the most prestigious University in the '
              'world. Situated in Massachusetts, U.S.A, harvard is a center '
              'of innovation, passion and future.\n\n',
          stars: UniversityStarEvaluation(2, 1, 5, 5)),
      UniversityItem(
          label: 'MIT',
          name: 'Massachusetts Institute of Technology',
          rank: '14th',
          value: 32,
          country: 'U.S.A',
          course: 'Ciência de computadores',
          link: 'https://web.mit.edu',
          imgUrl:
              'https://fastly.4sqi.net/img/general/200x200/6xtjxAwTDE3zp43q07GuSid3At539BZd5d-Jpn7txj0.jpg',
          description: 'The MIT is situated in Massachusetts, U.S.A. It is one '
              'of the most prestigious universities to work in the fields of'
              ' engineering.\n\n',
          stars: UniversityStarEvaluation(2, 1, 4, 5)),
      UniversityItem(
          label: 'FEP',
          name: 'Faculdade de economia do Porto',
          rank: '219th',
          value: 33,
          country: 'Portugal',
          course: 'Economia',
          link: 'https://fep.up.pt',
          imgUrl:
              'https://eduportugal.eu/wp-content/uploads/2021/05/FEP_logo-institucional-263x200.png',
          description: 'The Faculty of economy of University of Porto, is well '
              'known for the contribution it has in forming students in the '
              'economical areas. Being responsible in the formation of the best'
              'managers in Portugal.\n\n',
          stars: UniversityStarEvaluation(5, 5, 4, 4)),
      UniversityItem(
          label: 'FLUP',
          name: 'Faculdade de letras da universidade do Porto',
          rank: '304th',
          value: 34,
          country: 'Portugal',
          course: 'História',
          link: 'https://sigarra.up.pt/flup',
          imgUrl:
              'https://www.porto.pt/_next/image?url=https%3A%2F%2Fmedia.porto.pt%2Foriginal_images%2FDR_flup.jpg&w=730&q=85',
          description: 'The Faculty of letters of University of Porto, is well'
              'known for the passion the students have in discovering, reading '
              'and writing. The courses provided are based from the fields of '
              'languages and history.\n\n',
          stars: UniversityStarEvaluation(5, 5, 4, 4)),
      UniversityItem(
          label: 'UMinho',
          name: 'Universidade do Minho',
          rank: '295th',
          value: 35,
          country: 'Portugal',
          course: 'Engenharia de Software',
          link: 'https://www.uminho.pt/PT',
          imgUrl:
              'https://inspiring.future.pt/uploads/university/logo/41/minho.png',
          description: 'The university of minho is becoming more and more '
              'well-seen by the international community. City of Braga offers'
              'great historical places that international students can see.\n\n',
          stars: UniversityStarEvaluation(4, 5, 4, 4))
    ];
  }

  static List<UniversityItem> getUniversitiesFromSearch(
      String search, String country, String course) {
    final list = fetchUniversities();

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
    final set = fetchUniversities().map((e) => e.country).toSet();
    set.add('All');
    return set.toList();
  }

  static List<String> getAvailableCourses() {
    final set = fetchUniversities().map((e) => e.course).toSet();
    set.add('All');
    return set.toList();
  }

  static List<String> getAvailableUniversities() {
    final set = fetchUniversities().map((e) => e.label).toSet();
    set.add('');
    return set.toList();
  }

  static UniversityItem getUniversity(int id) {
    final unis = fetchUniversities();
    return unis[id % unis.length];
  }
}
