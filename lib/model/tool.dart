
class Tool{
  final int id;
  final String number;
  // final String serialId;
  // final bool isActive;
  // final String localisation;
  // final String dateNextOperation;
  // final bool toDo;
  // final String category_id;

  Tool({
    required this.id,
    required this.number, });
    // required this.serialId,
    // required this.isActive,
    // required this.localisation,
    // required this.dateNextOperation,
    // required this.toDo,
    // required this.category_id});

  // Construire un objet depuis un mapped JSON
  factory Tool.fromJSON(Map<String, dynamic> mappedJson) {
    return Tool(id: mappedJson['id'], number: mappedJson['number'] ?? '');
  }
}