
class Category{
  final int id;
  final String name;
  final String isLegal;

  Category({
    required this.id,
    required this.name,
    required this.isLegal});

  // Construire un objet depuis un mapped JSON
  factory Category.fromJSON(Map<String, dynamic> mappedJson) {
    return Category(
      id: mappedJson['id'],
      name: mappedJson['name'] ?? '',
      isLegal: mappedJson['isLegal'] ?? ''
    );
  }
}