import 'package:archonit_test/src/common/constants.dart';
import 'package:archonit_test/src/data/dto/data_result_dto.dart';
import 'package:archonit_test/src/data/dto/ticker_dto.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(kTickerPath)
  @Headers({'Content-Type': 'application/json'})
  Future<HttpResponse<DataResultDto<TickerDto>>> getTickers({
    @Queries() required Map<String, dynamic> queries,
  });
}
