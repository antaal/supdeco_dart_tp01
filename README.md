# TP 01 — Fondamentaux et POO en Dart

Travail individuel de Master 1 Génie logiciel / MIAGE (SupDeCo Dakar).
Données entièrement fictives, sans information personnelle ni secret.

## Objectif

Reconstituer le TP 1 : fondamentaux de Dart (types, null safety, records,
switch), programmation orientée objet (classe abstraite, interface, héritage,
constructeurs), règles métier, sérialisation JSON et collections.

## Organisation

    bin/
      supdeco_dart_tp01.dart   point d'entrée du projet
      01_fondamentaux.dart     types, const/final, null safety, record, switch
      02_poo.dart              objets, polymorphisme, sérialisation JSON
      03_verifications.dart    contrôles des règles métier
      04_promotion.dart        filtrage, tri, record positionnel
    lib/
      contracts/notifiable.dart   interface Notifiable
      models/personne.dart        classe abstraite Personne
      models/enseignant.dart      classe Enseignant
      models/etudiant.dart        classe Etudiant (implémente Notifiable)

## Commandes

    dart pub get
    dart format .
    dart analyze
    dart run bin/supdeco_dart_tp01.dart
    dart run bin/01_fondamentaux.dart
    dart run bin/02_poo.dart
    dart run bin/03_verifications.dart
    dart run bin/04_promotion.dart

## Principaux résultats

- `supdeco_dart_tp01` : affiche « TP1 Dart : projet initial. »
- `01_fondamentaux` : moyenne 12.83, mention « Assez bien », contact
  « email non renseigné ».
- `02_poo` : présentation polymorphe, notification, aller-retour JSON,
  année universitaire 2026-2027, moyenne initiale de Moussa 0.0.
- `03_verifications` : 5 contrôles OK, dont une `RangeError` interceptée pour
  21/20 ; message « Tous les contrôles ont réussi. »
- `04_promotion` : « Admis : 2 / 3 », puis Mariama Sow (17/20) et
  Awa Diop (13/20).

## Remarque

`dart analyze` ne signale aucune erreur ni avertissement. Il affiche 4
informations `file_names` : les noms de fichiers `01_…` à `04_…` sont imposés
par le sujet.