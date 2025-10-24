import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tharad_tech/features/home/data/cache/hive_service.dart';
import 'package:tharad_tech/features/home/data/models/user_details_model.dart';
import 'package:tharad_tech/features/home/data/repos/user_details_repo.dart';
import 'package:tharad_tech/features/home/presentation/logic/user_details/user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState<UserDetailsModel>> {
  final UserDetailsRepo userDetailsRepo;

  UserDetailsCubit(this.userDetailsRepo) : super(const Idle());

  void emitGetUserDetails() async {
    emit(const UserDetailsState.loading());

    try {
      final cachedUserDetails = HiveService.getCachedUserDetails();

      if (cachedUserDetails != null) {
        emit(
          UserDetailsState.success(
            userResponse: cachedUserDetails,
            isFromCache: true,
          ),
        );
      }

      final result = await userDetailsRepo.getUserDetails();

      result.when(
        success: (UserDetailsModel userDetails) {
          HiveService.cacheUserDetails(userDetails);

          emit(
            UserDetailsState.success(
              userResponse: userDetails,
              isFromCache: false,
            ),
          );
        },
        failure: (error) {
          if (cachedUserDetails == null) {
            final errorMessage = error.message ?? 'Failed to load user details';
            emit(UserDetailsState.error(error: errorMessage));
          }
        },
      );
    } catch (e) {
      final cachedUserDetails = HiveService.getCachedUserDetails();
      if (cachedUserDetails != null) {
        emit(
          UserDetailsState.success(
            userResponse: cachedUserDetails,
            isFromCache: true,
          ),
        );
      } else {
        emit(UserDetailsState.error(error: e.toString()));
      }
    }
  }
}
