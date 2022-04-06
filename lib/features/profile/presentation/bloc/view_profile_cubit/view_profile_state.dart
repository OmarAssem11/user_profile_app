import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_profile/core/domain/entities/user.dart';
part 'view_profile_state.freezed.dart';

@freezed
class ViewProfileState with _$ViewProfileState {
  const factory ViewProfileState.initial() = ViewProfileInitial;
  const factory ViewProfileState.loading() = ViewProfileLoading;
  const factory ViewProfileState.success(final User user) = ViewProfileSuccess;
  const factory ViewProfileState.error(final String error) =
      ViewProfileErrorDetails;
}
