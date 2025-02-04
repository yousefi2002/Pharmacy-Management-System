import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../models/expenses.dart';
import '../../providers/crud_for_expenses.dart';
import 'package:flutter/services.dart';
class ExpensesPage extends StatefulWidget {
  final Expenses expenses;
  const ExpensesPage(this.expenses, {super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState(this.expenses);
}

class _ExpensesPageState extends State<ExpensesPage> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode focs1 = FocusNode();
  final FocusNode focs2 = FocusNode();
  final FocusNode focs3 = FocusNode();
  final FocusNode focs4 = FocusNode();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _byController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate() async {
    DateTime now = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }
  Future<void> _selectTime() async {
    TimeOfDay now = TimeOfDay.now();
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: now,
    );

    if (pickedTime != null) {
      setState(() {
        _timeController.text =
        '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}:00';
      });
    }
  }

  void goBack() {
    Navigator.pop(context);
  }
  void saveexpenses()async{
    if (_formKey.currentState!.validate()) {
      if (expenses.id != null) {
        final updatedExpense = Expenses(
          expenses.id,
          _descriptionController.text,
          double.tryParse(_amountController.text),
          _dateController.text,
          _timeController.text,
          _byController.text,
        );
        await Provider.of<ExpensesProvider>(context, listen: false)
            .updateExpense(updatedExpense);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Expense updated successfully!')),
        );
      } else {
        final addExpenses = Expenses(
          expenses.id,
          _descriptionController.text,
          double.tryParse(_amountController.text),
          _dateController.text,
          _timeController.text,
          _byController.text,
        );
        print(addExpenses);
        await Provider.of<ExpensesProvider>(context, listen: false)
            .addExpenses(addExpenses);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Expenses added successfully!')),
        );
      }

      _formKey.currentState!.reset();
      _descriptionController.clear();
      _amountController.clear();
      _dateController.clear();
      _timeController.clear();
      _byController.clear();
      Navigator.pop(context);
    }
  }

  Expenses expenses;
  _ExpensesPageState( this.expenses);
  @override
  void dispose() {
    _descriptionController.dispose();
    _amountController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _byController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    _descriptionController.text = expenses.description;
    _amountController.text = expenses.amount.toString();
    _dateController.text = (expenses.date.isNotEmpty) ? expenses.date : "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    _timeController.text = (expenses.time.isNotEmpty) ? expenses.time : "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
    _byController.text = expenses.userId;
  }


  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts:{
        LogicalKeySet(LogicalKeyboardKey.control,LogicalKeyboardKey.keyS):ActivateIntent(),
        LogicalKeySet(LogicalKeyboardKey.escape):GoBackIntent(),
      },
      child: Actions(
        actions: {
          ActivateIntent:(CallbackAction<ActivateIntent>(onInvoke: (intent)=>saveexpenses())),
          GoBackIntent:(CallbackAction<GoBackIntent>(onInvoke: (intent)=>goBack())),
        },
        child: Scaffold(
          appBar: AppBar(
            title:   Text(AppLocalizations.of(context)!.newexpense,style: TextStyle(fontSize: 35),)),
          body:SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: CupertinoColors.activeGreen),
                      color: Colors.white
                  ),
                  width: 800,
                  height:600,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(100, 40, 100, 10),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(child: Text(AppLocalizations.of(context)!.newexpense,style: TextStyle(fontSize: 35),)),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter how expenses';
                              }
                              return null;
                            },
                            controller: _byController,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(focs1);
                            },
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!.by,
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
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the Amount';
                              }
                              return null;
                            },
                            controller: _amountController,
                            focusNode: focs1,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(focs2);
                            },
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!.amount,
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
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the Expenses\'s Description';
                              }
                              return null;
                            },
                            controller: _descriptionController,
                            focusNode: focs2,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(focs3);
                              saveexpenses();
                            },
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!.description,
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
                          Row(
                            children: [
                              Expanded(
                                child:      TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter the Time';
                                    }
                                    return null;
                                  },
                                  controller: _timeController,
                                  onTap: _selectTime,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    labelText: AppLocalizations.of(context)!.time,
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
                              const SizedBox(width: 20,),
                              Expanded(
                                child:      TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter the Date';
                                    }
                                    return null;
                                  },
                                  controller: _dateController,
                                  readOnly: true,
                                  onTap: _selectDate,
                                  decoration: InputDecoration(
                                    labelText: AppLocalizations.of(context)!.date,
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
                            ],
                          ),
                          ElevatedButton(
                            onPressed:saveexpenses,
                            style:ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
                            child:Text(AppLocalizations.of(context)!.save, style: TextStyle(color: Colors.white))
                          ) ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ) ,
        ),
      ),
    );
  }
}


class GoBackIntent extends Intent {}
class ActivateIntent extends Intent {}
