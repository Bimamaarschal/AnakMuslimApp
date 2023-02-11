import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:anakmuslimapp/data/models/anakmuslim_model.dart';
import 'package:anakmuslimapp/domain/use_cases/fetch_anakmuslim_use_case.dart';
import 'package:stream_transform/stream_transform.dart';

part 'anakmuslim_event.dart';
part 'anakmuslim_state.dart';

/// Duration of time that used for [debounce] process.
const _duration = Duration(milliseconds: 300);

/// [debounce] used to handle event changes with a certain duration.
EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class AnakMuslimBloc extends Bloc<AnakMuslimEvent, AnakMuslimState> {
  AnakMuslimBloc({required this.fetchAnakMuslimUseCase})
      : super(AnakMuslimInitialState()) {
    on<AnakMuslimFetchEvent>(_fetch, transformer: debounce(_duration));
  }
  final FetchAnakMuslimUseCase fetchAnakMuslimUseCase;

  /// Return [AnakMuslimFetchEvent] with [List<AnakMuslimModel>] data.
  /// Throw a [AnakMuslimErrorState] along with the error message, if there is an error while retrieving list AnakMuslim data.
  void _fetch(AnakMuslimFetchEvent event, Emitter<AnakMuslimState> emit) async {
    emit(AnakMuslimLoadingState());
    try {
      final listAnakMuslim = await fetchAnakMuslimUseCase.call();
      emit(AnakMuslimFetchedState(listAnakMuslim: listAnakMuslim));
    } catch (error) {
      emit(AnakMuslimErrorState(message: error.toString()));
    }
  }

}
