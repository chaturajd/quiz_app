import 'package:http/http.dart' as http;
import 'package:quiz_app/data_provider/question_providable.dart';

class RemoteQuestions extends QuestionProvidable{
  @override
  Future<String> fetchQuestions() async{
    http.Response response;
    print("Fetching Questions");
    try {
      response = await http.get('https://opentdb.com/api.php?amount=5');
    } catch (e) {
      print("Remote Question Fetching Failed ");
      print(e);
    }

    if(response != null && response.statusCode == 200){
      print("Questionds Fetched");
      return response.body;
    }
    else{
      throw Exception("Could not Load data From Remote Server " + response.statusCode.toString());
    }
  }

}