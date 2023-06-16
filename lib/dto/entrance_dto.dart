class EntranceDto {
  final int reservationId;
  final int classroom;
  final String building;

  EntranceDto({
    required this.reservationId,
    required this.classroom,
    required this.building,
  });

  factory EntranceDto.fromJson(Map<String, dynamic> json) => EntranceDto(
        reservationId: json["reservationId"],
        classroom: json["classroom"],
        building: json["building"],
      );


  Map<String, dynamic> toJson() => {
        "reservationId": reservationId,
        "classroom": classroom,
        "building": building,
      };

}