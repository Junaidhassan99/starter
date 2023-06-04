class Recipe {
  final String id;
  final String dishImage;
  final String title;
  final String duration;
  final String source;
  final List<String> information;

  Recipe({
    required this.id,
    required this.dishImage,
    required this.title,
    required this.duration,
    required this.source,
    required this.information,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      dishImage: json['dishImage'],
      title: json['title'],
      duration: json['duration'],
      source: json['source'],
      information: List<String>.from(json['information']),
    );
  }
}
