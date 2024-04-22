part of 'copy_bloc.dart';

@immutable
sealed class CopyState {}

final class CopyInitial extends CopyState {}

final class CopyValue extends CopyState {
  final String value;

  CopyValue({required this.value});
}

final class CopyFailure extends CopyState {
  final String errorMessage;

  CopyFailure({required this.errorMessage});
}
