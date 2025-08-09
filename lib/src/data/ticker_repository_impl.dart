import 'package:archonit_test/src/common/base_api_repository.dart';
import 'package:archonit_test/src/common/data_state.dart';
import 'package:archonit_test/src/data/datasource/api_service.dart';
import 'package:archonit_test/src/data/mapper/ticker_results_mapper.dart';
import 'package:archonit_test/src/data/params/ticker_request.dart';
import 'package:archonit_test/src/domain/model/ticker_model.dart';
import 'package:archonit_test/src/domain/ticker_repository.dart';
import 'package:retrofit/retrofit.dart';

class TickerRepositoryImpl extends BaseApiRepository
    implements TickerRepository {
  final ApiService _api;
  TickerRepositoryImpl(
    this._api,
  );

  @override
  Future<DataState<List<TickerModel>>> getTickers(TickerRequest request) =>
      getStateOf<List<TickerModel>>(
        request: () => _api.getTickers(queries: request.toJson()).then(
              (value) => HttpResponse(value.data.toModel(), value.response),
            ),
      );
}
