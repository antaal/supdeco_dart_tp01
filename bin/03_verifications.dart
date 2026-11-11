import 'dart:convert';

import 'package:supdeco_dart_tp01/models/etudiant.dart';

// Fonction de contrôle : lève StateError si la condition est fausse.
void verifier(bool condition, String intitule) {
  if (!condition) {
    throw StateError('Échec : $intitule');
  }
  print('OK : $intitule');
}

void main() {
  final ali = Etudiant.inscription(
    prenom: 'Ali',
    nom: 'Fall',
    age: 24,
    matricule: 'M1-002',
  );

  // Scénarios
  ali.moyenne = 9;
  verifier(!ali.estAdmis, '9/20 -> non admis');

  ali.moyenne = 12;
  verifier(ali.estAdmis, '12/20 -> admis');

  var rangeErrorLevee = false;
  try {
    ali.moyenne = 21;
  } on RangeError {
    rangeErrorLevee = true;
  }
  verifier(rangeErrorLevee, '21/20 -> RangeError interceptée');
  verifier(ali.moyenne == 12, 'La moyenne reste à 12/20 après exception');

  // Intégrité des données : aller-retour JSON
  final texteJson = jsonEncode(ali.toJson());
  final copie = Etudiant.fromJson(
    jsonDecode(texteJson) as Map<String, Object?>,
  );
  verifier(copie.moyenne == 12, 'Aller-retour JSON : moyenne égale à 12');

  print('Tous les contrôles ont réussi.');
}
