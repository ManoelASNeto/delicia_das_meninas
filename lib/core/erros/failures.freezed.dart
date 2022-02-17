// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FailuresTearOff {
  const _$FailuresTearOff();

  NetworkFailures networkFailures() {
    return const NetworkFailures();
  }

  ServerFailures serverFailures() {
    return const ServerFailures();
  }
}

/// @nodoc
const $Failures = _$FailuresTearOff();

/// @nodoc
mixin _$Failures {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() networkFailures,
    required TResult Function() serverFailures,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? networkFailures,
    TResult Function()? serverFailures,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailures value) networkFailures,
    required TResult Function(ServerFailures value) serverFailures,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailures value)? networkFailures,
    TResult Function(ServerFailures value)? serverFailures,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailuresCopyWith<$Res> {
  factory $FailuresCopyWith(Failures value, $Res Function(Failures) then) =
      _$FailuresCopyWithImpl<$Res>;
}

/// @nodoc
class _$FailuresCopyWithImpl<$Res> implements $FailuresCopyWith<$Res> {
  _$FailuresCopyWithImpl(this._value, this._then);

  final Failures _value;
  // ignore: unused_field
  final $Res Function(Failures) _then;
}

/// @nodoc
abstract class $NetworkFailuresCopyWith<$Res> {
  factory $NetworkFailuresCopyWith(
          NetworkFailures value, $Res Function(NetworkFailures) then) =
      _$NetworkFailuresCopyWithImpl<$Res>;
}

/// @nodoc
class _$NetworkFailuresCopyWithImpl<$Res> extends _$FailuresCopyWithImpl<$Res>
    implements $NetworkFailuresCopyWith<$Res> {
  _$NetworkFailuresCopyWithImpl(
      NetworkFailures _value, $Res Function(NetworkFailures) _then)
      : super(_value, (v) => _then(v as NetworkFailures));

  @override
  NetworkFailures get _value => super._value as NetworkFailures;
}

/// @nodoc
class _$NetworkFailures implements NetworkFailures {
  const _$NetworkFailures();

  @override
  String toString() {
    return 'Failures.networkFailures()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NetworkFailures);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() networkFailures,
    required TResult Function() serverFailures,
  }) {
    return networkFailures();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? networkFailures,
    TResult Function()? serverFailures,
    required TResult orElse(),
  }) {
    if (networkFailures != null) {
      return networkFailures();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailures value) networkFailures,
    required TResult Function(ServerFailures value) serverFailures,
  }) {
    return networkFailures(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailures value)? networkFailures,
    TResult Function(ServerFailures value)? serverFailures,
    required TResult orElse(),
  }) {
    if (networkFailures != null) {
      return networkFailures(this);
    }
    return orElse();
  }
}

abstract class NetworkFailures implements Failures {
  const factory NetworkFailures() = _$NetworkFailures;
}

/// @nodoc
abstract class $ServerFailuresCopyWith<$Res> {
  factory $ServerFailuresCopyWith(
          ServerFailures value, $Res Function(ServerFailures) then) =
      _$ServerFailuresCopyWithImpl<$Res>;
}

/// @nodoc
class _$ServerFailuresCopyWithImpl<$Res> extends _$FailuresCopyWithImpl<$Res>
    implements $ServerFailuresCopyWith<$Res> {
  _$ServerFailuresCopyWithImpl(
      ServerFailures _value, $Res Function(ServerFailures) _then)
      : super(_value, (v) => _then(v as ServerFailures));

  @override
  ServerFailures get _value => super._value as ServerFailures;
}

/// @nodoc
class _$ServerFailures implements ServerFailures {
  const _$ServerFailures();

  @override
  String toString() {
    return 'Failures.serverFailures()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ServerFailures);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() networkFailures,
    required TResult Function() serverFailures,
  }) {
    return serverFailures();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? networkFailures,
    TResult Function()? serverFailures,
    required TResult orElse(),
  }) {
    if (serverFailures != null) {
      return serverFailures();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailures value) networkFailures,
    required TResult Function(ServerFailures value) serverFailures,
  }) {
    return serverFailures(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailures value)? networkFailures,
    TResult Function(ServerFailures value)? serverFailures,
    required TResult orElse(),
  }) {
    if (serverFailures != null) {
      return serverFailures(this);
    }
    return orElse();
  }
}

abstract class ServerFailures implements Failures {
  const factory ServerFailures() = _$ServerFailures;
}
