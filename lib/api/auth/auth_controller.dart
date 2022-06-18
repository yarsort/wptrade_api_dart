import 'package:shelf/shelf.dart';
//import 'package:shelf_router/shelf_router.dart';

class AuthController{

  Response answerCheckAuth(Request request) {
    var cookieName = 'dart_cookies';
    var cookieID = '654564987987sdvs';
    var answer = "success\n$cookieName\n$cookieID";
    return Response.ok(answer);
  }

  Response answerInit(Request request) {
    var zip = 'zip=yes';
    var limit = 1 * 1000 * 1024;
    var answer = "$zip\n$limit";
    return Response.ok(answer);
  }

}