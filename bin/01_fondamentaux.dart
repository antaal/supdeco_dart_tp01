void main() {
  // final : affectation unique ; const : constante de compilation.
  const seuilAdmission = 10.0;
  final notes = <double>[14, 8.5, 16];
  final moyenne = notes.reduce((a, b) => a + b) / notes.length;

  // String? accepte null ; ?? fournit une valeur par défaut.
  String? email;
  final contact = email ?? 'email non renseigné';

  // Record nommé : plusieurs valeurs typées sans déclarer de classe.
  final fiche = (prenom: 'Awa', moyenne: moyenne);

  // Expression switch : sélectionne la première branche correspondante.
  final mention = switch (moyenne) {
    >= 16 => 'Très bien',
    >= 14 => 'Bien',
    >= 12 => 'Assez bien',
    >= seuilAdmission => 'Passable',
    _ => 'Ajourné',
  };

  print('Prénom : ${fiche.prenom}');
  print('Moyenne : ${fiche.moyenne.toStringAsFixed(2)}');
  print('Mention : $mention');
  print('Contact : $contact');
}
