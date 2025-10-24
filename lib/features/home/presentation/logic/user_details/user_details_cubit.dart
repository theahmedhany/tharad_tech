import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tharad_tech/core/networking/api_error_handler.dart';
import 'package:tharad_tech/core/networking/api_result.dart';
import 'package:tharad_tech/features/home/data/models/user_details_model.dart';
import 'package:tharad_tech/features/home/data/repos/user_details_repo.dart';
import 'package:tharad_tech/features/home/presentation/logic/user_details/user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState<UserDetailsModel>> {
  final UserDetailsRepo userDetailsRepo;

  UserDetailsCubit(this.userDetailsRepo) : super(const Idle());

  void emitGetUserDetails() async {
    var data = await userDetailsRepo.getUserDetails();

    data.when(
      success: (UserDetailsModel userDetails) {
        emit(UserDetailsState.success(userDetails));
      },
      failure: (error) {
        emit(
          UserDetailsState.error(error: AppErrorHandler.getErrorMessage(error)),
        );
      },
    );
  }
}
