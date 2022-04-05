import 'package:final_project/core/domain/usecases/usecase.dart';
import 'package:final_project/features/profile/domain/usecases/view_profile.dart';
import 'package:final_project/features/profile/presentation/bloc/view_profile_cubit/view_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ViewProfileCubit extends Cubit<ViewProfileState> {
  ViewProfileCubit(
    this._viewUserCase,
  ) : super(const ViewProfileInitial());
  final ViewProfile _viewUserCase;

  Future<void> viewProfile() async {
    emit(const ViewProfileLoading());
    final result = await _viewUserCase(NoParams());
    emit(
      result.fold(
        (error) => ViewProfileErrorDetails(error.toString()),
        (user) => ViewProfileSuccess(user),
      ),
    );
  }
}
