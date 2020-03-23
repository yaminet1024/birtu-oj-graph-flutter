
import 'dart:convert';
import 'dart:io';

typedef onResult = void Function(int errCode, String s);

class QAService{

  void getAnswer(String text, onResult) async{
    var httpClient = new HttpClient();
    var uri = new Uri.http(
        'localhost:9944', '/api/qa', {'msg': text});
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    Map result = json.decode(responseBody);
    print(responseBody);
    onResult(result["code"],result["message"]);
  }
}