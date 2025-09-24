part of 'flash_cubit.dart';

sealed class FlashState extends Equatable {
  const FlashState();
  @override
  List<Object?> get props => [];
}

sealed class AppearedState extends FlashState {
  const AppearedState(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}

final class FlashDisappearedState extends FlashState {
  const FlashDisappearedState();
}

final class FlashAppearedState extends AppearedState {
  const FlashAppearedState(super.message);
}

final class DialogFlashAppearedState extends AppearedState {
  const DialogFlashAppearedState(super.message);
}
