// ignore_for_file: avoid_print, dead_code, prefer_const_constructors, constant_identifier_names
import 'dart:convert';
import 'dart:async';
import 'dart:io'; // Package File
import 'package:path/path.dart'; // Package Get File Name
import 'package:http/http.dart' as http; // Package Server
import 'package:yemen_gallary/errors/servers/app_exception.dart'; // Package Convert Json Data

/*
  Class crud:
    C => Create
    r => Read
    u => Update
    d => Delete
*/

class Crud {
  static const int TIME_OUT_DURATION = 20;

  // Start Function Get Request Data //
  Future<dynamic> getRequest(String url) async {
    try {
      var response = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connections', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API Not Responded in Time', url.toString());
    }
  }
  // End Function Get Request Data //

  // Start Function Post Request Data //
  Future<dynamic> postRequest(String url, Map data) async {
    try {
      var response = await http
          .post(Uri.parse(url), body: data)
          .timeout(Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connections', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API Not Responded in Time', url.toString());
    }
  }
  // End Function Post Request Data //

  // Start Function Send File Request //
  Future<dynamic> postRequestFile(String baseUrl, Map data, File file) async {
    var uri = Uri.parse(baseUrl);
    try {
      var request = http.MultipartRequest("POST", uri);
      var length = await file.length(); // Get Length File
      var stream = http.ByteStream(file.openRead()); // Can Open Read File
      var multipartFile = http.MultipartFile("file", stream, length,
          filename: basename(file.path));
      request.files.add(multipartFile); // Request Send File
      // Request Send Dynamic Content
      data.forEach((key, value) {
        request.fields[key] = value;
      });
      var myrequest = await request.send();
      var response = await http.Response.fromStream(myrequest);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connections', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API Not Responded in Time', uri.toString());
    }
  }
  // End Function Send File Request //

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        return responseJson;
        break;

      case 400:
        throw BadRequestException(
            jsonDecode(response.body), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            jsonDecode(response.body), response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error Occured With Code : ${response.statusCode}',
            response.request!.url.toString());
    }
  }
}
