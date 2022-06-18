import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:wp_trade_api/api/auth/auth_controller.dart';
import 'package:wp_trade_api/api/films/film_api.dart';

void main(List<String> arguments) async {
  final app = Router();

  app.mount('/films/', FilmApi().router);

  app.get('/1c_exchange', (Request request) async {
    Map requestParameters = request.url.queryParameters;

    final parsedType = requestParameters['type'];
    final parsedMode = requestParameters['mode'];

    if (parsedMode == 'checkauth') {
      return AuthController().answerCheckAuth(request);
    }

    if (parsedMode == 'init') {
      return AuthController().answerInit(request);
    }

    return Response.ok('Error of connection. See instruction...');
  });

  app.get('/<name|.*>', (Request request, String name) {
    final param = name.isNotEmpty ? name : 'World';
    return Response.ok('Hello $param!');
  });

  await io.serve(app, 'localhost', 8083);
}