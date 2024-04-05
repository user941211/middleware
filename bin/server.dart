import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import '../lib/db.dart';
import '../lib/routes.dart';

void main() async {

  final router = Router();
  final server = await io.serve(router, 'localhost', 8080);
  print('Serving at http://${server.address.host}:${server.port}');
}
  // final dbManager = DatabaseManager('C:/Users/User/Desktop/주차장/00_reference/to1.db');
  // final routes = Routes(dbManager);

  // final handler = Pipeline()
  //     .addMiddleware(logRequests())
  //     .addHandler(routes.handler);