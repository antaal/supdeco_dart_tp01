import 'package:supdeco_dart_tp01/models/etudiant.dart';

void main() {
  final promotion = <Etudiant>[
    Etudiant.inscription(
      prenom: 'Awa',
      nom: 'Diop',
      age: 23,
      matricule: 'M1-001',
      moyenne: 13,
    ),
    Etudiant.inscription(
      prenom: 'Ali',
      nom: 'Fall',
      age: 24,
      matricule: 'M1-002',
      moyenne: 8,
    ),
    Etudiant.inscription(
      prenom: 'Mariama',
      nom: 'Sow',
      age: 22,
      matricule: 'M1-003',
      moyenne: 17,
    ),
  ];

  // where() filtre, toList() matérialise, ..sort() trie par moyenne décroissante.
  final admis = promotion.where((e) => e.estAdmis).toList()
    ..sort((a, b) => b.moyenne.compareTo(a.moyenne));

  // Record positionnel, puis déstructuration.
  final bilan = (promotion.length, admis.length);
  final (effectif, nombreAdmis) = bilan;

  print('Admis : $nombreAdmis / $effectif');
  for (final etudiant in admis) {
    print('${etudiant.nomComplet} (${etudiant.moyenne.toStringAsFixed(0)}/20)');
  }
}
