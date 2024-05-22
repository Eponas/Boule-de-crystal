class ChineseZodiacSign {
  final int? id;
  final int year;
  final String animal;
  final String description;

  ChineseZodiacSign({
    this.id,
    required this.year,
    required this.animal,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'year': year,
      'animal': animal,
      'description': description,
    };
  }

  factory ChineseZodiacSign.fromMap(Map<String, dynamic> map) {
    return ChineseZodiacSign(
      id: map['id'],
      year: map['year'],
      animal: map['animal'],
      description: map['description'],
    );
  }
}
