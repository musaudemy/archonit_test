import 'package:archonit_test/src/data/dto/data_result_dto.dart';
import 'package:archonit_test/src/data/dto/ticker_dto.dart';
import 'package:archonit_test/src/data/mapper/ticker_mapper.dart';
import 'package:archonit_test/src/domain/model/ticker_model.dart';

extension TickerResultsMapper on DataResultDto<TickerDto> {
  List<TickerModel> toModel() =>
      List<TickerModel>.from(results.map((e) => e.toModel()));
}
