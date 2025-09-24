import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'flash_state.dart';

@injectable
class FlashCubit extends Cubit<FlashState> {
  FlashCubit() : super(const FlashDisappearedState());
  String? _lastDialogMessage;
  Future<void> displayFlash(String message) async => displayDialog(FlashAppearedState(message));

  Future<void> displayDialogFlash(String message) async =>
      displayDialog(DialogFlashAppearedState(message));

  Future<void> displayDialog(AppearedState appearedState) async {
    if (_lastDialogMessage == appearedState.message) return;
    _lastDialogMessage = appearedState.message;
    emit(appearedState);
    emit(const FlashDisappearedState());
    await Future<void>.delayed(const Duration(milliseconds: 1000));
    _lastDialogMessage = null;
  }
}
