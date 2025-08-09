import 'package:archonit_test/src/data/dto/ticker_dto.dart';
import 'package:archonit_test/src/domain/model/ticker_model.dart';
import 'package:intl/intl.dart';

extension TickerMapper on TickerDto {
  TickerModel toModel() {
    return TickerModel(
      id: id,
      symbol: symbol,
      price: double.parse(price),
      priceStr: NumberFormat.currency(
        locale: 'en_US',
        symbol: '\$',
      ).format(double.parse(price)),
    );
  }
}
