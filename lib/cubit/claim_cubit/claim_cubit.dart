import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:environment_ucb/cubit/page_status.dart';
import 'package:environment_ucb/dto/claim_dto.dart';
import 'package:environment_ucb/dto/reservation_dto.dart';
import 'package:environment_ucb/services/claim_service.dart';
import 'package:equatable/equatable.dart';

part 'claim_state.dart';

class ClaimCubit extends Cubit<ClaimState> {
  ClaimCubit() : super(ClaimState());

  void getPendingClaims() async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      List<ClaimDto> claims = await ClaimService.getPendingClaims();
      emit(state.copyWith(status: PageStatus.success, claimList: claims));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: PageStatus.failure));
    }
  }

  void setSelectedClaim(ClaimDto claimDto) {
    emit(state.copyWith(selectedClaim: claimDto));
  }

  void setImage (File image){
    emit(state.copyWith(image: image));
  }

  void registerNewClaim(int reservationId, String claimReason) async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      final imageData = await state.image!.readAsBytes();
      print("Service");
      print(claimReason);
      await ClaimService.registerNewClaim(reservationId, claimReason ,imageData);
      emit(state.copyWith(status: PageStatus.success));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: PageStatus.failure));
    }
  }
}