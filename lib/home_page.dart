import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepali_utils/nepali_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();
  String _nepaliDate = "";

  // change date
  _changeDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(2023),
        firstDate: DateTime(1980),
        lastDate: DateTime(2030));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 181, 48, 0),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 181, 48, 0),
        title: const Center(child: Text("English to Nepali Date Converter")),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            Text(
              "Selected Date: ${_selectedDate.toString().substring(0, 10)}",
              style: GoogleFonts.getFont(
                'Anton',
                textStyle: const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 20.0),
            MaterialButton(
              onPressed: () {
                _changeDate(context);
              },
              child: const Text("Change Date"),
              textColor: Colors.white,
              color: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(height: 30.0),
            InkWell(
              onTap: () {
                NepaliDateTime nt = _selectedDate.toNepaliDateTime();
                _nepaliDate = nt.toString().toString().substring(0, 10);
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text("Nepali Date"),
                    content: Text(
                      "The converted date for ${_selectedDate.toString().substring(0, 10)} is $_nepaliDate.",
                      textAlign: TextAlign.center,
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          child: const Text("Okay"),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF3700B3),
                      Color(0xFF03DAC6),
                    ],
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Convert",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
