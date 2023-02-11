import 'package:dio/dio.dart';
import 'package:anakmuslimapp/data/models/anakmuslim_model.dart';

abstract class AnakMuslimRemoteDataSource {
  Future<List<AnakMuslimModel>> fetch();
}

class AnakMuslimRemoteDataSourceImpl implements AnakMuslimRemoteDataSource {
  AnakMuslimRemoteDataSourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<List<AnakMuslimModel>> fetch() async {
    try {
      List<AnakMuslimModel> listAnakMuslim = [];
      final response =
          await dio.get('http://localhost/anakmuslim/api/anakmuslim/fetch');
      for (var data in response.data['data']) {
        AnakMuslimModel AnakMuslim = AnakMuslimModel.fromJson(data);
        listAnakMuslim.add(AnakMuslim);
      }
      return listAnakMuslim;
    } on DioError catch (e) {
      throw (DioError(
        requestOptions: e.requestOptions,
        response: e.response,
        type: e.type,
        error: e.error,
      ));
    } on Exception catch (e) {
      throw e.toString();
    }
  }
}
