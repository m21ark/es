
class UniversityItem {
  final String label;
  final String name;
  final String rank;
  final String country;
  final String course;
  final String imgUrl;


  dynamic value;

  UniversityItem({
    this.label,
    this.name,
    this.rank,
    this.value,
    this.country,
    this.course,
    this.imgUrl
  });

  factory UniversityItem.fromJson(Map<String, dynamic> json) {
    return UniversityItem(
        label: json['label'],
        name: json['name'],
        rank: json['rank'],
        value: json['value'],
        country: json['country'],
        course: json['course'],
        imgUrl: json['imgUrl']
    );
  }
}

class ErasmusAPI {

  static List<UniversityItem> fetchUniversities() {
    return [UniversityItem(label : 'Feup',
        name: 'Faculdade de engenharia da universidade do Porto',
        rank: '124th',value : 30, country: 'Portugal',
        course: 'Engenharia de Software', imgUrl: 'https://picsum.photos/200'),
      UniversityItem(label : 'Harvard',
          name: 'Harvard University',
          rank: '124th',value : 31, country: 'U.S.A',
          course: 'Direito', imgUrl: 'https://picsum.photos/200'),
      UniversityItem(label : 'MIT',
          name: 'Massachusetts Institute of Technology',
          rank: '124th', value : 32, country: 'U.S.A',
          course: 'Ciência de computadores', imgUrl: 'https://picsum.photos/200'),
      UniversityItem(label : 'FEP',
          name: 'Faculdade de economia do Porto',
          rank: '124th',value : 33, country: 'Portugal',
          course: 'Economia', imgUrl: 'https://picsum.photos/200'),
      UniversityItem(label : 'Flup',
          name: 'Faculdade de letras da universidade do Porto',
          rank: '124th', value : 34, country: 'Portugal',
          course: 'História', imgUrl: 'https://picsum.photos/200'),
      UniversityItem(label : 'Uminho',
          name: 'Universidade do Minho',
          rank: '254th', value : 35, country: 'Portugal',
          course: 'Engenharia de Software', imgUrl: 'https://picsum.photos/200')
    ];
  }

  static List<UniversityItem> getUniversitiesFromSearch(String search,
      String country, String course) {

      final list = fetchUniversities();

      if (search.isEmpty && country == 'All' && course == 'All') {
        return list;
      }
      list.removeWhere((element) {
        return !element.label.contains(search)
            || (!element.country.contains(country) && country != 'All')
            || (!element.course.contains(course) && course != 'All');
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
}

