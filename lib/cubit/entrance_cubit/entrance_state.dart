part of 'entrance_cubit.dart';

class EntranceState extends Equatable {
  final PageStatus status;
  final EntranceDto? entranceDto;
  final String? message;

  const EntranceState({
    this.status = PageStatus.initial,
    this.entranceDto,
    this.message,
  });

  EntranceState copyWith({
    PageStatus? status,
    EntranceDto? entranceDto,
    String? message,
  }) {
    return EntranceState(
      status: status ?? this.status,
      entranceDto: entranceDto ?? this.entranceDto,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status];
}

