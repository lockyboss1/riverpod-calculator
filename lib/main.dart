// import 'package:flutter/material.dart';
// import 'package:riverpod/riverpod.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int selectedButtonIndex = -1; //counter to keep track of selected button
//   String displayNum = '0';

//   Widget buildDiscountButton(int index, String label) {
//     return ElevatedButton(
//       onPressed: () {
//         setState(() {
//           selectedButtonIndex = index;
//         });
//       },
//       style: ButtonStyle(
//         backgroundColor: MaterialStateProperty.all(
//           selectedButtonIndex == index ? Colors.yellow : null,
//         ),
//       ),
//       child: Text(label),
//     );
//   }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//           title: Text(widget.title),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [],
//               ),
//               Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         buildDiscountButton(0, '10% off'),
//                         buildDiscountButton(1, '20% off'),
//                         buildDiscountButton(2, '30% off'),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         buildDiscountButton(3, '50% off'),
//                       ],
//                     ),
                  
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'calculator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: SimpleCalculator(),
    ),
  );
}
