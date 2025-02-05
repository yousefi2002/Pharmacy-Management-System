import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../database/database_helper.dart';

class BackupPage extends StatefulWidget {
  const BackupPage({super.key});

  @override
  State<BackupPage> createState() => _BackupPageState();
}

class _BackupPageState extends State<BackupPage> {
  final DatabaseHelper dbHelper = DatabaseHelper();

  Future<void> backupDatabase() async {
    try {
      String dbPath = await dbHelper.getDatabasePath();
      File dbFile = File(dbPath);

      if (!await dbFile.exists()) {
        print('❌ Database does not exist.');
        return;
      }

      // Let user pick a folder to save the backup
      String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
      if (selectedDirectory == null) {
        print('❌ No folder selected.');
        return;
      }

      // Generate a backup filename
      String backupFileName = 'backup_${DateTime.now().millisecondsSinceEpoch}.db';
      String backupPath = '$selectedDirectory/$backupFileName';

      // Copy the database to the selected folder
      await dbFile.copy(backupPath);

      print('✅ Database backed up successfully to: $backupPath');
    } catch (e) {
      print('❌ Error during backup: $e');
    }
  }

  // 🔹 Restore Database (Choose File & Restore)
  Future<void> restoreDatabase() async {
    try {
      // Close the database before restoring
      await dbHelper.closeDatabase();

      // Let user pick a .db file
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['db'],
      );

      if (result == null) {
        print('❌ No file selected.');
        return;
      }

      String selectedBackupPath = result.files.single.path!;
      File backupFile = File(selectedBackupPath);
      String restorePath = await dbHelper.getDatabasePath();
      File restoreFile = File(restorePath);

      // Check if store.db already exists
      if (await restoreFile.exists()) {
        String newName = 'store_${DateTime.now().millisecondsSinceEpoch}.db';
        String newPath = '${restoreFile.parent.path}/$newName';

        // Rename the existing database file
        await restoreFile.rename(newPath);
        print('⚠️ Existing database renamed to: $newName');
      }

      // Copy the backup file to restore it
      await backupFile.copy(restorePath);

      print('✅ Database restored successfully from: $selectedBackupPath');
    } catch (e) {
      print('❌ Error restoring database: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text(AppLocalizations.of(context)!.backup, style: const TextStyle(fontSize: 30),),
            Row(
              children: [IconButton(
                  onPressed:(){
                backupDatabase();
              }, icon: Icon(Icons.backup,size:50,)),
                const SizedBox(width: 15,),
                IconButton(
                    onPressed:(){
                      restoreDatabase();
                    }, icon: Icon(Icons.restore,size:50,)),],
            ),
          ],
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("",style: TextStyle(fontSize: 20),),
            ),
          ],
        ),
      )
    );
  }
}