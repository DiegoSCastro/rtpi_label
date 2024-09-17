class Label {
  final String name;
  final String classification;
  final String fisicalForm;
  final String destination;
  final String packagingType;
  final String content;
  final String specieIndication;
  final String useMode;
  final String preservation;
  final String controlDescription;
  final String restriction;
  final List<String> ingredients;
  final double crudeProtein;

  Label({
    required this.name,
    required this.classification,
    required this.fisicalForm,
    required this.destination,
    required this.packagingType,
    required this.content,
    required this.specieIndication,
    required this.useMode,
    required this.preservation,
    required this.controlDescription,
    required this.restriction,
    required this.ingredients,
    required this.crudeProtein,
  });

  factory Label.fromJson(Map<String, dynamic> json) {
    return Label(
      name: json['name'] ?? '',
      classification: json['classification'] ?? '',
      fisicalForm: json['fisicalForm'] ?? '',
      destination: json['destination'] ?? '',
      packagingType: json['packagingType'] ?? '',
      content: json['content'] ?? '',
      specieIndication: json['specieIndication'] ?? '',
      useMode: json['useMode'] ?? '',
      preservation: json['preservation'] ?? '',
      controlDescription: json['controlDescription'] ?? '',
      restriction: json['restriction'] ?? '',
      ingredients: List<String>.from(json['ingredients'] ?? []),
      crudeProtein: (json['crudeProtein'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'classification': classification,
      'fisicalForm': fisicalForm,
      'destination': destination,
      'packagingType': packagingType,
      'content': content,
      'specieIndication': specieIndication,
      'useMode': useMode,
      'preservation': preservation,
      'controlDescription': controlDescription,
      'restriction': restriction,
      'ingredients': ingredients,
      'crudeProtein': crudeProtein,
    };
  }

  static Label defaultLabel = Label(
    name: "Ração 16",
    classification: "Alimento para bovinos",
    fisicalForm: "Farelada",
    destination: "Bovinos",
    packagingType: "Saco de ráfia",
    content: "40kg",
    specieIndication: "Indicado para bovinos de corte",
    useMode: "Uso diário, até 1 % do peso vivo",
    preservation: "Conservar em local seco",
    controlDescription: "Controle de qualidade ISO 9001",
    restriction: "Não alimentar equinos",
    ingredients: ["Milho", "Soja", "Cálcio", "Fósforo"],
    crudeProtein: 160.0,
  );
}
