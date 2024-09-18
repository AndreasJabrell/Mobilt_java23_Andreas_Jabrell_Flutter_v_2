class HarryPotter {
  final String originalTitle;
  final String cover;
  final String description;

  HarryPotter(
      this.originalTitle,
      this.cover,
      this.description,
      );

  //skapar ett HarryPotter JSON objekt som innehåller titel, omslag och bekskrivning
  factory HarryPotter.fromMap(Map<String, dynamic> json) {
    return HarryPotter(json['originalTitle'], json['cover'], json['description']);
  }
  factory HarryPotter.fromJson(Map<String, dynamic> json) {
    return HarryPotter(json['originalTitle'], json['cover'], json['description']);
  }
}
