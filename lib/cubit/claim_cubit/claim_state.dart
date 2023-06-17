part of 'claim_cubit.dart';

class ClaimState extends Equatable {
  final PageStatus status;
  final List<ClaimDto> claimList;
  final ClaimDto? selectedClaim;
  final File? image;

  const ClaimState({
    this.status = PageStatus.initial,
    this.claimList = const [],
    this.selectedClaim,
    this.image,
  });

  ClaimState copyWith({
    PageStatus? status,
    List<ClaimDto>? claimList,
    ClaimDto? selectedClaim,
    File? image,
  }) {
    return ClaimState(
      status: status ?? this.status,
      claimList: claimList ?? this.claimList,
      selectedClaim: selectedClaim ?? this.selectedClaim,
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [status, claimList, selectedClaim, image];
}

