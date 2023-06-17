part of 'claim_cubit.dart';

class ClaimState extends Equatable {
  final PageStatus status;
  final List<ClaimDto> claimList;
  final ClaimDto? selectedClaim;

  const ClaimState({
    this.status = PageStatus.initial,
    this.claimList = const [],
    this.selectedClaim,
  });

  ClaimState copyWith({
    PageStatus? status,
    List<ClaimDto>? claimList,
    ClaimDto? selectedClaim,
  }) {
    return ClaimState(
      status: status ?? this.status,
      claimList: claimList ?? this.claimList,
      selectedClaim: selectedClaim ?? this.selectedClaim,
    );
  }

  @override
  List<Object?> get props => [
        status,
        claimList,
        selectedClaim,
      ];
}

