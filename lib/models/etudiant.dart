import '../contracts/notifiable.dart';
import 'personne.dart';

// Hérite de Personne et respecte le contrat Notifiable.
class Etudiant extends Personne implements Notifiable {
  static const anneeUniversitaire = '2026-2027';

  final String matricule;
  final String? email;
  double _moyenne;

  // Constructeur principal à paramètres nommés.
  Etudiant({
    required super.prenom,
    required super.nom,
    required super.age,
    required this.matricule,
    this.email,
    double moyenne = 0,
  }) : _moyenne = _validerMoyenne(moyenne);

  // Constructeur nommé : délègue au constructeur principal.
  Etudiant.inscription({
    required String prenom,
    required String nom,
    required int age,
    required String matricule,
    String? email,
    double moyenne = 0,
  }) : this(
         prenom: prenom,
         nom: nom,
         age: age,
         matricule: matricule,
         email: email,
         moyenne: moyenne,
       );

  // Reconstitue un étudiant depuis ses six champs.
  factory Etudiant.fromJson(Map<String, Object?> json) {
    final moyenne = json['moyenne'];
    if (moyenne is! num) {
      throw FormatException('La moyenne doit être numérique.', moyenne);
    }
    return Etudiant(
      prenom: json['prenom'] as String,
      nom: json['nom'] as String,
      age: json['age'] as int,
      matricule: json['matricule'] as String,
      email: json['email'] as String?,
      moyenne: moyenne.toDouble(),
    );
  }

  // Règle métier : moyenne finie, comprise entre 0 et 20 inclus.
  static double _validerMoyenne(double valeur) {
    if (!valeur.isFinite || valeur < 0 || valeur > 20) {
      throw RangeError.value(
        valeur,
        'moyenne',
        'La moyenne doit être comprise entre 0 et 20.',
      );
    }
    return valeur;
  }

  double get moyenne => _moyenne;

  set moyenne(double valeur) {
    _moyenne = _validerMoyenne(valeur);
  }

  bool get estAdmis => _moyenne >= 10;

  @override
  String sePresenter() =>
      'Je suis $nomComplet ($age ans), matricule $matricule, '
      'moyenne ${_moyenne.toStringAsFixed(2)}.';

  @override
  String notifier() {
    final destinataire = email ?? 'adresse non renseignée';
    return 'Notification pour $nomComplet envoyée à $destinataire.';
  }

  Map<String, Object?> toJson() => {
    'prenom': prenom,
    'nom': nom,
    'age': age,
    'matricule': matricule,
    'email': email,
    'moyenne': _moyenne,
  };

  @override
  String toString() =>
      'Etudiant($matricule, $nomComplet, '
      'moyenne: ${_moyenne.toStringAsFixed(2)})';
}
