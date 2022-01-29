import 'package:asyncstate/asyncstate.dart';
import 'package:dio/dio.dart';
import 'package:testeasyncstate/pages/my_loading.dart';

class HomeController with AsyncStateMixin {
  Future<Map<String, dynamic>> buscarCep(String cep) async {
    Dio dio = Dio();
    String url = 'https://viacep.com.br/ws/$cep/json/';
    Response response = await dio.get(url).asyncLoader(
            customLoader: MyLoading(
          texto: ' Procurando cep $cep',
        ));
    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      return {};
    }
  }
}
