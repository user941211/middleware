
//API 라우트 정의

import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:shelf_router/shelf_router.dart';
// import 'db.dart';

class Routes {
  // final DatabaseManager dbManager;
  Handler get handler {

    final router = Router();
    //첫번째 연결에 사용합니다. 
    router.get('/first', (Request request) {
      print('hello sillaenc');
      return Response.ok(jsonEncode({'message': 'access complete!!'}));
    });
    
    Future<Response> _loginTryHandler(Request request) async {
      // 요청 본문을 파싱합니다.
      final payload = jsonDecode(await request.readAsString()) as Map;
      final account = payload['account'];
      final passwd = payload['passwd'];
      Map<String,String> headers = {'Content-Type': 'application/json'};
      Map<String, dynamic> body = {
        "transaction": [
          {"query": "#login_try"}
        ]
      };
      // final databaseHelper = DatabaseHelper();
      // final userExists = databaseHelper.verifyUser(account, passwd);
      // print('Account: $account, Password: $passwd');

      // if (userExists) {
      //   return Response(200, body: '로그인 성공');
      // } else {
      //   return Response(401, body: '로그인 실패. 아이디 혹은 비밀번호를 확인하십시오.');
      // }

    }
    router.post('/login_try', _loginTryHandler);

    return router;    
  }
}