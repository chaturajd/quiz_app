import 'package:flutter/material.dart';
import 'package:quiz_app/screens/question_screen.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuestionScreen(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45,vertical: 15),
                    child: Text(
                      "START",
                      style: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class Home extends StatelessWidget {
//   const Home({Key key}) : super(key: key);

// @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => QuestionBloc(),
//       child: Scaffold(
//         body: BlocBuilder<QuestionBloc, QuestionState>(
//           builder: (context, state) {
//             if (state is QuestionInitial) {
//               return buildCenter(context, "INITIAL STATE");
//             }
//             if (state is QuestionLoadInProgress) {
//               return buildCenter(context, "Question Loading");
//             }
//             if (state is QuestionLoaded) {
//               return buildCenter(context, state.question.question);
//             }
//             return Center(
//               child: Text("Oh oh..."),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Center buildCenter(BuildContext context, String question) {
//     final qBloc = BlocProvider.of<QuestionBloc>(context);
//     return Center(
//       child: Container(
//         child: Column(
//           children: <Widget>[
//             Container(
//               height: 100,
//             ),
//             RaisedButton(
//               onPressed: () {
//                 qBloc.add(GetQuestion(1));
//               },
//               child: Text("Next Que"),
//             ),
//             RaisedButton(
//               onPressed: () {
//                 qBloc.add(RefreshQuestionSet());
//               },
//               child: Text("Refresh"),
//             ),
//             Text(question),
//           ],
//         ),
//       ),
//     );
//   }
// }
