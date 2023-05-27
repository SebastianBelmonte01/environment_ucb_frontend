class EnvironmentDto{
  final int? id;
  final String? type;
  final String? state;

  const EnvironmentDto({
    this.id,
    this.type,
    this.state,
  });

  factory EnvironmentDto.fromJson(Map<String, dynamic> json) {
    return EnvironmentDto(
      id: json['id'],
      type: json['type'],
      state: json['state'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'state': state,
      };
}