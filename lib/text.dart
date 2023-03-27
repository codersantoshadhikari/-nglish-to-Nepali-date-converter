// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:nepali_utils/nepali_utils.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   DateTime _selectedDate = DateTime.now();
//   String _nepaliDate = "";
//   // change date
//   _changeDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: DateTime(2023),
//         firstDate: DateTime(1980),
//         lastDate: DateTime(2030));
//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Ënglish to Nepali date converter"),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Row(
//             children: [
//               Text(
//                   "Selected Date: ${_selectedDate.toString().substring(0, 10)}",
//                   style: GoogleFonts.getFont(
//                     'Anton',
//                     textStyle: const TextStyle(fontSize: 24),
//                   )),
//               MaterialButton(
//                 onPressed: () {
//                   _changeDate(context);
//                 },
//                 child: const Text("Change Date"),
//               )
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: InkWell(
//               onTap: () {
//                 NepaliDateTime nt = _selectedDate.toNepaliDateTime();
//                 _nepaliDate = nt.toString().toString().substring(0, 10);
//                 showDialog(
//                   context: context,
//                   builder: (ctx) => AlertDialog(
//                     title: const Text("Nepali date "),
//                     content: Text(
//                       "Converted date is ${_selectedDate.toString().substring(0, 10)} is $_nepaliDate.",
//                       textAlign: TextAlign.center,
//                     ),
//                     actions: <Widget>[
//                       TextButton(
//                         onPressed: () {
//                           Navigator.of(ctx).pop();
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.all(14),
//                           child: const Text("okay"),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//               child: Container(
//                 height: 50,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   gradient: const LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Color(0xFF3700B3),
//                       Color(0xFF03DAC6),
//                     ],
//                   ),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     "Convert",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(color: Colors.white, fontSize: 22),
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }