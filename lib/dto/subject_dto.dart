class SubjectDto {
  final int? id;
  final String? name;
  final List<int>? parallels;

  const SubjectDto({
    this.id,
    this.name,
    this.parallels,
  });

  factory SubjectDto.fromJson(Map<String, dynamic> json) {
    return SubjectDto(
      id: json['id'],
      name: json['name'],
      parallels: List<int>.from(json['parallels']?.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'parallels': parallels,
      };
}
