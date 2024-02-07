import 'dart:convert';

jsonPrinter(data) {
  JsonEncoder encoder = const JsonEncoder.withIndent(' ');
  String prettyprint = encoder.convert(json);
  return (prettyprint);
}