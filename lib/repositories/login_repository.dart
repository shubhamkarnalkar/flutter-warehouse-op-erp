import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:warehouse_erp/utils/utils.dart';

final loginReposProvider = Provider((ref) {
  return LoginRepository(dio: ref.watch(dioProvider));
});

class LoginRepository {
  final Dio _dio;
  LoginRepository({
    required final Dio dio,
  }) : _dio = dio;

  FutureEither<int?> login(String authBasic) async {
    late final Response resp;
    try {
      if (authBasic.isNotEmpty) {
        final Map<String, String> header = {'Authorization': authBasic};
        resp = await _dio.get(
          loginMetaDataEndpoint,
          options: Options(headers: header),
        );
        if (resp.statusCode == 201 || resp.statusCode == 200) {
          return right(200);
        } else {
          throw resp.statusMessage.toString();
        }
      }
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          throw 'Connection time out';
        case DioExceptionType.connectionError:
          throw 'Something went wrong';
        default:
          throw e.message.toString();
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
    return right(400);
  }
}
