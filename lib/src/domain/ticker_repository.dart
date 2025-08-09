import 'package:archonit_test/src/common/data_state.dart';
import 'package:archonit_test/src/data/params/ticker_request.dart';
import 'package:archonit_test/src/domain/model/ticker_model.dart';

abstract class TickerRepository {
  Future<DataState<List<TickerModel>>> getTickers(TickerRequest request);
}
