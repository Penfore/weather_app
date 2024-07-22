import 'package:flutter/material.dart';
import 'package:weather_app/app/core/domain/entities/enums.dart';

class StateObserver extends StatelessWidget {
  const StateObserver({
    super.key,
    required this.state,
    required this.onCompleted,
    required this.onLoading,
    required this.onError,
    this.noContent,
  });

  final StateStoreStatus state;
  final WidgetBuilder onCompleted;
  final WidgetBuilder onLoading;
  final WidgetBuilder onError;
  final WidgetBuilder? noContent;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case StateStoreStatus.completed:
        return onCompleted(context);
      case StateStoreStatus.loading:
        return onLoading(context);
      case StateStoreStatus.error:
        return onError(context);
      case StateStoreStatus.noContent:
        return noContent?.call(context) ?? const SizedBox.shrink();
    }
  }
}
