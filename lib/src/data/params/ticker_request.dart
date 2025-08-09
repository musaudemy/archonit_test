import 'package:archonit_test/src/common/constants.dart';

class TickerRequest {
  final int offset;
  const TickerRequest({required this.offset});

  Map<String, dynamic> toJson() {
    return {
      "limit": kLimit,
      "apiKey": kApiKey,
      "offset": offset,
    };
  }
}
