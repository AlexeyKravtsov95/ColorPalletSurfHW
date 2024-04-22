import 'package:bloc/bloc.dart';
import 'package:color_pallete/copy/repository/copy_repository_impl.dart';
import 'package:meta/meta.dart';

part 'copy_event.dart';
part 'copy_state.dart';

class CopyBloc extends Bloc<CopyEvent, CopyState> {
  final CopyRepositoryImpl copyRepositoryImpl;
  CopyBloc({required this.copyRepositoryImpl}) : super(CopyInitial()) {
    on<CopyValueEvent>((event, emit) async {
      try {
        final message = await copyRepositoryImpl.copyValue(event.value);
        emit(CopyValue(value: message));
      } catch (e) {
        emit(CopyFailure(errorMessage: 'Something wrong...'));
      }
    });
  }
}
