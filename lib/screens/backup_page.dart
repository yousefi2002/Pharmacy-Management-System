import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class BackupPage extends StatefulWidget {
  const BackupPage({Key? key}) : super(key: key);

  @override
  State<BackupPage> createState() => _BackupPageState();
}

class _BackupPageState extends State<BackupPage> {
  String databasePath = '';
  bool isBackupInProgress = false;

  @override
  void initState() {
    super.initState();
    // مسیر دیتابیس را تنظیم کنید.
    databasePath = 'store.db'; // مسیر دقیق دیتابیس را در اینجا وارد کنید.
  }

  Future<void> backupDatabase() async {
    try {
      setState(() {
        isBackupInProgress = true;
      });

      // انتخاب مسیر برای ذخیره فایل بکاپ
      String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

      if (selectedDirectory != null) {
        // کپی کردن فایل دیتابیس به مسیر انتخاب‌شده
        final File dbFile = File(databasePath);
        final String fileName = path.basename(databasePath);
        final String destinationPath = path.join(selectedDirectory, fileName);

        await dbFile.copy(destinationPath);

        // نمایش موفقیت
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('بکاپ با موفقیت در مسیر $destinationPath ذخیره شد.')),
        );
      } else {
        // اگر کاربر مسیری انتخاب نکرد
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('هیچ مسیری انتخاب نشد.')),
        );
      }
    } catch (e) {
      // نمایش خطا در صورت بروز مشکل
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('خطا در بکاپ‌گیری: $e')),
      );
    } finally {
      setState(() {
        isBackupInProgress = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(AppLocalizations.of(context)!.backup, style: const TextStyle(fontSize: 30),),
            Expanded(child: SizedBox()),
            Text("برای بک آپ گرفتن کلیک کنید"),
            Expanded(
              child:IconButton(onPressed:(){}, icon: Icon(Icons.backup,size:50,))
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("لیست بک آپ های دریافتی",style: TextStyle(fontSize: 20),),
            ),
          ],
        ),
      )
    );
  }
}