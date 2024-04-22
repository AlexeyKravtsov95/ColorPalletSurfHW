part of 'copy_bloc.dart';

@immutable
sealed class CopyEvent {}

class CopyValueEvent extends CopyEvent {
  final String value;

  CopyValueEvent({required this.value});
}
