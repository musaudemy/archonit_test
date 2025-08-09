class DataResultDto<T> {
  final List<T> results;

  const DataResultDto({required this.results});

  factory DataResultDto.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJson) {
    return DataResultDto(
        results: (json['data'] as List<dynamic>).map(fromJson).toList());
  }
}
