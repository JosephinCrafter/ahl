part of '../ahl_barrel.dart';

/// This source file collect all assets in the project and provide handier
/// way to interact with them.
///
/// To each assets correspond an

class AhlAssets {
  const AhlAssets._(); // Prevent for instantiation

  static String get releasePath =>
      kDebugMode ? '' : 'assets/'; // used to set up path when deployed

  static String heroBk = "${releasePath}images/hero_bk.png";
  static String heroBkAlt = "${releasePath}images/hero_bk_alt.jpg";
  static String logoForm = "${releasePath}images/logo_form.png";
  static String logoFormTypoHorizontalColored =
      "${releasePath}images/logo_form_typo_horizon_colored.png";
  static String logoNdd = "${releasePath}images/logo_ndd.png";
}
