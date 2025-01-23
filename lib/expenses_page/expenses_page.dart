import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../modal_classes/expenses.dart';
import 'crud_for_expenses.dart';
class ExpensesPage extends StatefulWidget {
  final Expenses expenses;
  const ExpensesPage(this.expenses, {super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState(this.expenses);
}

class _ExpensesPageState extends State<ExpensesPage> {
  final FocusNode focs1 = FocusNode();
  final FocusNode focs2 = FocusNode();
  final FocusNode focs3 = FocusNode();
  final FocusNode focs4 = FocusNode();
  final List<String> name=["Admin","Pharmacist","Pharmacist Assistant"];
  String? selectvalue;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  Expenses expenses;
  _ExpensesPageState( this.expenses);

  @override
  void initState() {
    super.initState();

    // تنظیم تاریخ و زمان پیش‌فرض
    DateTime now = DateTime.now();
    _dateController.text = DateFormat('yyyy-MM-dd').format(now); // قالب تاریخ
    _timeController.text = DateFormat('HH:mm:ss').format(now); // قالب زمان
  }

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
    _descriptionController.text = expenses.description;
    _amountController.text = expenses.amount.toString();
    _dateController.text = expenses.date;
    _userIdController.text = expenses.userId;
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _amountController.dispose();
    _dateController.dispose();
    _userIdController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.white)
              ),
              width: 600,
              height:600,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(100, 40, 100, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(child: Text(AppLocalizations.of(context)!.record_expenses,style: TextStyle(fontSize: 35),)),
                    TextFormField(
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(focs1);
                      },
                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.amount,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4))
                      ),
                    ),
                    TextFormField(
                      focusNode: focs1,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(focs2);
                      },
                      decoration: InputDecoration(
                          labelText:AppLocalizations.of(context)!.description ,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                    controller: _dateController,
                      readOnly: true,
                      onTap: _selectDate,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.date,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                      ),
                    ),
          ),
                        const SizedBox(width: 20,),
                        Expanded(
                          child: TextFormField(
                            controller: _timeController,
                            readOnly: true,
                            onTap: _selectTime,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!.time,
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Row(
                          children: [
                            Icon(Icons.list,size: 16,color: Colors.lightGreenAccent,),
                            SizedBox(width: 4,),
                            Expanded(child: Text("Select Item",style:
                            TextStyle(fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightGreenAccent),
                              overflow: TextOverflow.ellipsis,))
                          ],
                        ),
                        items: name.map((String names)=>DropdownMenuItem<String>(
                          value: names,
                          child: Text(
                            names,style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightGreenAccent,
                          ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        ).toList(),
                        value: selectvalue,
                        onChanged:(String? value){
                          setState(() {
                            selectvalue=value;
                          });
                        },

                      ),
                    ),
                    Row(
                      children: [
                        ElevatedButton(onPressed:(){},style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreenAccent
                        ), child:Text(AppLocalizations.of(context)!.save,style: TextStyle(color: Colors.black),),),
                      ],
                    ),
                  ],
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(child: Text(AppLocalizations.of(context)!.record_expenses,style: TextStyle(fontSize: 35),)),
                      TextFormField(
                        controller: _descriptionController,
                        decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.description,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4))
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the patient\'s name';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _amountController,
                        decoration: InputDecoration(
                            labelText:AppLocalizations.of(context)!.amount ,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the patient\'s name';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                       controller: _dateController,
                        decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.date,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the patient\'s name';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _userIdController,
                        decoration: InputDecoration(
                            labelText: 'user ID',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the patient\'s name';
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                        onPressed: () async{
                          if (_formKey.currentState!.validate()) {

                            if (expenses.id != null) {
                              final updatedExpense = Expenses(
                                 expenses.id,
                                 _descriptionController.text,
                                 double.tryParse(_amountController.text),
                                 _dateController.text,
                                 _userIdController.text,
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
                                _userIdController.text,
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
                            _userIdController.clear();
                            Navigator.pop(context);
                          }
                        },
                        style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellowAccent
                      ), child:Text(AppLocalizations.of(context)!.save),),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ) ,
    );
  }
}
