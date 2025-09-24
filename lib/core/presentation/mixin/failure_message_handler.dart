import 'package:flutter/material.dart';
import 'package:flutter_template/core/domain/failures/failure.dart';
import 'package:flutter_template/core/presentation/extensions/context_extensions.dart';

mixin FailureMessageHandler {
  void handleFailure({
    required BuildContext context,
    required Failure failure,

    ///ignore validation error
    ///default is true
    ///if true, it will not show validation error
    ///if false, it will show validation error
    bool ignoreValidationError = true,
  }) {
    switch (failure) {
      case LocalFailure():
        return _displayFailure(context, failure);
      case CouldNotLaunchUrlFailure():
        return _displayFailure(context, failure);
      case ServerFailure():
        switch (failure) {
          case CancelRequest():
            return _displayFailure(context, failure);
          case TimeOutServerFailure():
            return _displayFailure(context, failure);
          case BadResponse():
            switch (failure.statusCode) {
              case 401:
                _displayFailure(context, failure);
              case 500:
                _displayFailure(context, failure);
              case 400:
              case 403:
              case 404:
              case 502:
              default:
                _displayFailure(context, failure);
            }
          case ConnectionServerFailure():
            return _displayFailure(context, failure);
          case BadCertificate():
            return _displayFailure(context, failure);
          case UnknownServerFailure():
            return _displayFailure(context, failure);
          case ValidationFailure():
            return;
        }
    }
  }

  void _displayFailure(BuildContext context, Failure failure) =>
      context.displayFlash(failure.message ?? '');
}
