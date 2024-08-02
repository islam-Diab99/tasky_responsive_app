import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/features/profile/data/profile_repo.dart';
import 'package:tasky/features/profile/logic/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  final ProfileRepo _profileRepo;
  ProfileCubit(this._profileRepo) : super(const ProfileStates.initial());
  bool _hasFetchedProfile = false;
  emitProfileStates() async {
    if (_hasFetchedProfile) return;

    emit(const ProfileStates.profileLoading());
    final response = await _profileRepo.getProfile();
    response.when(success: (profileResponse) {
      _hasFetchedProfile = true;
      emit(ProfileStates.profileSuccess(profileResponse));
    }, failure: (error) {
      emit(
          ProfileStates.profileError(error: error.apiErrorModel.message ?? ''));
    });
  }
}
