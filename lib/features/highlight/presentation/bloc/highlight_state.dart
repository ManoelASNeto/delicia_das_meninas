import 'package:equatable/equatable.dart';

import '../../domain/entities/highlight_entity.dart';

enum HighLightStatus {
  loading,
  ready,
  error,
}

class HighLightState extends Equatable {
  final HighLightStatus status;
  final List<HighLight>? highlight;
  final String? message;

  const HighLightState._(this.status, this.highlight, this.message);

  @override
  List<Object?> get props => [
        status,
        highlight,
        message,
      ];

  HighLightState.initial() : this._(HighLightStatus.loading, [], null);

  HighLightState loading() {
    return HighLightState._(HighLightStatus.loading, highlight, message);
  }

  HighLightState ready(List<HighLight> highlight) {
    return HighLightState._(HighLightStatus.ready, highlight, message);
  }

  HighLightState error(String? msgError) {
    return HighLightState._(HighLightStatus.error, highlight, msgError);
  }
}
