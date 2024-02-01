import 'category.dart';

class Tool{
  final int id;
  final String number;
  final String serialId;
  final int isActive;
  final String localisation;
  final String dateNextOperation;
  final int toDo;
  //final Category category;

  Tool({
    required this.id,
    required this.number,
    required this.serialId,
    required this.isActive,
    required this.localisation,
    required this.dateNextOperation,
    required this.toDo,});
    // required this.category});

  // Construire un objet depuis un mapped JSON
  factory Tool.fromJSON(Map<String, dynamic> mappedJson) {
    return Tool(
        id: mappedJson['id'],
        number: mappedJson['number'] ?? '',
        serialId: mappedJson['serialId'] ?? '',
        isActive: mappedJson['isActive'],
        localisation: mappedJson['localisation'] ?? '',
        dateNextOperation: mappedJson['dateNextOperation'] ?? '',
        toDo: mappedJson['toDo'],
        // category: mappedJson['category'],
    );
  }
}