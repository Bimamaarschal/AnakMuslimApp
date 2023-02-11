import 'package:anakmuslimapp/data/models/anakmuslim_model.dart';
import 'package:anakmuslimapp/domain/repositories/anakmuslim_repository.dart';

class FetchAnakMuslimUseCase {
  FetchAnakMuslimUseCase({required this.anakmuslimRepository});

  final AnakMuslimRepository anakmuslimRepository;

  Future<List<AnakMuslimModel>> call() async {
    return await anakmuslimRepository.fetch();
  }
}
