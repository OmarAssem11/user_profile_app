import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:user_profile/core/domain/usecases/usecase.dart';
import 'package:user_profile/features/profile/domain/usecases/view_profile_use_case.dart';
import 'package:user_profile/features/profile/presentation/bloc/view_profile_cubit/view_profile_state.dart';

@injectable
class ViewProfileCubit extends Cubit<ViewProfileState> {
  ViewProfileCubit(
    this._viewUserCase,
  ) : super(const ViewProfileInitial());
  final ViewProfileUseCase _viewUserCase;

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
