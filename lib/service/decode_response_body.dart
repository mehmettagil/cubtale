
import 'dart:convert';

import 'package:flutter/services.dart';

Map<String, dynamic> decodeResponseBody(Uint8List bodyBytes) {
  return json.decode(utf8.decode(bodyBytes)) as Map<String, dynamic>;
}
List<dynamic> decodeResponseBodyList(Uint8List bodyBytes) {
  return json.decode(utf8.decode(bodyBytes)) as List<dynamic>;
}
dynamic decodeResponseBodyListJson(Uint8List bodyBytes) {
  return json.decode(utf8.decode(bodyBytes)) as List<dynamic>;
}

