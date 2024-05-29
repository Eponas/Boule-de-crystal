class ZodiacSign {
  final int? id;
  final String libelle;
  final String dateDebut;
  final String dateFin;
  final String description;

  ZodiacSign({
    this.id,
    required this.libelle,
    required this.dateDebut,
    required this.dateFin,
    required this.description,
  });
}

// Définir les données de mock ici
List<ZodiacSign> mockZodiacSigns = [
  ZodiacSign(
    id: 1,
    libelle: 'Bélier',
    dateDebut: '21 Mars',
    dateFin: '19 Avril',
    description: 'Vous êtes magnifique et vous avez envie de manger asiat.',
  ),
  ZodiacSign(
    id: 2,
    libelle: 'Taureau',
    dateDebut: '20 Avril',
    dateFin: '20 Mai',
    description: 'Il ne faut pas prendre vos problèmes par les cornes (c est pas pratique a manipuler).',
  ),
  ZodiacSign(
    id: 2,
    libelle: 'Sagitaire',
    dateDebut: '23 Novembre',
    dateFin: '21 Decembre',
    description: 'Vous êtes juste les best en fait, tu vas ratio tout le monde aujourd hui.',
  ),
  // Ajoutez d'autres signes ici
];
