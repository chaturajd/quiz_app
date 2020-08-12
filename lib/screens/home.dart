import 'package:flutter/material.dart';
import 'package:quiz_app/screens/question_screen.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionScreen(),
                  ),
                );
              },
              child: Text("Start"),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text("data"),
            ),
          ],
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
