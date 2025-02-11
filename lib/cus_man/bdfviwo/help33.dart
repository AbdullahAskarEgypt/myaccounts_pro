/* 
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Directionality(
              textDirection:
                  TextDirection.rtl, // اجعل الاتجاه من اليمين إلى اليسار
              child: Dialog(
                backgroundColor: const Color(0xFFEEEBEB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    // color: ,
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // العنوان
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          decoration: const BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                            ),
                          ),
                          child: const Text(
                            'تعديل العملية',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        const SizedBox(height: 10.0),
                        Container(
                          width: double.infinity,
                          height: 3,
                          color: Colors.cyan,
                        ),

                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              // حقل تعديل المبلغ
                              TextField(
                                controller: amountController,
                                keyboardType: TextInputType.number,
                                textDirection: TextDirection.rtl,
                                decoration: const InputDecoration(
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800),
                                  labelText: 'المبلغ',
                                  // border: OutlineInputBorder(),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.cyan),
                                    // البوردر الافتراضي
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.cyan, width: 2.0),
                                    // البوردر عند عدم التركيز
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.cyan,
                                        width: 2.0), // البوردر عند التركيز
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 6,
                                  ),
                                ),
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),

                              const SizedBox(height: 20.0),

                              // حقل تعديل التفاصيل
                              TextField(
                                controller: detailsController,
                                textDirection: TextDirection.rtl,
                                decoration: const InputDecoration(
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800),
                                  labelText: 'التفاصيل',
                                  // border: OutlineInputBorder(),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.cyan),
                                    // البوردر الافتراضي
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.cyan, width: 2.0),
                                    // البوردر عند عدم التركيز
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.cyan,
                                        width: 2.0), // البوردر عند التركيز
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 4,
                                  ),
                                ),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              const SizedBox(height: 10.0),
                            ],
                          ),
                        ),

                        // الحد العلوي بعرض 3 بكسل
                        Container(
                          width: double.infinity,
                          height: 3,
                          color: Colors.cyan,
                        ),

                        const SizedBox(height: 10.0),

                        // اختيار نوع العملية

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              // padding: const EdgeInsets.all(8.0),
                              padding:
                                  const EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: const Color(0xFFFF665B), width: 2.0),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  const Text(
                                    'إضافة',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Radio<String>(
                                    value: 'إضافة',
                                    focusColor: Colors.red,
                                    hoverColor: Colors.red,
                                    activeColor: Colors.red,
                                    // fillColor: Colors.red,
                                    groupValue: selectedType,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedType = value!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: const Color(0xFF70FF75), width: 2.0),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  const Text(
                                    'تسديد',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Radio<String>(
                                    value: 'تسديد',
                                    focusColor: Colors.green,
                                    hoverColor: Colors.green,
                                    activeColor: Colors.green,
                                    groupValue: selectedType,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedType = value!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                    
                    
                    
                    
                    
                    
                    
                        // الحد العلوي بعرض 3 بكسل
                        Container(
                          width: double.infinity,
                          height: 3,
                          color: Colors.cyan,
                        ),
                        const SizedBox(height: 10.0),

                        // أزرار الحفظ والإلغاء
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                // التحقق من صحة المدخلات
                                if (amountController.text.isEmpty ||
                                    detailsController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('يرجى تعبئة جميع الحقول'),
                                      backgroundColor: Colors.red,
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                  return;
                                }

                                try {
                                  final databaseHelper = DatabaseHelper();
                                  int rowsAffected =
                                      await databaseHelper.updateOperation(
                                    transaction['id'],
                                    transaction['name'], // نفس الاسم
                                    double.parse(amountController.text),
                                    detailsController.text,
                                    selectedType,
                                  );

                                  if (rowsAffected > 0) {
                                    // ignore: use_build_context_synchronously
                                    Navigator.of(context)
                                        .pop(); // إغلاق النافذة
                                    _refreshTransactions(); // تحديث البيانات
                                    // ignore: use_build_context_synchronously
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('تم تعديل العملية بنجاح'),
                                        backgroundColor: Colors.green,
                                        duration: Duration(seconds: 3),
                                      ),
                                    );
                                  } else {
                                    // ignore: use_build_context_synchronously
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('فشل في تعديل العملية'),
                                        backgroundColor: Colors.red,
                                        duration: Duration(seconds: 3),
                                      ),
                                    );
                                  }
                                } catch (error) {
                                  Navigator.of(context).pop(); // إغلاق النافذة
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('حدث خطأ أثناء تعديل العملية'),
                                      backgroundColor: Colors.red,
                                      duration: Duration(seconds: 3),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                // ignore: deprecated_member_use
                                primary: Colors.cyan,
                                // ignore: deprecated_member_use
                                onPrimary: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                elevation: 4,
                              ),
                              child: const Text('حفظ'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                // ignore: deprecated_member_use
                                primary: Colors.cyan,
                                // ignore: deprecated_member_use
                                onPrimary: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                elevation: 4,
                              ),
                              child: const Text('إلغاء'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                  
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  */