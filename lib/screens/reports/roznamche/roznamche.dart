import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
class Roznamche extends StatefulWidget {
  const Roznamche({super.key});

  @override
  State<Roznamche> createState() => _RoznamcheState();
}

class _RoznamcheState extends State<Roznamche> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime now = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(AppLocalizations.of(context)!.journal, style: const TextStyle(fontSize: 30),),
            const Expanded(child: SizedBox()),
            // Text Search Bar
            Expanded(
              child: TextFormField(
                controller: _startDateController,
                readOnly: true,
                onTap:()=> _selectDate(context,_startDateController),
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.start_date,
                  labelStyle: const TextStyle(
                    color: Colors.green, // Label text color
                    fontSize: 16,
                  ),
                  hintText: '',
                  hintStyle: const TextStyle(color: Colors.grey), // Hint text color
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5), // Rounded border
                    borderSide: const BorderSide(
                      color: Colors.greenAccent, // Border color when not focused
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5), // Rounded border
                    borderSide: const BorderSide(
                      color: Colors.green, // Border color when focused
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.red, // Border color on error
                      width: 2,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.redAccent, // Border color on focused error
                      width: 2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ), // Inner padding
                  filled: true,
                  fillColor: Colors.green.shade50, // Background color
                ),
                style: const TextStyle(
                  color: Colors.black, // Input text color
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                controller: _endDateController,
                readOnly: true,
                onTap:()=> _selectDate(context,_endDateController),
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.end_date,
                  labelStyle: const TextStyle(
                    color: Colors.green, // Label text color
                    fontSize: 16,
                  ),
                  hintText: '',
                  hintStyle: const TextStyle(color: Colors.grey), // Hint text color
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5), // Rounded border
                    borderSide: const BorderSide(
                      color: Colors.greenAccent, // Border color when not focused
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5), // Rounded border
                    borderSide: const BorderSide(
                      color: Colors.green, // Border color when focused
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.red, // Border color on error
                      width: 2,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.redAccent, // Border color on focused error
                      width: 2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ), // Inner padding
                  filled: true,
                  fillColor: Colors.green.shade50, // Background color
                ),
                style: const TextStyle(
                  color: Colors.black, // Input text color
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.search,
                  hintStyle: const TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white30, // Semi-transparent background
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body:  Container(
        child: Column(
          children: [
            Card(
              shape: OutlineInputBorder(
                borderSide: BorderSide(color: CupertinoColors.white),
              ),
              color: Colors.green.shade300,
              child: ListTile(
                trailing: Icon(Icons.eco_outlined),
                leading: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "#",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("         تاریخ"),
                    Text("روز"),
                    Text("عاید"),
                    Text("مصارف"),
                    Text("باقی"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Card(
                    shadowColor: CupertinoColors.white,
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    color: Colors.grey.shade300,
                    child: ListTile(
                      trailing: Icon(Icons.eco, color: Colors.green,),
                      leading: Text("${index + 1}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("1403/12/4"),
                          Text("شنبه"),
                          Text("15000"),
                          Text("4000"),
                          Text("11000"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
