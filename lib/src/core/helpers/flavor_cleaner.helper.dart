class FlavorCleaner {
  /// Cleans a 'flavor_text' from pokeApi and returns without breaking-line caracters
  static String clean(String? text) {
    final cleanedText =
        (text ?? "").replaceAll("\n", " ").replaceAll("\f", " ");
    return '"$cleanedText"';
  }
}
