import 'package:environment_ucb/dto/reservation_dto.dart';

class ClaimDto {
  final int? claimId;
  final ReservationDto? reservationDto;
  final String? resClaim;
  final String date;
  final String desClaim;
  final String claimState;
  final String image;

  ClaimDto({
    this.claimId,
    this.reservationDto,
    this.resClaim,
    required this.date,
    required this.desClaim,
    required this.claimState,
    required this.image,
  });

  factory ClaimDto.fromJson(Map<String, dynamic> json) {
    return ClaimDto(
      claimId: json['claimId'],
      reservationDto: ReservationDto.fromJson(json['reservationDto']),
      resClaim: json['resClaim'],
      date: json['date'],
      desClaim: json['desClaim'],
      claimState: json['claimState'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        'claimId': claimId,
        'reservationDto': reservationDto!.toJson(),
        'resClaim': resClaim,
        'date': date,
        'desClaim': desClaim,
        'claimState': claimState,
        'image': image,
      };


  @override

  String toString() {
    return 'ClaimDto{claimId: $claimId, resClaim: $resClaim, date: $date, desClaim: $desClaim, claimState: $claimState}';
  }

      

  


}