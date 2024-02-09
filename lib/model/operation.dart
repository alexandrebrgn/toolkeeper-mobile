import 'category.dart';
import 'tool.dart';
import 'user.dart';

class Operation{
  final int id;
  final String date;
  final String report;
  final String toDoDate;
  final Tool? tool;
  final User? user;

  Operation({
    required this.id,
    required this.date,
    required this.report,
    required this.toDoDate,
    this.tool,
    this.user,
  });

  // Construire un objet depuis un mapped JSON
  factory Operation.fromJSON(Map<String, dynamic> mappedJson) {
    return Operation(
      id: mappedJson['id'],
      date: mappedJson['date'] ?? '',
      report: mappedJson['report'] ?? '',
      toDoDate: mappedJson['toDoDate'] ?? '',
      tool: Tool.noRelationsFromJSON(mappedJson['tool']),
      user: User.fromJSON(mappedJson['user']),
    );
  }

  factory Operation.noRelationsFromJSON(Map<String, dynamic> mappedJson) {
    return Operation(
      id: mappedJson['id'],
      date: mappedJson['date'] ?? '',
      report: mappedJson['report'] ?? '',
      toDoDate: mappedJson['toDoDate'] ?? '',
    );
  }
}