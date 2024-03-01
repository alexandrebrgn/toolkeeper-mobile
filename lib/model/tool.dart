import 'category.dart';
import 'operation.dart';

class Tool{
  final int id;
  final String name;
  final String serialId;
  final int isActive;
  final String localisation;
  final String dateNextOperation;
  final int toDo;
  final Category? category;
  final List<Operation>? operations;

  Tool({
    required this.id,
    required this.name,
    required this.serialId,
    required this.isActive,
    required this.localisation,
    required this.dateNextOperation,
    required this.toDo,
    this.category,
    this.operations
  });

  // Construire un objet depuis un mapped JSON
  factory Tool.fromJSON(Map<String, dynamic> mappedJson) {
    return Tool(
        id: mappedJson['id'],
        name: mappedJson['name'] ?? '',
        serialId: mappedJson['serialId'] ?? '',
        isActive: mappedJson['isActive'],
        localisation: mappedJson['localisation'] ?? '',
        dateNextOperation: mappedJson['dateNextOperation'] ?? '',
        toDo: mappedJson['toDo'],
        category: Category.fromJSON(mappedJson['category']),
        operations : mappedJson['operations'] == null ? null : mappedJson['operations'].map<Operation>((operation) => Operation.noRelationsFromJSON(operation)).toList(),
    );
  }

  factory Tool.noRelationsFromJSON(Map<String, dynamic> mappedJson) {
    return Tool(
      id: mappedJson['id'],
      name: mappedJson['name'] ?? '',
      serialId: mappedJson['serialId'] ?? '',
      isActive: mappedJson['isActive'],
      localisation: mappedJson['localisation'] ?? '',
      dateNextOperation: mappedJson['dateNextOperation'] ?? '',
      toDo: mappedJson['toDo'],
    );
  }
}