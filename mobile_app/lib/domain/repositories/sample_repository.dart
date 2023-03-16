import 'package:magic_sign/data/models/coffee.dart';

abstract class SampleRepository {
  Future<List<Coffee>> getListIcedCoffee();
}