part of 'anakmuslim_bloc.dart';

abstract class AnakMuslimState extends Equatable {
  const AnakMuslimState();

  @override
  List<Object?> get props => [];
}

/// The state where [AnakMuslimState] has fetched [List<AnakMuslimModel>].
class AnakMuslimFetchedState extends AnakMuslimState {
  const AnakMuslimFetchedState({required this.listAnakMuslim});

  final List<AnakMuslimModel> listAnakMuslim;

  @override
  List<Object?> get props => [listAnakMuslim];
}

/// The state where [AnakMuslimState] is initializing the state.
class AnakMuslimInitialState extends AnakMuslimState {}

/// The state where [AnakMuslimState] is loading data.
class AnakMuslimLoadingState extends AnakMuslimState {}

/// The state where [AnakMuslimState] has loaded [AnakMuslimModel].
class AnakMuslimLoadedState extends AnakMuslimState {
  const AnakMuslimLoadedState({this.anakmuslim});

  final AnakMuslimModel? anakmuslim;

  @override
  List<Object> get props => [anakmuslim!];
}

/// The state where [AnakMuslimState] has an error including and error message.
class AnakMuslimErrorState extends AnakMuslimState {
  const AnakMuslimErrorState({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
