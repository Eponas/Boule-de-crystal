class ZodiacSign {
  final int? id;
  final String libelle;
  final String dateDebut;
  final String dateFin;
  final String description;

  ZodiacSign({this.id, required this.libelle, required this.dateDebut, required this.dateFin, required this.description});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'libelle': libelle,
      'dateDebut': dateDebut,
      'dateFin': dateFin,
      'description': description,
    };
  }

  factory ZodiacSign.fromMap(Map<String, dynamic> map) {
    return ZodiacSign(
      id: map['id'],
      libelle: map['libelle'],
      dateDebut: map['dateDebut'],
      dateFin: map['dateFin'],
      description: map['description'],
    );
  }
}
