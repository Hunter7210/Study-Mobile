import 'package:flutter/material.dart';

class Exercism10 extends StatelessWidget {
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carregamento"),
        backgroundColor: Colors.indigoAccent,
      ),
      backgroundColor: Colors.blue[50],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Carregamento em Circulo"),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
            value: 10,
            strokeWidth: 6,
          )
        ],
      ),
    );
  }
}










//   const Exercism10({Key? key}) : super(key: key);

//   @override
//   State<Exercism10> createState() => _ProgressIndicatorExampleState();
// }

// class _ProgressIndicatorExampleState extends State<Exercism10>
//     with TickerProviderStateMixin {
//   late AnimationController controller;

//   @override
//   void initState() {
//     controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     )..addListener(() {
//         setState(() {});
//       });
//     controller.repeat(reverse: false);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Circular progress indicator with a fixed color',
//               style: Theme.of(context).textTheme.bodyLarge,
//             ),
//             CircularProgressIndicator(
//               value: controller.value,
//               semanticsLabel: 'Circular progress indicator',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//}
