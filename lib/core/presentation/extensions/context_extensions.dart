import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/app/l10n/l10n.dart';
import 'package:flutter_template/core/presentation/utils/constants.dart';
import 'package:flutter_template/shared/presentation/cubits/flash/flash_cubit.dart';
import 'package:go_router/go_router.dart';

extension BuildContextX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);

  Size get size => MediaQuery.of(this).size;

  double get width => size.width;

  double get height => size.height;

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  GoRouter get router => GoRouter.of(this);

  Locale get locale => Localizations.localeOf(this);

  void unfocus() => FocusScope.of(this).unfocus();

  void displayFlash(String message) {
    read<FlashCubit>().displayFlash(message);
  }

  void showSnackbar({
    required String message,
    void Function()? action,
    String? actionText,
    bool isUseRootScaffoldMessengerKey = true,
  }) {
    final actionLocal = action ?? () {};
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
      action: actionText == null ? null : SnackBarAction(label: actionText, onPressed: actionLocal),
    );
    if (isUseRootScaffoldMessengerKey) {
      rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
    } else {
      ScaffoldMessenger.of(this).showSnackBar(snackBar);
    }
  }
}
