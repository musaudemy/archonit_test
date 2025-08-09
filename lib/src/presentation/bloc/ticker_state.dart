part of 'ticker_bloc.dart';

abstract class TickerState extends Equatable {
  final List<TickerModel> tickers;
  const TickerState(this.tickers);
  @override
  List<Object> get props => [tickers];
}

class TickerLoading extends TickerState {
  const TickerLoading(super.tickers);
}

class TickerSuccess extends TickerState {
  const TickerSuccess(super.tickers);
}

class TickerFailed extends TickerState {
  final String message;
  const TickerFailed(super.tickers, {required this.message});
  @override
  List<Object> get props => [tickers, message];
}
