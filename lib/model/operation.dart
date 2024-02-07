import 'category.dart';

class Operation{
  final int id;
  final String date;
  final String report;
  final String toDoDate;
  // final String user_name;
  // final String dateNextOperation;
  // final int toDo;
  //final Category category;

  Operation({
    required this.id,
    required this.date,
    required this.report,
    required this.toDoDate,
    // required this.localisation,
    // required this.dateNextOperation,
    // required this.toDo,
  });

  // Construire un objet depuis un mapped JSON
  factory Operation.fromJSON(Map<String, dynamic> mappedJson) {
    return Operation(
      id: mappedJson['id'],
      date: mappedJson['date'] ?? '',
      report: mappedJson['report'] ?? '',
      toDoDate: mappedJson['toDoDate'] ?? '',
      // localisation: mappedJson['localisation'] ?? '',
      // dateNextOperation: mappedJson['dateNextOperation'] ?? '',
      // toDo: mappedJson['toDo'],
      // category: mappedJson['category'],
    );
  }
}