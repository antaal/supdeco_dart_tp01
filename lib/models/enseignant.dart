import 'personne.dart';

class Enseignant extends Personne {
  final String departement;

  const Enseignant({
    required super.prenom,
    required super.nom,
    required super.age,
    required this.departement,
  });

  @override
  String sePresenter() => 'Je suis $nomComplet, enseignant(e) en $departement.';
}
