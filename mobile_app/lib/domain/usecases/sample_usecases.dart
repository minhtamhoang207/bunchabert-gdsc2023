import 'dart:async';

import 'package:magic_sign/data/models/coffee.dart';
import 'package:magic_sign/domain/entities/sample.dart';
import 'package:magic_sign/domain/repositories/sample_repository.dart';

class SampleUseCases {
  final SampleRepository sampleRepository;

  SampleUseCases({required this.sampleRepository});

  FutureOr<List<Coffee>> getListIcedCoffee() async {
    // if(param == null) {
    //   throw NullThrownError();
    // }
    final response = await sampleRepository.getListIcedCoffee();
    print(response);
    return response;
    // return response.data;
  }
}