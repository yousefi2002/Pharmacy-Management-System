import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fargard_pharmacy_management_system/models/doctors.dart';
import 'package:fargard_pharmacy_management_system/providers/crud_for_doctor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../models/visits.dart';
import '../../providers/crud_for_patients.dart';
class VisitPage extends StatefulWidget {
  final Visits visits;
  const VisitPage(this.visits,{super.key});

  @override
  State<VisitPage> createState() => _VisitPageState(this.visits);
}

class _VisitPageState extends State<VisitPage> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode focs1 = FocusNode();
  final FocusNode focs2 = FocusNode();
  final FocusNode focs3 = FocusNode();
  final FocusNode focs4 = FocusNode();
  final FocusNode focs5 = FocusNode();
  final FocusNode focs6 = FocusNode();
  final FocusNode focs7 = FocusNode();
  final List<String> gender=["Male","Female"];
  String? selecteDoctor;
  String? selecteGender;
  String? doctorname1;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController doctornameController = TextEditingController();
  final TextEditingController patientnameController = TextEditingController();
  final TextEditingController patientageController = TextEditingController();
  final TextEditingController patientgenderController = TextEditingController();
  final TextEditingController patientcontectController = TextEditingController();
  final TextEditingController feescontroller = TextEditingController();
  final TextEditingController usercontroller = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  Visits visits;
  _VisitPageState(this.visits,);
  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    patientnameController.text = visits.patientName ?? '';
    patientcontectController.text = visits.contactNumber ?? '';
    selecteDoctor = visits.doctorName ?? "";
    selecteGender = visits.gender ?? "";
    patientageController.text = visits.age ?? "";
    feescontroller.text = visits.fees ?? "";
    _dateController.text = (visits.date.isNotEmpty)
        ? visits.date
        : "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    _timeController.text = (visits.time.isNotEmpty)
        ? visits.time
        : "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
  }
  void savevisit()async{
    if (_formKey.currentState!.validate()) {
      if (visits.id != null) {
        final updatedPatient = Visits(
            visits.id,
            patientnameController.text,
            selecteDoctor,
            selecteGender,
            patientageController.text,
            feescontroller.text,
            _dateController.text,
            _timeController.text,
            patientcontectController.text);
        await Provider.of<VisitProvider>(context, listen: false)
            .updateVisits(updatedPatient);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Patient updated successfully!')),
        );
      } else {
        final addPatient = Visits(
            visits.id,
            patientnameController.text,
            selecteDoctor,
            selecteGender,
            patientageController.text,
            feescontroller.text,
            _dateController.text,
            _timeController.text,
            patientcontectController.text);
        await Provider.of<VisitProvider>(context, listen: false)
            .addPatient(addPatient);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Patient added successfully!')),
        );
      }
      _formKey.currentState!.reset();
      patientcontectController.clear();
      patientageController.clear();
      patientnameController.clear();
      _timeController.clear();
      _dateController.clear();
      feescontroller.clear();
      doctornameController.clear();
      patientgenderController.clear();
      Navigator.pop(context);
    }
  }
  void goBack() {
    Navigator.pop(context);
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
  }


  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.control,LogicalKeyboardKey.keyS):ActivateIntent(),
        LogicalKeySet(LogicalKeyboardKey.escape): GoBackIntent(),
      },
      child: Actions(
        actions:{
          ActivateIntent:CallbackAction<ActivateIntent>(onInvoke: (intent)=>savevisit()),
          GoBackIntent: CallbackAction<GoBackIntent>(onInvoke: (intent) => goBack()),
        },
        child: Scaffold(
          appBar: AppBar(title: Text(AppLocalizations.of(context)!.newVisit, style: const TextStyle(fontSize: 30),),),
          body:Consumer<DoctorProvider>(
            builder: (context,doctor,child) {
              final doctorname=doctor.doctor;
              return SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: CupertinoColors.activeGreen),
                          color: Colors.white
                      ),
                      width: 800,
                      height: 600,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(100, 40, 100, 10),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(child: Text(
                                AppLocalizations.of(context)!.newVisit,
                                style: TextStyle(fontSize: 35),)),
                              SizedBox(
                                child: DropdownButton2(
                                  onMenuStateChange: (value) {
                                    FocusScope.of(context).requestFocus(focs1);
                                  },
                                  isExpanded: true,
                                  hint: Row(
                                    children: [
                                      Icon(Icons.list, size: 16,
                                          color: Colors.green),
                                      SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          "Select Gender",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  items: gender.toSet().toList().map((
                                      String gender) {
                                    return DropdownMenuItem<String>(
                                      value: gender,
                                      child: Text(
                                        gender,
                                        style: TextStyle(fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.lightGreen),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    );
                                  }).toList(),
                                  value: gender.contains(selecteGender)
                                      ? selecteGender
                                      : null,
                                  onChanged: (String? value) {
                                    setState(() {
                                      selecteGender = value;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                child: DropdownButton2<Doctor>(
                                  onMenuStateChange: (value) {
                                    FocusScope.of(context).requestFocus(focs2);
                                  },
                                  isExpanded: true,
                                  items: doctorname
                                      .map(
                                        (genericNameGen) =>
                                        DropdownMenuItem<Doctor>(
                                          value: genericNameGen,
                                          child: Text(
                                            genericNameGen.name,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.lightGreen,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                  )
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      doctorname1 = value?.name ?? '';
                                    });
                                  },
                                  hint: Row(
                                    children: [
                                      const Icon(
                                        Icons.list,
                                        size: 16,
                                        color: Colors.green,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          doctorname1 ?? 'Select Doctor',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green),
                                          overflow: TextOverflow.ellipsis,
                                        ),),
                                    ],
                                  ),
                                ),
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the Patient\'s name';
                                  }
                                  return null;
                                },
                                controller: patientnameController,
                                focusNode: focs2,
                                onFieldSubmitted: (value) {
                                  FocusScope.of(context).requestFocus(focs3);
                                },
                                decoration: InputDecoration(
                                  labelText: AppLocalizations.of(context)!
                                      .patient_name,
                                  labelStyle: const TextStyle(
                                    color: Colors.green, // Label text color
                                    fontSize: 16,
                                  ),
                                  hintText: 'Full Name like Ahmad Ahmadi',
                                  hintStyle: const TextStyle(
                                      color: Colors.grey),
                                  // Hint text color
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    // Rounded border
                                    borderSide: const BorderSide(
                                      color: Colors.greenAccent,
                                      // Border color when not focused
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    // Rounded border
                                    borderSide: const BorderSide(
                                      color: Colors.green,
                                      // Border color when focused
                                      width: 2,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      // Border color on error
                                      width: 2,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: Colors.redAccent,
                                      // Border color on focused error
                                      width: 2,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 12.0,
                                  ),
                                  // Inner padding
                                  filled: true,
                                  fillColor: Colors.green
                                      .shade50, // Background color
                                ),
                                style: const TextStyle(
                                  color: Colors.black, // Input text color
                                  fontSize: 18,
                                ),
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the Patient\'s Age';
                                  }
                                  return null;
                                },
                                focusNode: focs3,
                                controller: patientageController,
                                onFieldSubmitted: (value) {
                                  FocusScope.of(context).requestFocus(focs4);
                                },
                                decoration: InputDecoration(
                                  labelText: AppLocalizations.of(context)!.age,
                                  labelStyle: const TextStyle(
                                    color: Colors.green, // Label text color
                                    fontSize: 16,
                                  ),
                                  hintText: 'Age like 20 or 25',
                                  hintStyle: const TextStyle(
                                      color: Colors.grey),
                                  // Hint text color
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    // Rounded border
                                    borderSide: const BorderSide(
                                      color: Colors.greenAccent,
                                      // Border color when not focused
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    // Rounded border
                                    borderSide: const BorderSide(
                                      color: Colors.green,
                                      // Border color when focused
                                      width: 2,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      // Border color on error
                                      width: 2,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: Colors.redAccent,
                                      // Border color on focused error
                                      width: 2,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 12.0,
                                  ),
                                  // Inner padding
                                  filled: true,
                                  fillColor: Colors.green
                                      .shade50, // Background color
                                ),
                                style: const TextStyle(
                                  color: Colors.black, // Input text color
                                  fontSize: 18,
                                ),
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the Doctors\'s Fees';
                                  }
                                  return null;
                                },
                                focusNode: focs4,
                                controller: feescontroller,
                                onFieldSubmitted: (value) {
                                  FocusScope.of(context).requestFocus(focs5);
                                },
                                decoration: InputDecoration(
                                  labelText: AppLocalizations.of(context)!
                                      .fee_amount,
                                  labelStyle: const TextStyle(
                                    color: Colors.green, // Label text color
                                    fontSize: 16,
                                  ),
                                  hintStyle: const TextStyle(
                                      color: Colors.grey),
                                  // Hint text color
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    // Rounded border
                                    borderSide: const BorderSide(
                                      color: Colors.greenAccent,
                                      // Border color when not focused
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    // Rounded border
                                    borderSide: const BorderSide(
                                      color: Colors.green,
                                      // Border color when focused
                                      width: 2,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      // Border color on error
                                      width: 2,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: Colors.redAccent,
                                      // Border color on focused error
                                      width: 2,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 12.0,
                                  ),
                                  // Inner padding
                                  filled: true,
                                  fillColor: Colors.green
                                      .shade50, // Background color
                                ),
                                style: const TextStyle(
                                  color: Colors.black, // Input text color
                                  fontSize: 18,
                                ),
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the Patient\'s Phone';
                                  }
                                  return null;
                                },
                                focusNode: focs5,
                                onFieldSubmitted: (value) {
                                  FocusScope.of(context).requestFocus(focs6);
                                  savevisit();
                                },
                                controller: patientcontectController,
                                decoration: InputDecoration(
                                  labelText: AppLocalizations.of(context)!
                                      .contact_number,
                                  labelStyle: const TextStyle(
                                    color: Colors.green, // Label text color
                                    fontSize: 16,
                                  ),
                                  hintText: 'Phone Number 079839284939',
                                  hintStyle: const TextStyle(
                                      color: Colors.grey),
                                  // Hint text color
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    // Rounded border
                                    borderSide: const BorderSide(
                                      color: Colors.greenAccent,
                                      // Border color when not focused
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    // Rounded border
                                    borderSide: const BorderSide(
                                      color: Colors.green,
                                      // Border color when focused
                                      width: 2,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      // Border color on error
                                      width: 2,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: Colors.redAccent,
                                      // Border color on focused error
                                      width: 2,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 12.0,
                                  ),
                                  // Inner padding
                                  filled: true,
                                  fillColor: Colors.green
                                      .shade50, // Background color
                                ),
                                style: const TextStyle(
                                  color: Colors.black, // Input text color
                                  fontSize: 18,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
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
                                        labelText: AppLocalizations.of(context)!
                                            .time,
                                        labelStyle: const TextStyle(
                                          color: Colors.green,
                                          // Label text color
                                          fontSize: 16,
                                        ),
                                        hintText: '',
                                        hintStyle: const TextStyle(
                                            color: Colors.grey),
                                        // Hint text color
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              5), // Rounded border
                                          borderSide: const BorderSide(
                                            color: Colors.greenAccent,
                                            // Border color when not focused
                                            width: 1,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              5), // Rounded border
                                          borderSide: const BorderSide(
                                            color: Colors.green,
                                            // Border color when focused
                                            width: 2,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              5),
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            // Border color on error
                                            width: 2,
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              12),
                                          borderSide: const BorderSide(
                                            color: Colors.redAccent,
                                            // Border color on focused error
                                            width: 2,
                                          ),
                                        ),
                                        contentPadding: const EdgeInsets
                                            .symmetric(
                                          horizontal: 16.0,
                                          vertical: 12.0,
                                        ),
                                        // Inner padding
                                        filled: true,
                                        fillColor: Colors.green
                                            .shade50, // Background color
                                      ),
                                      style: const TextStyle(
                                        color: Colors.black, // Input text color
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20,),
                                  Expanded(
                                    child: TextFormField(
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
                                        labelText: AppLocalizations.of(context)!
                                            .date,
                                        labelStyle: const TextStyle(
                                          color: Colors.green,
                                          // Label text color
                                          fontSize: 16,
                                        ),
                                        hintText: '',
                                        hintStyle: const TextStyle(
                                            color: Colors.grey),
                                        // Hint text color
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              5), // Rounded border
                                          borderSide: const BorderSide(
                                            color: Colors.greenAccent,
                                            // Border color when not focused
                                            width: 1,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              5), // Rounded border
                                          borderSide: const BorderSide(
                                            color: Colors.green,
                                            // Border color when focused
                                            width: 2,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              5),
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            // Border color on error
                                            width: 2,
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              12),
                                          borderSide: const BorderSide(
                                            color: Colors.redAccent,
                                            // Border color on focused error
                                            width: 2,
                                          ),
                                        ),
                                        contentPadding: const EdgeInsets
                                            .symmetric(
                                          horizontal: 16.0,
                                          vertical: 12.0,
                                        ),
                                        // Inner padding
                                        filled: true,
                                        fillColor: Colors.green
                                            .shade50, // Background color
                                      ),
                                      style: const TextStyle(
                                        color: Colors.black, // Input text color
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: savevisit,
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.lightGreen),
                                    child: Text(
                                        AppLocalizations.of(context)!.save,
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
          ) ,
        ),
      ),
    );
  }
}


class GoBackIntent extends Intent {}
class ActivateIntent extends Intent {}
