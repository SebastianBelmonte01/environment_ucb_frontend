part of 'claim_cubit.dart';

class ClaimState extends Equatable {
  final PageStatus status;
  final List<ClaimDto> claimList;
  final ClaimDto? selectedClaim;
  final File? image;
  final bool? isAnswered;

  const ClaimState({
    this.status = PageStatus.loading,
    this.claimList = const [],
    this.selectedClaim,
    this.image,
    this.isAnswered = true,
  });

  ClaimState copyWith({
    PageStatus? status,
    List<ClaimDto>? claimList,
    ClaimDto? selectedClaim,
    File? image,
    bool? isAnswered,
  }) {
    return ClaimState(
      status: status ?? this.status,
      claimList: claimList ?? this.claimList,
      selectedClaim: selectedClaim ?? this.selectedClaim,
      image: image ?? this.image,
      isAnswered: isAnswered ?? this.isAnswered,
    );
  }

  @override

  List<Object?> get props => [
        status,
        claimList,
        selectedClaim,
        image,
        isAnswered,
      ];
}

