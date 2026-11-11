import 'dart:convert';

import 'package:supdeco_dart_tp01/contracts/notifiable.dart';
import 'package:supdeco_dart_tp01/models/enseignant.dart';
import 'package:supdeco_dart_tp01/models/etudiant.dart';
import 'package:supdeco_dart_tp01/models/personne.dart';

void main() {
  // Instanciation
  final etudiante = Etudiant.inscription(
    prenom: 'Awa',
    nom: 'Diop',
    age: 23,
    matricule: 'M1-001',
    email: 'awa@supdeco.sn',
    moyenne: 13.5,
  );
  const enseignante = Enseignant(
    prenom: 'Fatou',
    nom: 'Sarr',
    age: 41,
    departement: 'Génie logiciel',
  );
  final moussa = Etudiant.inscription(
    prenom: 'Moussa',
    nom: 'Ndiaye',
    age: 25,
    matricule: 'M1-004',
  );

  // Polymorphisme
  print('--- Polymorphisme ---');
  final personnes = <Personne>[etudiante, enseignante];
  for (final personne in personnes) {
    print(personne.sePresenter());
  }
  final notifiables = <Notifiable>[etudiante];
  for (final notifiable in notifiables) {
    print(notifiable.notifier());
  }

  // Sérialisation JSON
  print('--- Sérialisation ---');
  final texteJson = jsonEncode(etudiante.toJson());
  print(texteJson);
  final decode = jsonDecode(texteJson) as Map<String, Object?>;
  final copie = Etudiant.fromJson(decode);
  print('Copie : $copie');
  print('Année universitaire : ${Etudiant.anneeUniversitaire}');
  print('Moyenne initiale de Moussa : ${moussa.moyenne}');
}
