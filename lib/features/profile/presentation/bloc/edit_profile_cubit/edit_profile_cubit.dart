import 'dart:io';
import 'package:final_project/core/domain/entities/user.dart';
import 'package:final_project/features/profile/domain/usecases/edit_profile.dart';
import 'package:final_project/features/profile/presentation/bloc/edit_profile_cubit/edit_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(
    this._editUseCase,
  ) : super(const EditProfileInitial());
  final EditProfile _editUseCase;

  Future<void> editProfile({
    required User user,
    File? imageFile,
  }) async {
    emit(const EditProfileState.loading());
    final result = await _editUseCase(
      EditProfileData(
        user: user,
        imageFile: imageFile,
      ),
    );
    result.fold(
      (error) => emit(EditProfileErrorDetails(error.toString())),
      (_) => emit(const EditProfileSuccess()),
    );
  }
}
