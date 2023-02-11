import 'package:anakmuslimapp/data/models/anakmuslim_model.dart';

abstract class AnakMuslimRepository {
  Future<List<AnakMuslimModel>> fetch();
}
