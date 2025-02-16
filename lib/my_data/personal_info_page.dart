import 'package:flutter/material.dart';
// import 'database_helper.dart'; // تأكد من استيراد ملف قاعدة البيانات
import '../database/database_helper.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({Key? key}) : super(key: key);

  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  // متغيرات لحفظ القيم
  String name = '';
  String serviceType = '';
  String address = '';
  String phoneNumber = '';

  // حالة التعديل
  bool isEditing = false;

  // FocusNode للتركيز على حقل الاسم
  final FocusNode nameFocusNode = FocusNode();

  // Controllers للحقول
  final TextEditingController nameController = TextEditingController();
  final TextEditingController serviceTypeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSavedData(); // تحميل البيانات المحفوظة عند فتح الصفحة
  }

  // دالة لتحميل البيانات المحفوظة
  Future<void> _loadSavedData() async {
    final info = await _dbHelper.getPersonalInfo();
    if (info != null) {
      setState(() {
        name = info['name'] ?? '';
        serviceType = info['serviceType'] ?? '';
        address = info['address'] ?? '';
        phoneNumber = info['phoneNumber'] ?? '';

        nameController.text = name;
        serviceTypeController.text = serviceType;
        addressController.text = address;
        phoneNumberController.text = phoneNumber;
      });
    }
  }

  // دالة لحفظ البيانات
  Future<void> _saveData() async {
    final info = {
      'name': nameController.text,
      'serviceType': serviceTypeController.text,
      'address': addressController.text,
      'phoneNumber': phoneNumberController.text,
    };

    await _dbHelper.insertOrUpdatePersonalInfo(info);

    setState(() {
      isEditing = false; // إخفاء زر الحفظ وإظهار زر التعديل
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('البيانات الشخصية'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        // لجعل الشاشة مرنة عند ظهور لوحة المفاتيح
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.account_circle, size: 30, color: Colors.white),
            // حقل الاسم
            Row(
              children: [
                const Text(
                  'الاسم:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8), // مسافة بين الـ Label والحقل
                Expanded(
                  child: TextFormField(
                    controller: nameController,
                    focusNode: nameFocusNode,
                    enabled: isEditing,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12), // تقليل الـ Padding
                      border: OutlineInputBorder(),
                      hintText: 'أدخل الاسم',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // حقل رقم الهاتف
            Row(
              children: [
                const Text(
                  'رقم الهاتف  :  ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: TextFormField(
                    controller: phoneNumberController,
                    enabled: isEditing,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      border: OutlineInputBorder(),
                      hintText: 'أدخل رقم الهاتف',
                    ),
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),

            // حقل نوع الخدمة
            Row(
              children: [
                const Text(
                  'نوع الخدمة:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: serviceTypeController,
                    enabled: isEditing,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      border: OutlineInputBorder(),
                      hintText: 'أدخل نوع الخدمة',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 36),

            // حقل العنوان
            Row(
              children: [
                const Text(
                  'العنوان:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: addressController,
                    enabled: isEditing,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      border: OutlineInputBorder(),
                      hintText: 'أدخل العنوان',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 36),

            const SizedBox(height: 24),

            // زر التعديل أو الحفظ
            if (!isEditing)
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isEditing = true; // تفعيل التعديل
                      nameFocusNode.requestFocus(); // التركيز على حقل الاسم
                    });
                  },
                  child: const Text('تعديل'),
                ),
              ),
            if (isEditing)
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _saveData(); // حفظ البيانات
                  },
                  child: const Text('حفظ'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}






/* import 'package:flutter/material.dart';
// import 'database_helper.dart'; // استيراد ملف قاعدة البيانات
import '../database/database_helper.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({Key? key}) : super(key: key);

  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  // متغيرات لحفظ القيم
  String name = '';
  String serviceType = '';
  String address = '';
  String phoneNumber = '';

  // حالة التعديل
  bool isEditing = false;

  // FocusNode للتركيز على حقل الاسم
  final FocusNode nameFocusNode = FocusNode();

  // Controllers للحقول
  final TextEditingController nameController = TextEditingController();
  final TextEditingController serviceTypeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSavedData(); // تحميل البيانات المحفوظة عند فتح الصفحة
  }

  // دالة لتحميل البيانات المحفوظة
  Future<void> _loadSavedData() async {
    final info = await _dbHelper.getPersonalInfo();
    if (info != null) {
      setState(() {
        name = info['name'] ?? 'اسم';
        serviceType = info['serviceType'] ?? '';
        address = info['address'] ?? '';
        phoneNumber = info['phoneNumber'] ?? '';

        nameController.text = name;
        serviceTypeController.text = serviceType;
        addressController.text = address;
        phoneNumberController.text = phoneNumber;
      });
    }
  }

  // دالة لحفظ البيانات
  Future<void> _saveData() async {
    final info = {
      'name': nameController.text,
      'serviceType': serviceTypeController.text,
      'address': addressController.text,
      'phoneNumber': phoneNumberController.text,
    };

    await _dbHelper.insertOrUpdatePersonalInfo(info);

    setState(() {
      isEditing = false; // إخفاء زر الحفظ وإظهار زر التعديل
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('البيانات الشخصية'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // حقل الاسم
            // Container(
            //   margin: EdgeInsets.all(3),
            //   child: Row(
            //     children: [
            const Text(
              'الاسم',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            // const SizedBox(height: 8),
            TextFormField(
              controller: nameController,
              focusNode: nameFocusNode,
              enabled: isEditing,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'أدخل الاسم',
              ),
            ),
            // const SizedBox(height: 16),
            //     ],
            //   ),
            // ),

            // حقل نوع الخدمة
            const Text(
              'نوع الخدمة',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: serviceTypeController,
              enabled: isEditing,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'أدخل نوع الخدمة',
              ),
            ),
            // const SizedBox(height: 16),

            // حقل العنوان
            const Text(
              'العنوان',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: addressController,
              enabled: isEditing,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'أدخل العنوان',
              ),
            ),
            // const SizedBox(height: 16),

            // حقل رقم الهاتف
            const Text(
              'رقم الهاتف',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: phoneNumberController,
              enabled: isEditing,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'أدخل رقم الهاتف',
              ),
            ),
            // const SizedBox(height: 24),

            // زر التعديل أو الحفظ
            if (!isEditing)
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isEditing = true; // تفعيل التعديل
                      nameFocusNode.requestFocus(); // التركيز على حقل الاسم
                    });
                  },
                  child: const Text('تعديل'),
                ),
              ),
            if (isEditing)
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _saveData(); // حفظ البيانات
                  },
                  child: const Text('حفظ'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
 */