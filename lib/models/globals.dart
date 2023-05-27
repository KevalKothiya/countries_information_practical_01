class Info {
  String countries;
  int population;
  List capital;
  Map<String, dynamic> lang;

  Info({
    required this.countries,
    required this.population,
    required this.capital,
    required this.lang,
  });

  factory Info.formMap(
      {required String common,
      required int population,
      required List capital,
      required Map<String, dynamic> languages}) {
    return Info(
      countries: common,
      population: population,
      capital: capital,
      lang: languages,
    );
  }
}
