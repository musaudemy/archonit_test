import 'package:archonit_test/src/common/constants.dart';
import 'package:archonit_test/src/common/data_state.dart';
import 'package:archonit_test/src/common/enums.dart';
import 'package:archonit_test/src/data/params/ticker_request.dart';
import 'package:archonit_test/src/domain/model/ticker_model.dart';
import 'package:archonit_test/src/domain/ticker_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'ticker_state.dart';
part 'ticker_event.dart';

class TickerBloc extends Bloc<TickerEvent, TickerState> {
  final TickerRepository _tickerRepository;
  ProcessState _processState = ProcessState.idle;
  bool _hasMore = false;
  List<TickerModel> _tickers = [];
  int _offset = 0;
  TickerBloc(
    this._tickerRepository,
  ) : super(const TickerLoading([])) {
    on<FetchTickersEvent>(_fetch);
  }

  ProcessState get processState => _processState;
  bool get hasMore => _hasMore;

  set setProcessState(ProcessState state) {
    _processState = state;
  }

  void _fetch(
    FetchTickersEvent event,
    Emitter<TickerState> emit,
  ) async {
    _processState = ProcessState.busy;
    if (event.more) {
      _offset = _tickers.length;
    } else {
      emit(TickerLoading(_tickers));
      _hasMore = true;
      _tickers.clear();
      _offset = 0;
    }
    final request = TickerRequest(offset: _offset);
    final DataState<List<TickerModel>> dataState =
        await _tickerRepository.getTickers(request);
    if (dataState is DataSuccess && dataState.data != null) {
      _tickers.addAll(dataState.data!);
      if (dataState.data!.length < kLimit) {
        _hasMore = false;
      }
      final tickers = List<TickerModel>.of(_tickers);
      emit(TickerSuccess(
        tickers,
      ));
    } else {
      emit(TickerFailed(_tickers, message: dataState.message.toString()));
    }
    _processState = ProcessState.idle;
  }
}
