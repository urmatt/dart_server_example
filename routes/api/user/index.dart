import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import '../../../models/user.dart';

Future<Response> onRequest(RequestContext context) async {
  final request = context.request;

  if (request.method == HttpMethod.post) {
    final user = User.fromJson(jsonDecode(await request.body()));

    return Response.json(body: user);
  }

  return Response(statusCode: HttpStatus.methodNotAllowed);
}
