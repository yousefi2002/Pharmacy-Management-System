import 'dart:convert';
import 'dart:io';
import 'package:fargard_pharmacy_management_system/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LicenseValidationScreen extends StatefulWidget {
  const LicenseValidationScreen({Key? key}) : super(key: key);

  @override
  _LicenseValidationScreenState createState() =>
      _LicenseValidationScreenState();
}

class _LicenseValidationScreenState extends State<LicenseValidationScreen> {
  final String secretKey = "my_secret_key"; // Replace with your secure key
  String? hardwareId;
  String? licenseKey;
  String? validationStatus = "No action taken yet.";
  var validationStatusColor = Colors.orange;
  bool validated = false;
  double titleFontSize = 35.0;

  @override
  void initState() {
    super.initState();
    _generateHardwareId();
  }

  Future<void> _generateHardwareId() async {
    final deviceInfo = DeviceInfoPlugin();
    final windowsInfo = await deviceInfo.windowsInfo;
    setState(() {
      hardwareId = windowsInfo.deviceId;
    });
  }

  Future<void> _saveHardwareIdToFile() async {
    if (hardwareId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Hardware ID is not available!")),
      );
      return;
    }

    final directory = await FilePicker.platform.getDirectoryPath(
        dialogTitle: "Select a folder to save Hardware ID",
        lockParentWindow: true);

    if (directory != null) {
      final filePath = '$directory/hardware_id.txt';
      final file = File(filePath);
      await file.writeAsString(hardwareId!);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Hardware ID saved to: $filePath")),
      );
    }
  }

  bool _validateLicense(String fingerprint, String storedLicense) {
    final key = utf8.encode(secretKey);
    final bytes = utf8.encode(fingerprint);
    final hmac = Hmac(sha256, key);
    final digest = hmac.convert(bytes);
    final generatedLicense = base64Encode(digest.bytes);
    return generatedLicense == storedLicense;
  }

  Future<void> _pickLicenseFile() async {
    final result = await FilePicker.platform.pickFiles(
      dialogTitle: "Select Licence File",
      type: FileType.custom,
      allowedExtensions: ['txt'], // Allow only .txt files
    );
    if (result != null) {
      final file = File(result.files.single.path!);
      final license = await file.readAsString();
      setState(() {
        licenseKey = license.trim();
        if (hardwareId != null) {
          final isValid = _validateLicense(hardwareId!, licenseKey!);
          validationStatus =
              isValid ? "License is valid! 😉" : "License is invalid! 😔";
          validationStatusColor = Colors.green;
          validated = isValid;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    if (screenSize.width < 770) {
      titleFontSize = 25;
    } else if (screenSize.width < 850) {
      titleFontSize = 30;
    } else {
      titleFontSize = 35;
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Visibility(
              visible: validated,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (b) => LoginPage()));
                },
                child: const Text("Next"),
              ),
            ),
          ),
        ],
        toolbarHeight: 100,
        title: Row(
          children: [
            Image.asset("assets/images/Fargard Logo 2025 green v1.png", width: 200, color: Colors.white,),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(AppLocalizations.of(context)!.pharmacy, style: TextStyle(fontSize: titleFontSize, color: Colors.white),),
            ),
          ],
        ),
        // title: Text(AppLocalizations.of(context)!.pharmacy, style: TextStyle(fontSize: 35),),
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "License Validation Screen",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("For using this software, you should share your hardware id displyed on the screen to owner of the Product to receive a license file"),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Step #1",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                            "Share your hardware id to the Product Owner to receive a license file"),
                        const SizedBox(height: 20),
                        Center(
                            child: Text(
                          hardwareId ?? 'Generating...',
                          style: TextStyle(fontSize: 20),
                        )),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: _saveHardwareIdToFile,
                            child: const Text("Save ID to a File"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Step #2",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                            "Select the License file you received by Product Owner"),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Validation Status: ",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "$validationStatus",
                              style: TextStyle(
                                  fontSize: 20, color: validationStatusColor),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: _pickLicenseFile,
                            child: const Text("Select License File"),
                          ),
                        ),
                      ],
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
