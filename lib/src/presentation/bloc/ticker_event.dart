part of 'ticker_bloc.dart';

abstract class TickerEvent extends Equatable {
  const TickerEvent();

  @override
  List<Object> get props => [];
}

class FetchTickersEvent extends TickerEvent {
  final bool more;
  const FetchTickersEvent({this.more = false});
}
