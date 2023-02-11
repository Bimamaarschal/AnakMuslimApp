part of 'anakmuslim_bloc.dart';

/// Abstract class to accommodate AnakMuslim event conditions.
abstract class AnakMuslimEvent extends Equatable {
  const AnakMuslimEvent();
  @override
  List<Object> get props => [];
}

/// Event when [AnakMuslimEvent] detects a change in city name.
class AnakMuslimFetchEvent extends AnakMuslimEvent {
  const AnakMuslimFetchEvent();
  @override
  List<Object> get props => [];
}
