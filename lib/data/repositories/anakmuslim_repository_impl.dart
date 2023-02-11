import 'package:anakmuslimapp/data/data_sources/remote/anakmuslim_remote_data_source.dart';
import 'package:anakmuslimapp/data/models/anakmuslim_model.dart';
import 'package:anakmuslimapp/domain/repositories/anakmuslim_repository.dart';

class AnakMuslimRepositoryImpl implements AnakMuslimRepository {
  AnakMuslimRepositoryImpl({required this.anakmuslimRemoteDataSource});

  final AnakMuslimRemoteDataSource anakmuslimRemoteDataSource;

  @override
  Future<List<AnakMuslimModel>> fetch() async {
    return await anakmuslimRemoteDataSource.fetch();
  }
}
