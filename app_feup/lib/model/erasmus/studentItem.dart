class StudentItem {
  final String id;
  final String studentID;
  final String inOutgoing;
  final String language;

  factory StudentItem.fromSheets(List<String> input) =>
      StudentItem(input[0], input[1], input[2], input[3]);

  StudentItem(this.id, this.studentID, this.inOutgoing, this.language);

  factory StudentItem.fromJson(Map<String, dynamic> json) {
    return StudentItem(
        json['id'], json['studentID'], json['inOutgoing'], json['language']);
  }
}
