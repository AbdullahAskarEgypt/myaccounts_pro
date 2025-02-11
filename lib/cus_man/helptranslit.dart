/* import 'package:flutter/material.dart';
import 'database_helper.dart'; // تأكد من استيراد ملف قاعدة البيانات

class AddAgentOperationDialog extends StatefulWidget {
  const AddAgentOperationDialog({super.key});

  @override
  State<AddAgentOperationDialog> createState() =>
      _AddAgentOperationDialogState();
}

class _AddAgentOperationDialogState extends State<AddAgentOperationDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  String _operationType = 'قرض'; // القيمة الافتراضية

  List<String> _allNames = []; // قائمة الأسماء من قاعدة البيانات
  List<String> _filteredNames = []; // الأسماء المصفاة

  @override
  void initState() {
    super.initState();
    _loadCustomerNames(); // تحميل الأسماء عند بدء التشغيل
  }

  void _loadCustomerNames() async {
    final names = await DatabaseHelper().getAllCustomerNames();
    setState(() {
      _allNames = names;
    });
  }

  void _filterNames(String query) {
    setState(() {
      _filteredNames = _allNames.where((name) => name.contains(query)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        backgroundColor: const Color(0xFFF6F6F6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'إضافة عملية لوكيل',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'الاسم',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange, width: 2.0),
                  ),
                ),
                onChanged: (value) {
                  _filterNames(value); // تصفية الأسماء عند تغيير النص
                },
              ),
              if (_nameController.text.isNotEmpty && _filteredNames.isNotEmpty)
                Container(
                  height: 150, // ارتفاع القائمة
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListView.builder(
                    itemCount: _filteredNames.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_filteredNames[index]),
                        onTap: () {
                          setState(() {
                            _nameController.text = _filteredNames[
                                index]; // تعبئة الحقل بالاسم المحدد
                            _filteredNames = []; // إخفاء القائمة
                          });
                        },
                      );
                    },
                  ),
                ),
              const SizedBox(height: 15),
              TextField(
                controller: _amountController,
                decoration: const InputDecoration(
                  labelText: 'المبلغ',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange, width: 2.0),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _detailsController,
                decoration: const InputDecoration(
                  labelText: 'التفاصيل',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _operationType = 'قرض';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary:
                          _operationType == 'قرض' ? Colors.orange : Colors.grey,
                      onPrimary: Colors.white,
                    ),
                    child: const Text('قرض'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _operationType = 'تسديد';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: _operationType == 'تسديد'
                          ? Colors.orange
                          : Colors.grey,
                      onPrimary: Colors.white,
                    ),
                    child: const Text('تسديد'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_nameController.text.isNotEmpty &&
                      _amountController.text.isNotEmpty &&
                      _detailsController.text.isNotEmpty) {
                    // إضافة العملية هنا
                    Navigator.pop(context);
                    _showSuccessMessage('تمت إضافة العملية بنجاح');
                  } else {
                    _showErrorMessage('يرجى إدخال جميع البيانات');
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  onPrimary: Colors.white,
                ),
                child: const Text('حفظ'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}
 */





/* class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _recentTransactions = [];
  DateTime? _selectedDate;

  // جلب العمليات بناءً على التاريخ المحدد
  Future<void> _fetchTransactionsByDate(DateTime date) async {
    final transactions = await DatabaseHelper().getOperationsByDate(date);
    setState(() {
      _recentTransactions = transactions;
      _selectedDate = date;
    });
  }

  // فتح جدول اختيار التاريخ
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      await _fetchTransactionsByDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("العمليات"),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () => _selectDate(context),
          ),
        ],
      ),
      body: Column(
        children: [
          if (_selectedDate != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "العمليات لتاريخ: ${_selectedDate!.toLocal().toString().split(' ')[0]}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          Expanded(
            child: _recentTransactions.isEmpty
                ? Center(
                    child: Text(
                      "لا توجد عمليات للتاريخ المحدد",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: _recentTransactions.length,
                    itemBuilder: (context, index) {
                      final transaction = _recentTransactions[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: index % 2 == 0
                              ? const Color(0xFFF1F1F1)
                              : Colors.white,
                          border: const Border(
                            bottom: BorderSide(color: Colors.cyan, width: 2.0),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    left: BorderSide(color: Colors.cyan, width: 2.0),
                                    right: BorderSide(color: Colors.cyan, width: 2.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 2,
                                  ),
                                  child: Text(
                                    transaction['client_name'],
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontSize: 14.5,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: _buildInfoCell(transaction),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
    
        ],
      ),
    );
  }

  Widget _buildInfoCell(Map<String, dynamic> transaction) {
    // قم بتنفيذ هذه الدالة كما هي لديك
    return Container();
  }
}
 */
/* 
import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import 'add_delete.dart';
import 'search.dart';
import '../main.dart';
// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, use_build_context_synchronously, duplicate_ignore, deprecated_member_use

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final _formKey = GlobalKey<FormState>();
/*   final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _amountFocusNode = FocusNode();
  final FocusNode _detailsFocusNode = FocusNode();
  String _transactionType = '';
  List<Map<String, dynamic>> _recentTransactions = [];
  int? selectedClientId; // ID العميل المختار
  List<Map<String, dynamic>> matchingClients = []; // قائمة الأسماء المطابقة

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _detailsController.dispose();
    _nameFocusNode.dispose();
    _amountFocusNode.dispose();
    _detailsFocusNode.dispose();
    super.dispose();
  } */
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _amountFocusNode = FocusNode();
  final FocusNode _detailsFocusNode = FocusNode();
  String _transactionType = '';
  List<Map<String, dynamic>> _recentTransactions = [];
  int? selectedClientId; // ID العميل المختار
  List<Map<String, dynamic>> matchingClients = []; // قائمة الأسماء المطابقة

  @override
  void dispose() {
    // التخلص من الـControllers والـFocusNodes
    _nameController.dispose();
    _amountController.dispose();
    _detailsController.dispose();
    _nameFocusNode.dispose();
    _amountFocusNode.dispose();
    _detailsFocusNode.dispose();

    // استدعاء super.dispose() في النهاية
    super.dispose();
  }

  void _searchClients(String query) async {
    if (query.isEmpty) {
      setState(() {
        matchingClients = [];
      });
      return;
    }
    final results = await DatabaseHelper().searchClientsByName(query);
    setState(() {
      matchingClients = results;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchRecentTransactions();

    // تحريك المؤشر إلى نهاية النص عند التركيز على الحقل
    _nameFocusNode.addListener(() {
      if (_nameFocusNode.hasFocus) {
        _moveCursorToEnd(_nameController);
      }
    });

    _amountFocusNode.addListener(() {
      if (_amountFocusNode.hasFocus) {
        _moveCursorToEnd(_amountController);
      }
    });

    _detailsFocusNode.addListener(() {
      if (_detailsFocusNode.hasFocus) {
        _moveCursorToEnd(_detailsController);
      }
    });
  }

  void _moveCursorToEnd(TextEditingController controller) {
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
  }

  // جلب آخر 50 عمليات من قاعدة البيانات
  Future<void> _fetchRecentTransactions() async {
    final transactions = await DatabaseHelper().getLastTenOperationsWithNames();
    setState(() {
      _recentTransactions = transactions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFEEEBEB),
        appBar: AppBar(
          title: const Text(
            '  ادارة حسابات العملاء',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.home,
              size: 35,
              color: Color(0xFFF26157),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const MyApp(), // استبدل AddTransactionPage بالصفحة المستهدفة
                ),
              );
            },
          ),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.person,
                  size: 30,
                  color: Color.fromARGB(255, 76, 96, 245),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const AddDeletePage(), // استبدل AddTransactionPage بالصفحة المستهدفة
                    ),
                  );
                }),
            const SizedBox(width: 8),
            IconButton(
                icon: const Icon(Icons.search,
                    size: 30, color: Color.fromARGB(255, 106, 245, 111)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const SearchClientPage(), // استبدل AddTransactionPage بالصفحة المستهدفة
                    ),
                  );
                }),
            const SizedBox(width: 8),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              // عنوان الجدول
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 40),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3.0),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.cyan,
                ),
                child: const Text(
                  'العمليات الاخيرة',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8.0),

              // الجدول
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.cyan, width: 3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.cyan,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: const [
                            Expanded(
                              flex: 8, // نسبة 80%
                              child: Text(
                                'التفاصيل',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2, // نسبة 20%
                              child: Text(
                                'معلومات',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _recentTransactions.length,
                          itemBuilder: (context, index) {
                            final transaction = _recentTransactions[index];

                            return Container(
                              decoration: BoxDecoration(
                                color: index % 2 == 0
                                    ? const Color(0xFFF1F1F1)
                                    : Colors.white,
                                border: const Border(
                                  bottom: BorderSide(
                                      color: Colors.cyan, width: 2.0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 8, // نسبة 80%
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.cyan, width: 2.0),
                                          right: BorderSide(
                                              color: Colors.cyan, width: 2.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                          horizontal: 2,
                                        ),
                                        child: Text(
                                          transaction['client_name'],
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontSize: 14.5,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // عمود معلومات
                                  Expanded(
                                    flex: 2, // نسبة 20%
                                    child: _buildInfoCell(transaction),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Color(0x8300BBD4),
                  border: Border(top: BorderSide(width: 3, color: Colors.cyan)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(
                      Icons.search_sharp,
                      color: Colors.white,
                      size: 40,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.cyan,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.add,
                            size: 30, color: Colors.white),
                        onPressed: _showAddOperationDialog,
                      ),
                    ),
                    const Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
/*         floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddOperationDialog();
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.cyan,
        ),
      */
      ),
    );
  }

/* 
  void _showAddOperationDialog() {
    setState(() {
      matchingClients = []; // إعادة تعيين القائمة المقترحة
    });

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Dialog(
                backgroundColor: const Color.fromARGB(255, 236, 232, 232),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: SingleChildScrollView(
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
                          'اضافة العملية',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(color: Colors.cyan, width: 2.0),
                            bottom: BorderSide(color: Colors.cyan, width: 2.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 10.0),
                            _buildNameFieldWithSuggestions(
                                setState), // تمرير setState هنا
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
 */
  void _showAddOperationDialog() {
    setState(() {
      matchingClients = []; // إعادة تعيين القائمة المقترحة
    });

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Dialog(
                backgroundColor: const Color.fromARGB(255, 236, 232, 232),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: SingleChildScrollView(
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
                          'اضافة العملية',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      // const SizedBox(height: 16.0),

                      Container(
                        padding: const EdgeInsets.all(0.0),
                        decoration: const BoxDecoration(
                          // color: Colors.white,
                          border: Border(
                              // top: BorderSide(color: Colors.cyan, width: 2.0),
                              // bottom: BorderSide(color: Colors.cyan, width: 2.0),
                              ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 10.0),
                            _buildNameFieldWithSuggestions(setState),
                          ],
                        ),
                      ),
                      // const SizedBox(height: 16.0),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
/*   Widget _buildNameFieldWithSuggestions(
      void Function(void Function()) setState) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // حقل الاسم
            Row(
              children: [
                const Text(
                  'الاسم :   ',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
                ),
                Expanded(
                  child: TextFormField(
                    controller: _nameController,
                    focusNode: _nameFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      // نقل التركيز إلى حقل المبلغ
                      FocusScope.of(context).requestFocus(_amountFocusNode);
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _searchClients(value); // تحديث القائمة المقترحة
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال الاسم';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),

            // حقل المبلغ
            _buildFieldRow(
              controller: _amountController,
              focusNode: _amountFocusNode,
              label: 'المبلغ :    ',
              hint: '',
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_detailsFocusNode);
              },
            ),
            const SizedBox(height: 10.0),

            // حقل التفاصيل
            _buildFieldRow(
              controller: _detailsController,
              focusNode: _detailsFocusNode,
              label: 'تفاصيل : ',
              hint: '',
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) {
                FocusScope.of(context).unfocus();
              },
            ),
            const SizedBox(height: 10.0),
            // اختيار نوع العملية
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _transactionType = 'إضافة';
                    });
                    _saveTransaction();
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                  ),
                  child: const Text('إضافة'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _transactionType = 'تسديد';
                    });
                    _saveTransaction();
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                  ),
                  child: const Text('تسديد'),
                ),
              ],
            ),
          ],
        ),

        // قائمة الأسماء المقترحة
        if (matchingClients.isNotEmpty)
          Positioned(
            top: 40.0, // تحديد موقع القائمة بالنسبة لحقل الإدخال
            left: 0,
            right: 60,
            child: Container(
              constraints: const BoxConstraints(
                  maxHeight: 170), // الحد الأقصى لارتفاع القائمة
              decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: Colors.cyan, width: 3.0), // تحديد الحواف
                borderRadius: BorderRadius.circular(8.0), // زوايا مستديرة
              ),
              child: ListView.builder(
                itemCount: matchingClients.length,
                itemBuilder: (context, index) {
                  final client = matchingClients[index];
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 0.0,
                        ),
                        title: Text(
                          client['name'], // عرض اسم العميل
                          textAlign: TextAlign.right, // محاذاة النص إلى اليمين
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _nameController.text =
                                client['name']; // تحديث حقل النص
                            selectedClientId = client['id']; // تخزين ID العميل
                            matchingClients = []; // إخفاء القائمة بعد الاختيار
                          });
                        },
                      ),
                      // إضافة فاصل بين العناصر
                      if (index < matchingClients.length - 1)
                        const Divider(
                          color: Colors.cyan,
                          height: 0.0,
                          thickness: 1.7,
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
 */

  Widget _buildNameFieldWithSuggestions(
      void Function(void Function()) setState) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(0.0),
          decoration: const BoxDecoration(
            // color: Colors.white,
            border: Border(
                // top: BorderSide(color: Colors.cyan, width: 2.0),
                // bottom: BorderSide(color: Colors.cyan, width: 2.0),
                ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // حقل الاسم

              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.cyan, width: 2.0),
                    bottom: BorderSide(color: Colors.cyan, width: 2.0),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'الاسم :   ',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w800),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _nameController,
                            focusNode: _nameFocusNode,
                            textInputAction: TextInputAction.next,
                            // onFieldSubmitted: (_) {
                            //   // نقل التركيز إلى حقل المبلغ
                            //   FocusScope.of(context).requestFocus(_amountFocusNode);
                            // },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.cyan, width: 2.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.cyan, width: 2.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 4),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _searchClients(value); // تحديث القائمة المقترحة
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'يرجى إدخال الاسم';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),

                    // حقل المبلغ
                    Row(
                      children: [
                        const Text(
                          'المبلغ :    ',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w800),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _amountController,
                            focusNode: _amountFocusNode,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            // onFieldSubmitted: (_) {
                            //   // نقل التركيز إلى حقل التفاصيل
                            //   FocusScope.of(context).requestFocus(_detailsFocusNode);
                            // },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.cyan, width: 2.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.cyan, width: 2.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 4),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),

                    // حقل التفاصيل
                    Row(
                      children: [
                        const Text(
                          'تفاصيل : ',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w800),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _detailsController,
                            focusNode: _detailsFocusNode,
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) {
                              // إزالة التركيز عند الانتهاء
                              FocusScope.of(context).unfocus();
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.cyan, width: 2.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.cyan, width: 2.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 4),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),

              // اختيار نوع العملية
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
/*                   ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _transactionType = 'إضافة';
                      });
                      _saveTransaction();
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                    ),
                    child: const Text('إضافة'),
                  ),
 */
                  // خيار "صرف"
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _transactionType = 'إضافة';
                        _amountFocusNode.unfocus();
                        _detailsFocusNode.unfocus();
                      });
                      _saveTransaction();
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: _transactionType == 'إضافة'
                            ? Colors.red
                            : Colors.white,
                        border: Border.all(
                          color: const Color(0xFFFF665B),
                          width: 2.0,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'إضافة',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w800,
                            color: _transactionType == 'إضافة'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),

/*                   ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _transactionType = 'تسديد';
                      });
                      _saveTransaction();
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                    ),
                    child: const Text('تسديد'),
                  ),
          */

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _transactionType = 'تسديد';
                        _amountFocusNode.unfocus();
                        _detailsFocusNode.unfocus();
                      });
                      _saveTransaction();
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: _transactionType == 'تسديد'
                            ? Colors.green
                            : Colors.white,
                        border: Border.all(
                          color: const Color(0xFF70FF75),
                          width: 2.0,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'تسديد',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w800,
                            color: _transactionType == 'تسديد'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
        // قائمة الأسماء المقترحة
        if (matchingClients.isNotEmpty)
          Positioned(
            top: 40.0, // تحديد موقع القائمة بالنسبة لحقل الإدخال
            left: 0,
            right: 60,
            child: Container(
              constraints: const BoxConstraints(
                  maxHeight: 170), // الحد الأقصى لارتفاع القائمة
              decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: Colors.cyan, width: 3.0), // تحديد الحواف
                borderRadius: BorderRadius.circular(8.0), // زوايا مستديرة
              ),
              child: ListView.builder(
                itemCount: matchingClients.length,
                itemBuilder: (context, index) {
                  final client = matchingClients[index];
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 0.0,
                        ),
                        title: Text(
                          client['name'], // عرض اسم العميل
                          textAlign: TextAlign.right, // محاذاة النص إلى اليمين
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _nameController.text =
                                client['name']; // تحديث حقل النص
                            selectedClientId = client['id']; // تخزين ID العميل
                            matchingClients = []; // إخفاء القائمة بعد الاختيار
                          });
                        },
                      ),
                      // إضافة فاصل بين العناصر
                      if (index < matchingClients.length - 1)
                        const Divider(
                          color: Colors.cyan,
                          height: 0.0,
                          thickness: 1.7,
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
      ],
    );
  }

/* 
  Widget _buildFieldRow({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.done,
    required void Function(String) onFieldSubmitted,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
        ),
        Expanded(
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            onFieldSubmitted: onFieldSubmitted,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan, width: 2.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan, width: 2.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              hintText: hint,
            ),
          ),
        ),
      ],
    );
  }
 */
  Widget _buildFieldRow({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.done,
    required void Function(String) onFieldSubmitted,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
        ),
        Expanded(
          child: TextFormField(
            controller: controller,
            focusNode: focusNode, // تأكد من أن FocusNode مرتبط هنا
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            onFieldSubmitted: onFieldSubmitted,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan, width: 2.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan, width: 2.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              hintText: hint,
            ),
          ),
        ),
      ],
    );
  }

/* 
  Widget _buildNameFieldWithSuggestions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // حقل الاسم
        Row(
          children: [
            const Text(
              'الاسم :   ',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
            ),
            Expanded(
              child: TextFormField(
                controller: _nameController,
                focusNode: _nameFocusNode,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_amountFocusNode);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    _searchClients(value); // البحث عن الأسماء المشابهة
                  } else {
                    setState(() {
                      matchingClients =
                          []; // إخفاء القائمة إذا كان الحقل فارغًا
                    });
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال الاسم';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),

        // قائمة الأسماء المقترحة
        if (matchingClients.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.cyan, width: 2.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            height: 150, // تحديد ارتفاع ثابت للقائمة
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: matchingClients.length,
              itemBuilder: (context, index) {
                final client = matchingClients[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        client['name'],
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _nameController.text =
                              client['name']; // تحديث حقل النص
                          selectedClientId = client['id']; // تخزين ID العميل
                          matchingClients = []; // إخفاء القائمة بعد الاختيار
                        });
                      },
                    ),
                    if (index < matchingClients.length - 1)
                      const Divider(
                        color: Colors.cyan,
                        height: 1.0,
                        thickness: 1.0,
                      ),
                  ],
                );
              },
            ),
          ),
      ],
    );
  }
 */
//  ============================================================
//  ============================================================
//  ============================================================
  Future<void> _saveTransactionToDatabase() async {
    double? amount = double.tryParse(_amountController.text.trim());
    String details = _detailsController.text.trim();

    if (selectedClientId == null || amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى اختيار عميل صحيح ومبلغ أكبر من 0'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    await DatabaseHelper().insertOperation(
      selectedClientId!, // إرسال ID العميل
      amount,
      details,
      _transactionType,
    );

    _refreshTransactions();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم حفظ العملية بنجاح'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _saveTransaction() async {
    if (_transactionType.isNotEmpty) {
      final databaseHelper = DatabaseHelper();
      String trimmedName =
          _nameController.text.trim(); // استخدام النص مباشرة من وحدة التحكم

      // التحقق من وجود العميل
      bool clientExists = await databaseHelper.doesClientExist(trimmedName);

      if (!clientExists) {
        showDialog(
          context: context,
          builder: (context) {
            String phoneNumber = '';

            return StatefulBuilder(
              builder: (context, setState) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Dialog(
                      backgroundColor: const Color(0xFFEEEBEB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: SingleChildScrollView(
                          child: Container(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              decoration: const BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                              ),
                              child: const Text(
                                ' اضافة عميل جديد',
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
                              width: double.infinity,
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  const Text(
                                      'اسم العميل غير محفوظ. هل ترغب في حفظه؟'),
                                  const SizedBox(height: 16.0),
                                  TextField(
                                    textDirection: TextDirection.rtl,
                                    decoration: const InputDecoration(
                                      labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800),
                                      labelText: 'رقم الهاتف',
                                      // border: OutlineInputBorder(),
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.cyan),
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
                                    keyboardType: TextInputType.phone,
                                    onChanged: (value) {
                                      phoneNumber = value;
                                    },
                                  ),
                                  const SizedBox(height: 10.0),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 3,
                              color: Colors.cyan,
                            ),
                            const SizedBox(height: 18.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // إغلاق النافذة
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
                                  child: const Text(
                                    'إلغاء',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    if (phoneNumber.isNotEmpty) {
                                      await databaseHelper.insertCustomer(
                                          trimmedName, phoneNumber);

                                      Navigator.of(context).pop();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'تم حفظ العميل والعملية بنجاح'),
                                          backgroundColor: Colors.green,
                                        ),
                                      );

                                      // حفظ العملية بعد حفظ العميل
                                      await _saveTransactionToDatabase();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('يرجى إدخال رقم الهاتف'),
                                          backgroundColor: Colors.red,
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
                                  child: const Text(
                                    'حفظ',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10.0),
                          ],
                        ),
                      ))),
                );
              },
            );
          },
        );
      } else {
        // إذا كان العميل موجودًا، قم بحفظ العملية مباشرة
        await _saveTransactionToDatabase();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى اختيار نوع العملية')),
      );
    }
  }

  void _refreshTransactions() async {
    final databaseHelper = DatabaseHelper();
    final newTransactions =
        await databaseHelper.getLastTenOperationsWithNames();
    setState(() {
      _recentTransactions = newTransactions;
    });
  }

  TableRow _buildInfoRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCell(Map<String, dynamic> transaction) {
    Color iconColor = transaction['type'] == 'إضافة'
        ? const Color(0xFFFF4134)
        : const Color(0xFF66EE6B);

    return IconButton(
      icon: Icon(
        Icons.info_sharp,
        color: iconColor,
        size: 35,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => _buildTransactionDetailsDialog(transaction),
        );
      },
    );
  }

  Widget _buildTransactionDetailsDialog(Map<String, dynamic> transaction) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
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
                'تفاصيل العملية',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 16.0),

            // جدول التفاصيل
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(7.5),
                  1: FlexColumnWidth(2.5),
                },
                border: TableBorder.all(
                  color: Colors.cyan,
                  width: 1.5,
                ),
                children: [
                  _buildInfoRow(
                      'الاسم', transaction['client_name'] ?? 'غير معروف'),
                  _buildInfoRow('المبلغ',
                      transaction['amount']?.toString() ?? 'غير معروف'),
                  _buildInfoRow(
                      'تفاصيل', transaction['details'] ?? 'غير معروف'),
                  _buildInfoRow('النوع', transaction['type'] ?? 'غير معروف'),
                  // _buildInfoRow('النوع', transaction['id'] ?? 'غير معروف'),
                  _buildInfoRow('التاريخ', transaction['date'] ?? 'غير معروف'),
                ],
              ),
            ),

            const SizedBox(height: 16.0),

            // الأزرار
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // حذف العملية
                    Navigator.of(context).pop();

                    _deleteTransaction(transaction);
                  },
                  icon: const Icon(Icons.delete, color: Colors.white),
                  label: const Text('حذف'),
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Colors.red, // لون الزر
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // تعديل العملية
                    _editTransaction(transaction);
                  },
                  icon: const Icon(Icons.edit, color: Colors.white),
                  label: const Text('تعديل'),
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Colors.blue, // لون الزر
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16.0),

            // زر الإغلاق
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'إغلاق',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteTransaction(Map<String, dynamic> transaction) async {
    // احصل على معرف العملية
    final int? transactionId = transaction['operation_id'];

    if (transactionId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('العملية المحددة غير صالحة للحذف'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      // احصل على المثيل
      final databaseHelper = DatabaseHelper();

      // استدعِ دالة الحذف باستخدام المثيل
      int rowsAffected = await databaseHelper.deleteOperation(transactionId);

      if (rowsAffected > 0) {
        _refreshTransactions(); // تحديث البيانات بعد الحذف

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم حذف العملية بنجاح'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('فشل في حذف العملية'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('حدث خطأ أثناء حذف العملية'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _editTransaction(Map<String, dynamic> transaction) {
    final TextEditingController amountController =
        TextEditingController(text: transaction['amount'].toString());
    final TextEditingController detailsController =
        TextEditingController(text: transaction['details']);
    String selectedType = transaction['type']; // النوع الحالي

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Dialog(
                backgroundColor: Colors.white, // خلفية النافذة بيضاء
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 10, // إضافة ظل للنافذة
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // العنوان بخلفية زرقاء
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                        ),
                        child: const Text(
                          'تعديل العملية',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      // فراغ
                      const SizedBox(height: 20.0),

                      // مربع بحواف زرقاء
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(color: Colors.blue, width: 2.0),
                            bottom: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            // حقل تعديل المبلغ
                            TextField(
                              controller: amountController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'المبلغ',
                                labelStyle: const TextStyle(color: Colors.blue),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20.0),

                            // حقل تعديل التفاصيل
                            TextField(
                              controller: detailsController,
                              decoration: InputDecoration(
                                labelText: 'التفاصيل',
                                labelStyle: const TextStyle(color: Colors.blue),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20.0),

                            // اختيار نوع العملية (مربع)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.2,
                                      child: Radio<String>(
                                        value: 'إضافة',
                                        groupValue: selectedType,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedType = value!;
                                          });
                                        },
                                        activeColor: Colors
                                            .blue, // لون المربع عند الاختيار
                                      ),
                                    ),
                                    const Text(
                                      'إضافة',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.2,
                                      child: Radio<String>(
                                        value: 'تسديد',
                                        groupValue: selectedType,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedType = value!;
                                          });
                                        },
                                        activeColor: Colors
                                            .blue, // لون المربع عند الاختيار
                                      ),
                                    ),
                                    const Text(
                                      'تسديد',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // مربع أسفل النافذة للأزرار
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                          ),
                        ),
                        child: Row(
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
                                    ),
                                  );
                                  return;
                                }

                                try {
                                  final databaseHelper = DatabaseHelper();
                                  int rowsAffected =
                                      await databaseHelper.updateOperation(
                                    transaction[
                                        'operation_id'], // نفس ID العملية
                                    double.parse(amountController.text),
                                    detailsController.text,
                                    selectedType,
                                  );

                                  if (rowsAffected > 0) {
                                    Navigator.of(context).pop();
                                    _refreshTransactions();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('تم تعديل العملية بنجاح'),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('فشل في تعديل العملية'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                } catch (error) {
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('حدث خطأ أثناء تعديل العملية'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue, // لون زر الحفظ
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              child: const Text(
                                'حفظ',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey, // لون زر الإلغاء
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              child: const Text(
                                'إلغاء',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
 






/* 
class _AddTransactionPageState extends State<AddTransactionPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _amountFocusNode = FocusNode();
  final FocusNode _detailsFocusNode = FocusNode();

  String _transactionType = '';
  List<Map<String, dynamic>> _recentTransactions = [];

  int? selectedClientId;
  List<Map<String, dynamic>> matchingClients = [];

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _detailsController.dispose();
    _nameFocusNode.dispose();
    _amountFocusNode.dispose();
    _detailsFocusNode.dispose();
    super.dispose();
  }

  void _searchClients(String query) async {
    final results = await DatabaseHelper().searchClientsByName(query);
    setState(() {
      matchingClients = results;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchRecentTransactions();

    _nameFocusNode.addListener(() {
      if (_nameFocusNode.hasFocus) {
        _moveCursorToEnd(_nameController);
      }
    });

    _amountFocusNode.addListener(() {
      if (_amountFocusNode.hasFocus) {
        _moveCursorToEnd(_amountController);
      }
    });

    _detailsFocusNode.addListener(() {
      if (_detailsFocusNode.hasFocus) {
        _moveCursorToEnd(_detailsController);
      }
    });
  }

  void _moveCursorToEnd(TextEditingController controller) {
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
  }

  Future<void> _fetchRecentTransactions() async {
    final transactions = await DatabaseHelper().getLastTenOperationsWithNames();
    setState(() {
      _recentTransactions = transactions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFEEEBEB),
        appBar: AppBar(
          title: const Text(
            '  ادارة حسابات العملاء',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.home,
              size: 35,
              color: Color(0xFFF26157),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyApp(),
                ),
              );
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.person,
                size: 30,
                color: Color.fromARGB(255, 76, 96, 245),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddDeletePage(),
                  ),
                );
              },
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Color.fromARGB(255, 106, 245, 111),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchClientPage(),
                  ),
                );
              },
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(6.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 8.0),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 40),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3.0),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.cyan,
                  ),
                  child: const Text(
                    'العمليات الاخيرة',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.cyan, width: 3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.cyan,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: const [
                            Expanded(
                              flex: 8,
                              child: Text(
                                'التفاصيل',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'معلومات',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          itemCount: _recentTransactions.length,
                          itemBuilder: (context, index) {
                            final transaction = _recentTransactions[index];
                            return Container(
                              decoration: BoxDecoration(
                                color: index % 2 == 0
                                    ? const Color(0xFFF1F1F1)
                                    : Colors.white,
                                border: const Border(
                                  bottom: BorderSide(
                                      color: Colors.cyan, width: 2.0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.cyan, width: 2.0),
                                          right: BorderSide(
                                              color: Colors.cyan, width: 2.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                          horizontal: 2,
                                        ),
                                        child: Text(
                                          transaction['client_name'],
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontSize: 14.5,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: _buildInfoCell(transaction),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.cyan,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.white),
                onPressed: () {
                  // إضافة أي وظيفة تريدها للأيقونة الأولى
                },
              ),
              FloatingActionButton(
                onPressed: () {
                  _showAddTransactionDialog();
                },
                child: const Icon(Icons.add, color: Colors.white),
                backgroundColor: Colors.blue,
              ),
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.white),
                onPressed: () {
                  // إضافة أي وظيفة تريدها للأيقونة الثانية
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddTransactionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Container(
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Text(
                'إضافة عملية جديدة',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 16.0),
                  _buildNameFieldWithSuggestions(),
                  // TextField(
                  //   controller: _nameController,
                  //   decoration: const InputDecoration(
                  //     labelText: 'الاسم',
                  //     border: OutlineInputBorder(),
                  //   ),
                  // ),

                  /*     const SizedBox(height: 16.0),
                  TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'المبلغ',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _detailsController,
                    decoration: const InputDecoration(
                      labelText: 'التفاصيل',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  DropdownButtonFormField<String>(
                    value:
                        _transactionType.isNotEmpty ? _transactionType : null,
                    items: ['إضافة', 'تسديد'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _transactionType = value!;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'نوع العملية',
                      border: OutlineInputBorder(),
                    ),
                  ),
               */
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('إلغاء'),
              ),
              ElevatedButton(
                onPressed: () {
                  _saveTransaction();

                  Navigator.of(context).pop();
                },
                child: const Text('حفظ'),
              ),
            ],
          ),
        );
      },
    );
  }

  // باقي الدوال مثل _saveTransaction, _buildInfoCell, _refreshTransactions, إلخ...
  Future<void> _saveTransactionToDatabase() async {
    double? amount = double.tryParse(_amountController.text.trim());
    String details = _detailsController.text.trim();

    if (selectedClientId == null || amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى اختيار عميل صحيح ومبلغ أكبر من 0'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    await DatabaseHelper().insertOperation(
      selectedClientId!, // إرسال ID العميل
      amount,
      details,
      _transactionType,
    );

    _refreshTransactions();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم حفظ العملية بنجاح'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _saveTransaction() async {
    if (_transactionType.isNotEmpty) {
      final databaseHelper = DatabaseHelper();
      String trimmedName =
          _nameController.text.trim(); // استخدام النص مباشرة من وحدة التحكم

      // التحقق من وجود العميل
      bool clientExists = await databaseHelper.doesClientExist(trimmedName);

      if (!clientExists) {
        showDialog(
          context: context,
          builder: (context) {
            String phoneNumber = '';

            return StatefulBuilder(
              builder: (context, setState) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Dialog(
                      backgroundColor: const Color(0xFFEEEBEB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: SingleChildScrollView(
                          child: Container(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              decoration: const BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                              ),
                              child: const Text(
                                ' اضافة عميل جديد',
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
                              width: double.infinity,
                              // padding:
                              // const EdgeInsets.symmetric(vertical: 12.0),
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  const Text(
                                      'اسم العميل غير محفوظ. هل ترغب في حفظه؟'),
                                  const SizedBox(height: 16.0),
                                  TextField(
                                    textDirection: TextDirection.rtl,
                                    decoration: const InputDecoration(
                                      labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800),
                                      labelText: 'رقم الهاتف',
                                      // border: OutlineInputBorder(),
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.cyan),
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
                                    keyboardType: TextInputType.phone,
                                    onChanged: (value) {
                                      phoneNumber = value;
                                    },
                                  ),
                                  const SizedBox(height: 10.0),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 3,
                              color: Colors.cyan,
                            ),
                            const SizedBox(height: 18.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // إغلاق النافذة
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
                                  child: const Text(
                                    'إلغاء',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    if (phoneNumber.isNotEmpty) {
                                      await databaseHelper.insertCustomer(
                                          trimmedName, phoneNumber);

                                      Navigator.of(context).pop();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'تم حفظ العميل والعملية بنجاح'),
                                          backgroundColor: Colors.green,
                                        ),
                                      );

                                      // حفظ العملية بعد حفظ العميل
                                      await _saveTransactionToDatabase();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('يرجى إدخال رقم الهاتف'),
                                          backgroundColor: Colors.red,
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
                                  child: const Text(
                                    'حفظ',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10.0),
                          ],
                        ),
                      ))),
                );
              },
            );
          },
        );
      } else {
        // إذا كان العميل موجودًا، قم بحفظ العملية مباشرة
        await _saveTransactionToDatabase();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى اختيار نوع العملية')),
      );
    }
  }

// ========================================
// دوال التعامل مع الحذف والتعديل
// ========================================

  void _refreshTransactions() async {
    final databaseHelper = DatabaseHelper();
    final newTransactions =
        await databaseHelper.getLastTenOperationsWithNames();
    setState(() {
      _recentTransactions = newTransactions;
    });
  }

// دالة بناء صف لكل معلومة
  TableRow _buildInfoRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
// ============================================
  // حفظ العملية في قاعدة البيانات
// ============================================

  Widget _buildNameFieldWithSuggestions() {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // حقل الاسم
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // const SizedBox(width: 10.0),
                const Text(
                  'الاسم :   ',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
                ),
                // const SizedBox(width: 12.0),
                Expanded(
                  child: TextFormField(
                    controller: _nameController,
                    focusNode: _nameFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_amountFocusNode);
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    ),
                    onChanged: (value) {
                      _searchClients(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال الاسم';
                      }
                      return null;
                    },
                  ),
                ),
                // const SizedBox(width: 16.0),
              ],
            ),

            const SizedBox(height: 10.0),

            // الحقل الثاني: المبلغ
            _buildFieldRow(
              controller: _amountController,
              focusNode: _amountFocusNode,
              label: 'المبلغ :    ',
              hint: '',
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_detailsFocusNode);
              },
            ),

            const SizedBox(height: 10.0),

            // الحقل الثالث: التفاصيل
            _buildFieldRow(
              controller: _detailsController,
              focusNode: _detailsFocusNode,
              label: 'تفاصيل : ',
              hint: '',
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) {
                FocusScope.of(context).unfocus();
              },
            ),

            const SizedBox(height: 10.0),
            DropdownButtonFormField<String>(
              value: _transactionType.isNotEmpty ? _transactionType : null,
              items: ['إضافة', 'تسديد'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _transactionType = value!;
                });
              },
              decoration: const InputDecoration(
                labelText: 'نوع العملية',
                border: OutlineInputBorder(),
              ),
            ),

            // زر الموافقة
/*             Center(
              child: ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus(); // إخفاء لوحة المفاتيح
                  _showTransactionTypeDialog();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan,
                  onPrimary: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  elevation: 4,
                ),
                child: const Text(
                  'موافق',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
         */
          ],
        ),
        if (matchingClients.isNotEmpty)
          Positioned(
            top: 45.0, // تحديد موقع القائمة بالنسبة لحقل الإدخال
            left: 16,
            right: 80,
            child: Container(
              constraints: const BoxConstraints(
                  maxHeight: 170), // الحد الأقصى لارتفاع القائمة
              decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: Colors.cyan, width: 3.0), // تحديد الحواف
                borderRadius: BorderRadius.circular(8.0), // زوايا مستديرة
              ),
              child: ListView.builder(
                itemCount: matchingClients.length,
                itemBuilder: (context, index) {
                  final client = matchingClients[index];
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 0.0,
                        ),
                        title: Text(
                          client['name'], // عرض اسم العميل
                          textAlign: TextAlign.right, // محاذاة النص إلى اليمين
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _nameController.text =
                                client['name']; // تحديث حقل النص
                            selectedClientId = client['id']; // تخزين ID العميل
                            matchingClients = []; // إخفاء القائمة بعد الاختيار
                          });
                        },
                      ),
                      // إضافة فاصل بين العناصر
                      if (index < matchingClients.length - 1)
                        const Divider(
                          color: Colors.cyan,
                          height: 0.0,
                          thickness: 1.7,
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
      ],
    );
  }

  // نافذة اختيار نوع العملية
  void _showTransactionTypeDialog() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save(); // حفظ القيم
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: const Color(0xFFEEEBEB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                    // 'تعديل بيانات عميل',
                    'اختر نوع العملية',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      // padding: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color(0xFFFF665B), width: 2.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'إضافة',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w800),
                          ),
                          Radio<String>(
                            value: 'إضافة',
                            activeColor: Colors.red,
                            groupValue: _transactionType,
                            onChanged: (value) {
                              setState(() {
                                _transactionType = value ?? '';
                              });
                              Navigator.pop(context);
                              _saveTransaction();
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color(0xFF70FF75), width: 2.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'تسديد',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w800),
                          ),
                          Radio<String>(
                            value: 'تسديد',
                            activeColor: const Color(0xFF70FF75),
                            groupValue: _transactionType,
                            onChanged: (value) {
                              setState(() {
                                _transactionType = value ?? '';
                              });
                              Navigator.pop(context);
                              _saveTransaction();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
              ],
            ),
            // mainAxisSize: MainAxisSize.min,
            // ),
          );
        },
      );
    }
  }

  Widget _buildFieldRow({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.done,
    required void Function(String) onFieldSubmitted,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 10.0),
        Text(
          label,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            onFieldSubmitted: onFieldSubmitted,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan, width: 2.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan, width: 2.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              hintText: hint,
            ),
          ),
        ),
        const SizedBox(width: 16.0),
      ],
    );
  }

// =====================================

  Widget _buildInfoCell(Map<String, dynamic> transaction) {
    Color iconColor = transaction['type'] == 'إضافة'
        ? const Color(0xFFFF4134)
        : const Color(0xFF66EE6B);

    return IconButton(
      icon: Icon(
        Icons.info_sharp,
        color: iconColor,
        size: 35,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => _buildTransactionDetailsDialog(transaction),
        );
      },
    );
  }

  Widget _buildTransactionDetailsDialog(Map<String, dynamic> transaction) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
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
                'تفاصيل العملية',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 16.0),

            // جدول التفاصيل
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(7.5),
                  1: FlexColumnWidth(2.5),
                },
                border: TableBorder.all(
                  color: Colors.cyan,
                  width: 1.5,
                ),
                children: [
                  _buildInfoRow(
                      'الاسم', transaction['client_name'] ?? 'غير معروف'),
                  _buildInfoRow('المبلغ',
                      transaction['amount']?.toString() ?? 'غير معروف'),
                  _buildInfoRow(
                      'تفاصيل', transaction['details'] ?? 'غير معروف'),
                  _buildInfoRow('النوع', transaction['type'] ?? 'غير معروف'),
                  // _buildInfoRow('النوع', transaction['id'] ?? 'غير معروف'),
                  _buildInfoRow('التاريخ', transaction['date'] ?? 'غير معروف'),
                ],
              ),
            ),

            const SizedBox(height: 16.0),

            // الأزرار
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // حذف العملية
                    Navigator.of(context).pop();

                    _deleteTransaction(transaction);
                  },
                  icon: const Icon(Icons.delete, color: Colors.white),
                  label: const Text('حذف'),
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Colors.red, // لون الزر
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // تعديل العملية
                    _editTransaction(transaction);
                  },
                  icon: const Icon(Icons.edit, color: Colors.white),
                  label: const Text('تعديل'),
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Colors.blue, // لون الزر
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16.0),

            // زر الإغلاق
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'إغلاق',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteTransaction(Map<String, dynamic> transaction) async {
    // احصل على معرف العملية
    final int? transactionId = transaction['operation_id'];

    if (transactionId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('العملية المحددة غير صالحة للحذف'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      // احصل على المثيل
      final databaseHelper = DatabaseHelper();

      // استدعِ دالة الحذف باستخدام المثيل
      int rowsAffected = await databaseHelper.deleteOperation(transactionId);

      if (rowsAffected > 0) {
        _refreshTransactions(); // تحديث البيانات بعد الحذف

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم حذف العملية بنجاح'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('فشل في حذف العملية'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('حدث خطأ أثناء حذف العملية'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _editTransaction(Map<String, dynamic> transaction) {
    final TextEditingController amountController =
        TextEditingController(text: transaction['amount'].toString());
    final TextEditingController detailsController =
        TextEditingController(text: transaction['details']);
    String selectedType = transaction['type']; // النوع الحالي

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Dialog(
                backgroundColor: Colors.white, // خلفية النافذة بيضاء
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 10, // إضافة ظل للنافذة
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // العنوان بخلفية زرقاء
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                        ),
                        child: const Text(
                          'تعديل العملية',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      // فراغ
                      const SizedBox(height: 20.0),

                      // مربع بحواف زرقاء
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(color: Colors.blue, width: 2.0),
                            bottom: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            // حقل تعديل المبلغ
                            TextField(
                              controller: amountController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'المبلغ',
                                labelStyle: const TextStyle(color: Colors.blue),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20.0),

                            // حقل تعديل التفاصيل
                            TextField(
                              controller: detailsController,
                              decoration: InputDecoration(
                                labelText: 'التفاصيل',
                                labelStyle: const TextStyle(color: Colors.blue),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20.0),

                            // اختيار نوع العملية (مربع)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.2,
                                      child: Radio<String>(
                                        value: 'إضافة',
                                        groupValue: selectedType,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedType = value!;
                                          });
                                        },
                                        activeColor: Colors
                                            .blue, // لون المربع عند الاختيار
                                      ),
                                    ),
                                    const Text(
                                      'إضافة',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.2,
                                      child: Radio<String>(
                                        value: 'تسديد',
                                        groupValue: selectedType,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedType = value!;
                                          });
                                        },
                                        activeColor: Colors
                                            .blue, // لون المربع عند الاختيار
                                      ),
                                    ),
                                    const Text(
                                      'تسديد',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // مربع أسفل النافذة للأزرار
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                          ),
                        ),
                        child: Row(
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
                                    ),
                                  );
                                  return;
                                }

                                try {
                                  // print('Attempting to update operation: ID=${transaction['operation_id']}, '
                                  //     'Amount=${amountController.text}, Details=${detailsController.text}, '
                                  //     'Type=$selectedType');
                                  // print('===================================');
                                  final databaseHelper = DatabaseHelper();
                                  int rowsAffected =
                                      await databaseHelper.updateOperation(
                                    transaction[
                                        'operation_id'], // نفس ID العملية
                                    double.parse(amountController.text),
                                    detailsController.text,
                                    selectedType,
                                  );

                                  if (rowsAffected > 0) {
                                    Navigator.of(context).pop();
                                    _refreshTransactions();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('تم تعديل العملية بنجاح'),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('فشل في تعديل العملية'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                } catch (error) {
                                  // print('Error occurred while updating operation: $error');
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('حدث خطأ أثناء تعديل العملية'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue, // لون زر الحفظ
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              child: const Text(
                                'حفظ',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey, // لون زر الإلغاء
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              child: const Text(
                                'إلغاء',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
 */
/* 
class _AddTransactionPageState extends State<AddTransactionPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _amountFocusNode = FocusNode();
  final FocusNode _detailsFocusNode = FocusNode();
  String _transactionType = '';
  List<Map<String, dynamic>> _recentTransactions = [];
  int? selectedClientId; // ID العميل المختار
  List<Map<String, dynamic>> matchingClients = []; // قائمة الأسماء المطابقة

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _detailsController.dispose();
    _nameFocusNode.dispose();
    _amountFocusNode.dispose();
    _detailsFocusNode.dispose();
    super.dispose();
  }

  void _searchClients(String query) async {
    final results = await DatabaseHelper().searchClientsByName(query);
    setState(() {
      matchingClients = results;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchRecentTransactions();

    // تحريك المؤشر إلى نهاية النص عند التركيز على الحقل
    _nameFocusNode.addListener(() {
      if (_nameFocusNode.hasFocus) {
        _moveCursorToEnd(_nameController);
      }
    });

    _amountFocusNode.addListener(() {
      if (_amountFocusNode.hasFocus) {
        _moveCursorToEnd(_amountController);
      }
    });

    _detailsFocusNode.addListener(() {
      if (_detailsFocusNode.hasFocus) {
        _moveCursorToEnd(_detailsController);
      }
    });
  }

  void _moveCursorToEnd(TextEditingController controller) {
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
  }

  // جلب آخر 50 عمليات من قاعدة البيانات
  Future<void> _fetchRecentTransactions() async {
    final transactions = await DatabaseHelper().getLastTenOperationsWithNames();
    setState(() {
      _recentTransactions = transactions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFEEEBEB),
        appBar: AppBar(
          title: const Text(
            '  ادارة حسابات العملاء',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.home,
              size: 35,
              color: Color(0xFFF26157),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const MyApp(), // استبدل AddTransactionPage بالصفحة المستهدفة
                ),
              );
            },
          ),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.person,
                  size: 30,
                  color: Color.fromARGB(255, 76, 96, 245),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const AddDeletePage(), // استبدل AddTransactionPage بالصفحة المستهدفة
                    ),
                  );
                }),
            const SizedBox(width: 8),
            IconButton(
                icon: const Icon(Icons.search,
                    size: 30, color: Color.fromARGB(255, 106, 245, 111)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const SearchClientPage(), // استبدل AddTransactionPage بالصفحة المستهدفة
                    ),
                  );
                }),
            const SizedBox(width: 8),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(6.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // _buildHighlightedBox(),
                const SizedBox(height: 8.0),
                // عنوان الجدول
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 40),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3.0),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.cyan,
                  ),
                  child: const Text(
                    'العمليات الاخيرة',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8.0),

                // تمت إزالة Expanded من هنا
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.cyan, width: 3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.cyan,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: const [
                            Expanded(
                              flex: 8, // نسبة 80%
                              child: Text(
                                'التفاصيل',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2, // نسبة 20%
                              child: Text(
                                'معلومات',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // تمت إزالة Expanded من هنا أيضًا
                      SizedBox(
                        height:
                            300, // حدد ارتفاعًا ثابتًا أو استخدم MediaQuery لتحديد ارتفاع ديناميكي
                        child: ListView.builder(
                          itemCount: _recentTransactions.length,
                          itemBuilder: (context, index) {
                            final transaction = _recentTransactions[index];

                            return Container(
                              decoration: BoxDecoration(
                                color: index % 2 == 0
                                    ? const Color(0xFFF1F1F1)
                                    : Colors.white,
                                border: const Border(
                                  bottom: BorderSide(
                                      color: Colors.cyan, width: 2.0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 8, // نسبة 80%
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.cyan, width: 2.0),
                                          right: BorderSide(
                                              color: Colors.cyan, width: 2.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                          horizontal: 2,
                                        ),
                                        child: Text(
                                          transaction['client_name'],
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontSize: 14.5,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // عمود معلومات
                                  Expanded(
                                    flex: 2, // نسبة 20%
                                    child: _buildInfoCell(transaction),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddTransactionDialog();
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.cyan,
        ),
      ),
    );
  }

  void _showAddTransactionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text('إضافة عملية'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildNameFieldWithSuggestions(),
                  /*  const SizedBox(height: 10.0),
                  _buildFieldRow(
                    controller: _amountController,
                    focusNode: _amountFocusNode,
                    label: 'المبلغ :    ',
                    hint: '',
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_detailsFocusNode);
                    },
                  ),
                  const SizedBox(height: 10.0),
                  _buildFieldRow(
                    controller: _detailsController,
                    focusNode: _detailsFocusNode,
                    label: 'تفاصيل : ',
                    hint: '',
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).unfocus();
                    },
                  ),
                  const SizedBox(height: 10.0), */
/*                   Center(
                    child: ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus(); // إخفاء لوحة المفاتيح
                        _showTransactionTypeDialog();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.cyan,
                        onPrimary: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        elevation: 4,
                      ),
                      child: const Text(
                        'موافق',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                */
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // باقي الدوال والأكواد...
  Widget _buildHighlightedBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.cyan, width: 2.0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // عنوان الصندوق
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: const BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.vertical(
                  // top: Radius.circular(8),
                  ),
            ),
            child: const Center(
              child: Text(
                'إضافة عملية',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),

          // النموذج
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // حقل الاسم مع القائمة
                _buildNameFieldWithSuggestions(),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
          const SizedBox(height: 6.0),
        ],
      ),
    );
  }

  void _showTransactionTypeDialog() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save(); // حفظ القيم
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: const Color(0xFFEEEBEB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                    // 'تعديل بيانات عميل',
                    'اختر نوع العملية',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      // padding: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color(0xFFFF665B), width: 2.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'إضافة',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w800),
                          ),
                          Radio<String>(
                            value: 'إضافة',
                            activeColor: Colors.red,
                            groupValue: _transactionType,
                            onChanged: (value) {
                              setState(() {
                                _transactionType = value ?? '';
                              });
                              Navigator.pop(context);
                              _saveTransaction();
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color(0xFF70FF75), width: 2.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'تسديد',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w800),
                          ),
                          Radio<String>(
                            value: 'تسديد',
                            activeColor: const Color(0xFF70FF75),
                            groupValue: _transactionType,
                            onChanged: (value) {
                              setState(() {
                                _transactionType = value ?? '';
                              });
                              Navigator.pop(context);
                              _saveTransaction();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
              ],
            ),
            // mainAxisSize: MainAxisSize.min,
            // ),
          );
        },
      );
    }
  }

  Future<void> _saveTransactionToDatabase() async {
    double? amount = double.tryParse(_amountController.text.trim());
    String details = _detailsController.text.trim();

    if (selectedClientId == null || amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى اختيار عميل صحيح ومبلغ أكبر من 0'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    await DatabaseHelper().insertOperation(
      selectedClientId!, // إرسال ID العميل
      amount,
      details,
      _transactionType,
    );

    _refreshTransactions();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم حفظ العملية بنجاح'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _saveTransaction() async {
    if (_transactionType.isNotEmpty) {
      final databaseHelper = DatabaseHelper();
      String trimmedName =
          _nameController.text.trim(); // استخدام النص مباشرة من وحدة التحكم

      // التحقق من وجود العميل
      bool clientExists = await databaseHelper.doesClientExist(trimmedName);

      if (!clientExists) {
        showDialog(
          context: context,
          builder: (context) {
            String phoneNumber = '';

            return StatefulBuilder(
              builder: (context, setState) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Dialog(
                      backgroundColor: const Color(0xFFEEEBEB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: SingleChildScrollView(
                          child: Container(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              decoration: const BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                              ),
                              child: const Text(
                                ' اضافة عميل جديد',
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
                              width: double.infinity,
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  const Text(
                                      'اسم العميل غير محفوظ. هل ترغب في حفظه؟'),
                                  const SizedBox(height: 16.0),
                                  TextField(
                                    textDirection: TextDirection.rtl,
                                    decoration: const InputDecoration(
                                      labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800),
                                      labelText: 'رقم الهاتف',
                                      // border: OutlineInputBorder(),
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.cyan),
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
                                    keyboardType: TextInputType.phone,
                                    onChanged: (value) {
                                      phoneNumber = value;
                                    },
                                  ),
                                  const SizedBox(height: 10.0),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 3,
                              color: Colors.cyan,
                            ),
                            const SizedBox(height: 18.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // إغلاق النافذة
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
                                  child: const Text(
                                    'إلغاء',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    if (phoneNumber.isNotEmpty) {
                                      await databaseHelper.insertCustomer(
                                          trimmedName, phoneNumber);

                                      Navigator.of(context).pop();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'تم حفظ العميل والعملية بنجاح'),
                                          backgroundColor: Colors.green,
                                        ),
                                      );

                                      // حفظ العملية بعد حفظ العميل
                                      await _saveTransactionToDatabase();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('يرجى إدخال رقم الهاتف'),
                                          backgroundColor: Colors.red,
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
                                  child: const Text(
                                    'حفظ',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10.0),
                          ],
                        ),
                      ))),
                );
              },
            );
          },
        );
      } else {
        // إذا كان العميل موجودًا، قم بحفظ العملية مباشرة
        await _saveTransactionToDatabase();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى اختيار نوع العملية')),
      );
    }
  }

  void _refreshTransactions() async {
    final databaseHelper = DatabaseHelper();
    final newTransactions =
        await databaseHelper.getLastTenOperationsWithNames();
    setState(() {
      _recentTransactions = newTransactions;
    });
  }

  TableRow _buildInfoRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildNameFieldWithSuggestions() {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // حقل الاسم
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 10.0),
                const Text(
                  'الاسم :   ',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: TextFormField(
                    controller: _nameController,
                    focusNode: _nameFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_amountFocusNode);
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    ),
                    onChanged: (value) {
                      _searchClients(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال الاسم';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
              ],
            ),

            const SizedBox(height: 10.0),

            // الحقل الثاني: المبلغ
            _buildFieldRow(
              controller: _amountController,
              focusNode: _amountFocusNode,
              label: 'المبلغ :    ',
              hint: '',
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_detailsFocusNode);
              },
            ),

            const SizedBox(height: 10.0),

            // الحقل الثالث: التفاصيل
            _buildFieldRow(
              controller: _detailsController,
              focusNode: _detailsFocusNode,
              label: 'تفاصيل : ',
              hint: '',
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) {
                FocusScope.of(context).unfocus();
              },
            ),

            const SizedBox(height: 10.0),

            // زر الموافقة
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();

                  // FocusScope.of(context).unfocus(); // إخفاء لوحة المفاتيح
                  _showTransactionTypeDialog();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan,
                  onPrimary: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  elevation: 4,
                ),
                child: const Text(
                  'موافق',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),

        // قائمة الأسماء المقترحة
        if (matchingClients.isNotEmpty)
          Positioned(
            top: 45.0, // تحديد موقع القائمة بالنسبة لحقل الإدخال
            left: 16,
            right: 80,
            child: Container(
              constraints: const BoxConstraints(
                  maxHeight: 170), // الحد الأقصى لارتفاع القائمة
              decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: Colors.cyan, width: 3.0), // تحديد الحواف
                borderRadius: BorderRadius.circular(8.0), // زوايا مستديرة
              ),
              child: ListView.builder(
                itemCount: matchingClients.length,
                itemBuilder: (context, index) {
                  final client = matchingClients[index];
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 0.0,
                        ),
                        title: Text(
                          client['name'], // عرض اسم العميل
                          textAlign: TextAlign.right, // محاذاة النص إلى اليمين
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _nameController.text =
                                client['name']; // تحديث حقل النص
                            selectedClientId = client['id']; // تخزين ID العميل
                            matchingClients = []; // إخفاء القائمة بعد الاختيار
                          });
                        },
                      ),
                      // إضافة فاصل بين العناصر
                      if (index < matchingClients.length - 1)
                        const Divider(
                          color: Colors.cyan,
                          height: 0.0,
                          thickness: 1.7,
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildFieldRow({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.done,
    required void Function(String) onFieldSubmitted,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 10.0),
        Text(
          label,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            onFieldSubmitted: onFieldSubmitted,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan, width: 2.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan, width: 2.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              hintText: hint,
            ),
          ),
        ),
        const SizedBox(width: 16.0),
      ],
    );
  }

  Widget _buildInfoCell(Map<String, dynamic> transaction) {
    Color iconColor = transaction['type'] == 'إضافة'
        ? const Color(0xFFFF4134)
        : const Color(0xFF66EE6B);

    return IconButton(
      icon: Icon(
        Icons.info_sharp,
        color: iconColor,
        size: 35,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => _buildTransactionDetailsDialog(transaction),
        );
      },
    );
  }

  Widget _buildTransactionDetailsDialog(Map<String, dynamic> transaction) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
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
                'تفاصيل العملية',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 16.0),

            // جدول التفاصيل
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(7.5),
                  1: FlexColumnWidth(2.5),
                },
                border: TableBorder.all(
                  color: Colors.cyan,
                  width: 1.5,
                ),
                children: [
                  _buildInfoRow(
                      'الاسم', transaction['client_name'] ?? 'غير معروف'),
                  _buildInfoRow('المبلغ',
                      transaction['amount']?.toString() ?? 'غير معروف'),
                  _buildInfoRow(
                      'تفاصيل', transaction['details'] ?? 'غير معروف'),
                  _buildInfoRow('النوع', transaction['type'] ?? 'غير معروف'),
                  // _buildInfoRow('النوع', transaction['id'] ?? 'غير معروف'),
                  _buildInfoRow('التاريخ', transaction['date'] ?? 'غير معروف'),
                ],
              ),
            ),

            const SizedBox(height: 16.0),

            // الأزرار
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // حذف العملية
                    Navigator.of(context).pop();

                    _deleteTransaction(transaction);
                  },
                  icon: const Icon(Icons.delete, color: Colors.white),
                  label: const Text('حذف'),
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Colors.red, // لون الزر
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // تعديل العملية
                    _editTransaction(transaction);
                  },
                  icon: const Icon(Icons.edit, color: Colors.white),
                  label: const Text('تعديل'),
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Colors.blue, // لون الزر
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16.0),

            // زر الإغلاق
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'إغلاق',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteTransaction(Map<String, dynamic> transaction) async {
    // احصل على معرف العملية
    final int? transactionId = transaction['operation_id'];

    if (transactionId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('العملية المحددة غير صالحة للحذف'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      // احصل على المثيل
      final databaseHelper = DatabaseHelper();

      // استدعِ دالة الحذف باستخدام المثيل
      int rowsAffected = await databaseHelper.deleteOperation(transactionId);

      if (rowsAffected > 0) {
        _refreshTransactions(); // تحديث البيانات بعد الحذف

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم حذف العملية بنجاح'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('فشل في حذف العملية'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('حدث خطأ أثناء حذف العملية'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _editTransaction(Map<String, dynamic> transaction) {
    final TextEditingController amountController =
        TextEditingController(text: transaction['amount'].toString());
    final TextEditingController detailsController =
        TextEditingController(text: transaction['details']);
    String selectedType = transaction['type']; // النوع الحالي

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Dialog(
                backgroundColor: Colors.white, // خلفية النافذة بيضاء
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 10, // إضافة ظل للنافذة
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // العنوان بخلفية زرقاء
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                        ),
                        child: const Text(
                          'تعديل العملية',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      // فراغ
                      const SizedBox(height: 20.0),

                      // مربع بحواف زرقاء
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(color: Colors.blue, width: 2.0),
                            bottom: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            // حقل تعديل المبلغ
                            TextField(
                              controller: amountController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'المبلغ',
                                labelStyle: const TextStyle(color: Colors.blue),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20.0),

                            // حقل تعديل التفاصيل
                            TextField(
                              controller: detailsController,
                              decoration: InputDecoration(
                                labelText: 'التفاصيل',
                                labelStyle: const TextStyle(color: Colors.blue),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20.0),

                            // اختيار نوع العملية (مربع)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.2,
                                      child: Radio<String>(
                                        value: 'إضافة',
                                        groupValue: selectedType,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedType = value!;
                                          });
                                        },
                                        activeColor: Colors
                                            .blue, // لون المربع عند الاختيار
                                      ),
                                    ),
                                    const Text(
                                      'إضافة',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.2,
                                      child: Radio<String>(
                                        value: 'تسديد',
                                        groupValue: selectedType,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedType = value!;
                                          });
                                        },
                                        activeColor: Colors
                                            .blue, // لون المربع عند الاختيار
                                      ),
                                    ),
                                    const Text(
                                      'تسديد',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // مربع أسفل النافذة للأزرار
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                          ),
                        ),
                        child: Row(
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
                                    ),
                                  );
                                  return;
                                }

                                try {
                                  final databaseHelper = DatabaseHelper();
                                  int rowsAffected =
                                      await databaseHelper.updateOperation(
                                    transaction[
                                        'operation_id'], // نفس ID العملية
                                    double.parse(amountController.text),
                                    detailsController.text,
                                    selectedType,
                                  );

                                  if (rowsAffected > 0) {
                                    Navigator.of(context).pop();
                                    _refreshTransactions();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('تم تعديل العملية بنجاح'),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('فشل في تعديل العملية'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                } catch (error) {
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('حدث خطأ أثناء تعديل العملية'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue, // لون زر الحفظ
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              child: const Text(
                                'حفظ',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey, // لون زر الإلغاء
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              child: const Text(
                                'إلغاء',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
 */






// ====================================================
 */







/* 


class _AddTransactionPageState extends State<AddTransactionPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _amountFocusNode = FocusNode();
  final FocusNode _detailsFocusNode = FocusNode();
  String _transactionType = '';
  List<Map<String, dynamic>> _recentTransactions = [];
  int? selectedClientId; // ID العميل المختار
  List<Map<String, dynamic>> matchingClients = []; // قائمة الأسماء المطابقة

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _detailsController.dispose();
    _nameFocusNode.dispose();
    _amountFocusNode.dispose();
    _detailsFocusNode.dispose();
    super.dispose();
  }

  void _searchClients(String query) async {
    final results = await DatabaseHelper().searchClientsByName(query);
    setState(() {
      matchingClients = results;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchRecentTransactions();

    // تحريك المؤشر إلى نهاية النص عند التركيز على الحقل
    _nameFocusNode.addListener(() {
      if (_nameFocusNode.hasFocus) {
        _moveCursorToEnd(_nameController);
      }
    });

    _amountFocusNode.addListener(() {
      if (_amountFocusNode.hasFocus) {
        _moveCursorToEnd(_amountController);
      }
    });

    _detailsFocusNode.addListener(() {
      if (_detailsFocusNode.hasFocus) {
        _moveCursorToEnd(_detailsController);
      }
    });
  }

  void _moveCursorToEnd(TextEditingController controller) {
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
  }

  // جلب آخر 50 عمليات من قاعدة البيانات
  Future<void> _fetchRecentTransactions() async {
    final transactions = await DatabaseHelper().getLastTenOperationsWithNames();
    setState(() {
      _recentTransactions = transactions;
    });
  }

/*   @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFEEEBEB),
        appBar: AppBar(
          title: const Text(
            '  ادارة حسابات العملاء',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.home,
              size: 35,
              color: Color(0xFFF26157),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const MyApp(), // استبدل AddTransactionPage بالصفحة المستهدفة
                ),
              );
            },
          ),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.person,
                  size: 30,
                  color: Color.fromARGB(255, 76, 96, 245),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const AddDeletePage(), // استبدل AddTransactionPage بالصفحة المستهدفة
                    ),
                  );
                }),
            const SizedBox(width: 8),
            IconButton(
                icon: const Icon(Icons.search,
                    size: 30, color: Color.fromARGB(255, 106, 245, 111)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const SearchClientPage(), // استبدل AddTransactionPage بالصفحة المستهدفة
                    ),
                  );
                }),
            const SizedBox(width: 8),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(6.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildHighlightedBox(),
                const SizedBox(height: 8.0),
                // عنوان الجدول
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 40),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3.0),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.cyan,
                  ),
                  child: const Text(
                    'العمليات الاخيرة',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8.0),

                // تمت إزالة Expanded من هنا
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.cyan, width: 3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.cyan,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: const [
                            Expanded(
                              flex: 8, // نسبة 80%
                              child: Text(
                                'التفاصيل',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2, // نسبة 20%
                              child: Text(
                                'معلومات',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // تمت إزالة Expanded من هنا أيضًا
                      SizedBox(
                        height:
                            300, // حدد ارتفاعًا ثابتًا أو استخدم MediaQuery لتحديد ارتفاع ديناميكي
                        child: ListView.builder(
                          itemCount: _recentTransactions.length,
                          itemBuilder: (context, index) {
                            final transaction = _recentTransactions[index];

                            return Container(
                              decoration: BoxDecoration(
                                color: index % 2 == 0
                                    ? const Color(0xFFF1F1F1)
                                    : Colors.white,
                                border: const Border(
                                  bottom: BorderSide(
                                      color: Colors.cyan, width: 2.0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 8, // نسبة 80%
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.cyan, width: 2.0),
                                          right: BorderSide(
                                              color: Colors.cyan, width: 2.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                          horizontal: 2,
                                        ),
                                        child: Text(
                                          transaction['client_name'],
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontSize: 14.5,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // عمود معلومات
                                  Expanded(
                                    flex: 2, // نسبة 20%
                                    child: _buildInfoCell(transaction),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHighlightedBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.cyan, width: 2.0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // عنوان الصندوق
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: const BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.vertical(
                  // top: Radius.circular(8),
                  ),
            ),
            child: const Center(
              child: Text(
                'إضافة عملية',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),

          // النموذج
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // حقل الاسم مع القائمة
                _buildNameFieldWithSuggestions(),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
          const SizedBox(height: 6.0),
        ],
      ),
    );
  }

  Widget _buildNameFieldWithSuggestions() {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // حقل الاسم
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 10.0),
                const Text(
                  'الاسم :   ',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: TextFormField(
                    controller: _nameController,
                    focusNode: _nameFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_amountFocusNode);
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    ),
                    onChanged: (value) {
                      _searchClients(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال الاسم';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
              ],
            ),

            const SizedBox(height: 10.0),

            // الحقل الثاني: المبلغ
            _buildFieldRow(
              controller: _amountController,
              focusNode: _amountFocusNode,
              label: 'المبلغ :    ',
              hint: '',
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_detailsFocusNode);
              },
            ),

            const SizedBox(height: 10.0),

            // الحقل الثالث: التفاصيل
            _buildFieldRow(
              controller: _detailsController,
              focusNode: _detailsFocusNode,
              label: 'تفاصيل : ',
              hint: '',
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) {
                FocusScope.of(context).unfocus();
              },
            ),

            const SizedBox(height: 10.0),

            // زر الموافقة
            Center(
              child: ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus(); // إخفاء لوحة المفاتيح
                  _showTransactionTypeDialog();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan,
                  onPrimary: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  elevation: 4,
                ),
                child: const Text(
                  'موافق',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),

        // قائمة الأسماء المقترحة
        if (matchingClients.isNotEmpty)
          Positioned(
            top: 45.0, // تحديد موقع القائمة بالنسبة لحقل الإدخال
            left: 16,
            right: 80,
            child: Container(
              constraints: const BoxConstraints(
                  maxHeight: 170), // الحد الأقصى لارتفاع القائمة
              decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: Colors.cyan, width: 3.0), // تحديد الحواف
                borderRadius: BorderRadius.circular(8.0), // زوايا مستديرة
              ),
              child: ListView.builder(
                itemCount: matchingClients.length,
                itemBuilder: (context, index) {
                  final client = matchingClients[index];
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 0.0,
                        ),
                        title: Text(
                          client['name'], // عرض اسم العميل
                          textAlign: TextAlign.right, // محاذاة النص إلى اليمين
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _nameController.text =
                                client['name']; // تحديث حقل النص
                            selectedClientId = client['id']; // تخزين ID العميل
                            matchingClients = []; // إخفاء القائمة بعد الاختيار
                          });
                        },
                      ),
                      // إضافة فاصل بين العناصر
                      if (index < matchingClients.length - 1)
                        const Divider(
                          color: Colors.cyan,
                          height: 0.0,
                          thickness: 1.7,
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
      ],
    );
  }

  void _showTransactionTypeDialog() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save(); // حفظ القيم
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: const Color(0xFFEEEBEB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                    // 'تعديل بيانات عميل',
                    'اختر نوع العملية',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      // padding: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color(0xFFFF665B), width: 2.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'إضافة',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w800),
                          ),
                          Radio<String>(
                            value: 'إضافة',
                            activeColor: Colors.red,
                            groupValue: _transactionType,
                            onChanged: (value) {
                              setState(() {
                                _transactionType = value ?? '';
                              });
                              Navigator.pop(context);
                              _saveTransaction();
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color(0xFF70FF75), width: 2.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'تسديد',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w800),
                          ),
                          Radio<String>(
                            value: 'تسديد',
                            activeColor: const Color(0xFF70FF75),
                            groupValue: _transactionType,
                            onChanged: (value) {
                              setState(() {
                                _transactionType = value ?? '';
                              });
                              Navigator.pop(context);
                              _saveTransaction();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
              ],
            ),
            // mainAxisSize: MainAxisSize.min,
            // ),
          );
        },
      );
    }
  }
 */
//  ============================================================
//  ============================================================
//  ============================================================
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFEEEBEB),
        appBar: AppBar(
          title: const Text(
            '  ادارة حسابات العملاء',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.home,
              size: 35,
              color: Color(0xFFF26157),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const MyApp(), // استبدل AddTransactionPage بالصفحة المستهدفة
                ),
              );
            },
          ),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.person,
                  size: 30,
                  color: Color.fromARGB(255, 76, 96, 245),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const AddDeletePage(), // استبدل AddTransactionPage بالصفحة المستهدفة
                    ),
                  );
                }),
            const SizedBox(width: 8),
            IconButton(
                icon: const Icon(Icons.search,
                    size: 30, color: Color.fromARGB(255, 106, 245, 111)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const SearchClientPage(), // استبدل AddTransactionPage بالصفحة المستهدفة
                    ),
                  );
                }),
            const SizedBox(width: 8),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              // عنوان الجدول
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 40),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3.0),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.cyan,
                ),
                child: const Text(
                  'العمليات الاخيرة',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8.0),

              // الجدول
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.cyan, width: 3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.cyan,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: const [
                            Expanded(
                              flex: 8, // نسبة 80%
                              child: Text(
                                'التفاصيل',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2, // نسبة 20%
                              child: Text(
                                'معلومات',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _recentTransactions.length,
                          itemBuilder: (context, index) {
                            final transaction = _recentTransactions[index];

                            return Container(
                              decoration: BoxDecoration(
                                color: index % 2 == 0
                                    ? const Color(0xFFF1F1F1)
                                    : Colors.white,
                                border: const Border(
                                  bottom: BorderSide(
                                      color: Colors.cyan, width: 2.0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 8, // نسبة 80%
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.cyan, width: 2.0),
                                          right: BorderSide(
                                              color: Colors.cyan, width: 2.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                          horizontal: 2,
                                        ),
                                        child: Text(
                                          transaction['client_name'],
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontSize: 14.5,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // عمود معلومات
                                  Expanded(
                                    flex: 2, // نسبة 20%
                                    child: _buildInfoCell(transaction),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddOperationDialog();
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.cyan,
        ),
      ),
    );
  }

  void _showAddOperationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Dialog(
                backgroundColor:
                    const Color.fromARGB(255, 236, 232, 232), // خلفية النافذة بيضاء
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: SingleChildScrollView(
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
                          'اضافة العملية',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(color: Colors.cyan, width: 2.0),
                            bottom: BorderSide(color: Colors.cyan, width: 2.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            // فراغ
                            const SizedBox(height: 10.0),

                            // حقل الاسم
                            _buildNameFieldWithSuggestions(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildNameFieldWithSuggestions() {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // حقل الاسم
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // const SizedBox(width: 10.0),
                const Text(
                  'الاسم :   ',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
                ),
                // const SizedBox(width: 12.0),
                Expanded(
                  child: TextFormField(
                    controller: _nameController,
                    focusNode: _nameFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_amountFocusNode);
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    ),
                    onChanged: (value) {
                      _searchClients(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال الاسم';
                      }
                      return null;
                    },
                  ),
                ),
                // const SizedBox(width: 16.0),
              ],
            ),
            const SizedBox(height: 10.0),

            // حقل المبلغ
            _buildFieldRow(
              controller: _amountController,
              focusNode: _amountFocusNode,
              label: 'المبلغ :    ',
              hint: '',
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_detailsFocusNode);
              },
            ),
            const SizedBox(height: 10.0),

            // حقل التفاصيل
            _buildFieldRow(
              controller: _detailsController,
              focusNode: _detailsFocusNode,
              label: 'تفاصيل : ',
              hint: '',
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) {
                FocusScope.of(context).unfocus();
              },
            ),
            const SizedBox(height: 10.0),
            // اختيار نوع العملية
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _transactionType = 'إضافة';
                    });
                    _saveTransaction();
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                  ),
                  child: const Text('إضافة'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _transactionType = 'تسديد';
                    });
                    _saveTransaction();
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                  ),
                  child: const Text('تسديد'),
                ),
              ],
            ),
          ],
        ),

        // قائمة الأسماء المقترحة
        if (matchingClients.isNotEmpty)
          Positioned(
            top: 40.0, // تحديد موقع القائمة بالنسبة لحقل الإدخال
            left: 0,
            right: 60,
            child: Container(
              constraints: const BoxConstraints(
                  maxHeight: 170), // الحد الأقصى لارتفاع القائمة
              decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: Colors.cyan, width: 3.0), // تحديد الحواف
                borderRadius: BorderRadius.circular(8.0), // زوايا مستديرة
              ),
              child: ListView.builder(
                itemCount: matchingClients.length,
                itemBuilder: (context, index) {
                  final client = matchingClients[index];
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 0.0,
                        ),
                        title: Text(
                          client['name'], // عرض اسم العميل
                          textAlign: TextAlign.right, // محاذاة النص إلى اليمين
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _nameController.text =
                                client['name']; // تحديث حقل النص
                            selectedClientId = client['id']; // تخزين ID العميل
                            matchingClients = []; // إخفاء القائمة بعد الاختيار
                          });
                        },
                      ),
                      // إضافة فاصل بين العناصر
                      if (index < matchingClients.length - 1)
                        const Divider(
                          color: Colors.cyan,
                          height: 0.0,
                          thickness: 1.7,
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildFieldRow({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.done,
    required void Function(String) onFieldSubmitted,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // const SizedBox(width: 10.0),
        Text(
          label,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
        ),
        // const SizedBox(width: 12.0),
        Expanded(
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            onFieldSubmitted: onFieldSubmitted,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan, width: 2.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan, width: 2.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              hintText: hint,
            ),
          ),
        ),
        // const SizedBox(width: 16.0),
      ],
    );
  }

/* 
  Widget _buildNameFieldWithSuggestions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // حقل الاسم
        Row(
          children: [
            const Text(
              'الاسم :   ',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
            ),
            Expanded(
              child: TextFormField(
                controller: _nameController,
                focusNode: _nameFocusNode,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_amountFocusNode);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    _searchClients(value); // البحث عن الأسماء المشابهة
                  } else {
                    setState(() {
                      matchingClients =
                          []; // إخفاء القائمة إذا كان الحقل فارغًا
                    });
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال الاسم';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),

        // قائمة الأسماء المقترحة
        if (matchingClients.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.cyan, width: 2.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            height: 150, // تحديد ارتفاع ثابت للقائمة
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: matchingClients.length,
              itemBuilder: (context, index) {
                final client = matchingClients[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        client['name'],
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _nameController.text =
                              client['name']; // تحديث حقل النص
                          selectedClientId = client['id']; // تخزين ID العميل
                          matchingClients = []; // إخفاء القائمة بعد الاختيار
                        });
                      },
                    ),
                    if (index < matchingClients.length - 1)
                      const Divider(
                        color: Colors.cyan,
                        height: 1.0,
                        thickness: 1.0,
                      ),
                  ],
                );
              },
            ),
          ),
      ],
    );
  }
 */
//  ============================================================
//  ============================================================
//  ============================================================
  Future<void> _saveTransactionToDatabase() async {
    double? amount = double.tryParse(_amountController.text.trim());
    String details = _detailsController.text.trim();

    if (selectedClientId == null || amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى اختيار عميل صحيح ومبلغ أكبر من 0'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    await DatabaseHelper().insertOperation(
      selectedClientId!, // إرسال ID العميل
      amount,
      details,
      _transactionType,
    );

    _refreshTransactions();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم حفظ العملية بنجاح'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _saveTransaction() async {
    if (_transactionType.isNotEmpty) {
      final databaseHelper = DatabaseHelper();
      String trimmedName =
          _nameController.text.trim(); // استخدام النص مباشرة من وحدة التحكم

      // التحقق من وجود العميل
      bool clientExists = await databaseHelper.doesClientExist(trimmedName);

      if (!clientExists) {
        showDialog(
          context: context,
          builder: (context) {
            String phoneNumber = '';

            return StatefulBuilder(
              builder: (context, setState) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Dialog(
                      backgroundColor: const Color(0xFFEEEBEB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: SingleChildScrollView(
                          child: Container(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              decoration: const BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                              ),
                              child: const Text(
                                ' اضافة عميل جديد',
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
                              width: double.infinity,
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  const Text(
                                      'اسم العميل غير محفوظ. هل ترغب في حفظه؟'),
                                  const SizedBox(height: 16.0),
                                  TextField(
                                    textDirection: TextDirection.rtl,
                                    decoration: const InputDecoration(
                                      labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800),
                                      labelText: 'رقم الهاتف',
                                      // border: OutlineInputBorder(),
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.cyan),
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
                                    keyboardType: TextInputType.phone,
                                    onChanged: (value) {
                                      phoneNumber = value;
                                    },
                                  ),
                                  const SizedBox(height: 10.0),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 3,
                              color: Colors.cyan,
                            ),
                            const SizedBox(height: 18.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // إغلاق النافذة
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
                                  child: const Text(
                                    'إلغاء',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    if (phoneNumber.isNotEmpty) {
                                      await databaseHelper.insertCustomer(
                                          trimmedName, phoneNumber);

                                      Navigator.of(context).pop();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'تم حفظ العميل والعملية بنجاح'),
                                          backgroundColor: Colors.green,
                                        ),
                                      );

                                      // حفظ العملية بعد حفظ العميل
                                      await _saveTransactionToDatabase();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('يرجى إدخال رقم الهاتف'),
                                          backgroundColor: Colors.red,
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
                                  child: const Text(
                                    'حفظ',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10.0),
                          ],
                        ),
                      ))),
                );
              },
            );
          },
        );
      } else {
        // إذا كان العميل موجودًا، قم بحفظ العملية مباشرة
        await _saveTransactionToDatabase();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى اختيار نوع العملية')),
      );
    }
  }

  void _refreshTransactions() async {
    final databaseHelper = DatabaseHelper();
    final newTransactions =
        await databaseHelper.getLastTenOperationsWithNames();
    setState(() {
      _recentTransactions = newTransactions;
    });
  }

  TableRow _buildInfoRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCell(Map<String, dynamic> transaction) {
    Color iconColor = transaction['type'] == 'إضافة'
        ? const Color(0xFFFF4134)
        : const Color(0xFF66EE6B);

    return IconButton(
      icon: Icon(
        Icons.info_sharp,
        color: iconColor,
        size: 35,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => _buildTransactionDetailsDialog(transaction),
        );
      },
    );
  }

  Widget _buildTransactionDetailsDialog(Map<String, dynamic> transaction) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
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
                'تفاصيل العملية',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 16.0),

            // جدول التفاصيل
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(7.5),
                  1: FlexColumnWidth(2.5),
                },
                border: TableBorder.all(
                  color: Colors.cyan,
                  width: 1.5,
                ),
                children: [
                  _buildInfoRow(
                      'الاسم', transaction['client_name'] ?? 'غير معروف'),
                  _buildInfoRow('المبلغ',
                      transaction['amount']?.toString() ?? 'غير معروف'),
                  _buildInfoRow(
                      'تفاصيل', transaction['details'] ?? 'غير معروف'),
                  _buildInfoRow('النوع', transaction['type'] ?? 'غير معروف'),
                  // _buildInfoRow('النوع', transaction['id'] ?? 'غير معروف'),
                  _buildInfoRow('التاريخ', transaction['date'] ?? 'غير معروف'),
                ],
              ),
            ),

            const SizedBox(height: 16.0),

            // الأزرار
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // حذف العملية
                    Navigator.of(context).pop();

                    _deleteTransaction(transaction);
                  },
                  icon: const Icon(Icons.delete, color: Colors.white),
                  label: const Text('حذف'),
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Colors.red, // لون الزر
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // تعديل العملية
                    _editTransaction(transaction);
                  },
                  icon: const Icon(Icons.edit, color: Colors.white),
                  label: const Text('تعديل'),
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Colors.blue, // لون الزر
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16.0),

            // زر الإغلاق
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'إغلاق',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteTransaction(Map<String, dynamic> transaction) async {
    // احصل على معرف العملية
    final int? transactionId = transaction['operation_id'];

    if (transactionId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('العملية المحددة غير صالحة للحذف'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      // احصل على المثيل
      final databaseHelper = DatabaseHelper();

      // استدعِ دالة الحذف باستخدام المثيل
      int rowsAffected = await databaseHelper.deleteOperation(transactionId);

      if (rowsAffected > 0) {
        _refreshTransactions(); // تحديث البيانات بعد الحذف

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم حذف العملية بنجاح'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('فشل في حذف العملية'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('حدث خطأ أثناء حذف العملية'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _editTransaction(Map<String, dynamic> transaction) {
    final TextEditingController amountController =
        TextEditingController(text: transaction['amount'].toString());
    final TextEditingController detailsController =
        TextEditingController(text: transaction['details']);
    String selectedType = transaction['type']; // النوع الحالي

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Dialog(
                backgroundColor: Colors.white, // خلفية النافذة بيضاء
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 10, // إضافة ظل للنافذة
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // العنوان بخلفية زرقاء
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                        ),
                        child: const Text(
                          'تعديل العملية',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      // فراغ
                      const SizedBox(height: 20.0),

                      // مربع بحواف زرقاء
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(color: Colors.blue, width: 2.0),
                            bottom: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            // حقل تعديل المبلغ
                            TextField(
                              controller: amountController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'المبلغ',
                                labelStyle: const TextStyle(color: Colors.blue),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20.0),

                            // حقل تعديل التفاصيل
                            TextField(
                              controller: detailsController,
                              decoration: InputDecoration(
                                labelText: 'التفاصيل',
                                labelStyle: const TextStyle(color: Colors.blue),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20.0),

                            // اختيار نوع العملية (مربع)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.2,
                                      child: Radio<String>(
                                        value: 'إضافة',
                                        groupValue: selectedType,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedType = value!;
                                          });
                                        },
                                        activeColor: Colors
                                            .blue, // لون المربع عند الاختيار
                                      ),
                                    ),
                                    const Text(
                                      'إضافة',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.2,
                                      child: Radio<String>(
                                        value: 'تسديد',
                                        groupValue: selectedType,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedType = value!;
                                          });
                                        },
                                        activeColor: Colors
                                            .blue, // لون المربع عند الاختيار
                                      ),
                                    ),
                                    const Text(
                                      'تسديد',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // مربع أسفل النافذة للأزرار
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                          ),
                        ),
                        child: Row(
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
                                    ),
                                  );
                                  return;
                                }

                                try {
                                  final databaseHelper = DatabaseHelper();
                                  int rowsAffected =
                                      await databaseHelper.updateOperation(
                                    transaction[
                                        'operation_id'], // نفس ID العملية
                                    double.parse(amountController.text),
                                    detailsController.text,
                                    selectedType,
                                  );

                                  if (rowsAffected > 0) {
                                    Navigator.of(context).pop();
                                    _refreshTransactions();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('تم تعديل العملية بنجاح'),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('فشل في تعديل العملية'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                } catch (error) {
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('حدث خطأ أثناء تعديل العملية'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue, // لون زر الحفظ
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              child: const Text(
                                'حفظ',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey, // لون زر الإلغاء
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              child: const Text(
                                'إلغاء',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
 



 */


// import 'package:flutter/material.dart';
// import '../database/database_helper.dart';
// import 'add_delete.dart';
// import 'search.dart';
// import '../main.dart';
// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, use_build_context_synchronously, duplicate_ignore, deprecated_member_use
/* 
class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddTransactionPageState createState() => _AddTransactionPageState();
}
 */
/* 
class _AddTransactionPageState extends State<AddTransactionPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _amountFocusNode = FocusNode();
  final FocusNode _detailsFocusNode = FocusNode();

  String _transactionType = '';
  List<Map<String, dynamic>> _recentTransactions = [];
  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _detailsController.dispose();
    _nameFocusNode.dispose();
    _amountFocusNode.dispose();
    _detailsFocusNode.dispose();
    super.dispose();
  }

  int? selectedClientId; // ID العميل المختار
  List<Map<String, dynamic>> matchingClients = []; // قائمة الأسماء المطابقة

  void _searchClients(String query) async {
    final results = await DatabaseHelper().searchClientsByName(query);
    setState(() {
      matchingClients = results;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchRecentTransactions();

    // تحريك المؤشر إلى نهاية النص عند التركيز على الحقل
    _nameFocusNode.addListener(() {
      if (_nameFocusNode.hasFocus) {
        _moveCursorToEnd(_nameController);
      }
    });

    _amountFocusNode.addListener(() {
      if (_amountFocusNode.hasFocus) {
        _moveCursorToEnd(_amountController);
      }
    });

    _detailsFocusNode.addListener(() {
      if (_detailsFocusNode.hasFocus) {
        _moveCursorToEnd(_detailsController);
      }
    });
  }

  void _moveCursorToEnd(TextEditingController controller) {
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
  }

  // جلب آخر 50 عمليات من قاعدة البيانات
  Future<void> _fetchRecentTransactions() async {
    final transactions = await DatabaseHelper().getLastTenOperationsWithNames();
    setState(() {
      _recentTransactions = transactions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFEEEBEB),
        appBar: AppBar(
          title: const Text(
            '  ادارة حسابات العملاء',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.home,
              size: 35,
              color: Color(0xFFF26157),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const MyApp(), // استبدل AddTransactionPage بالصفحة المستهدفة
                ),
              );
            },
          ),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.person,
                  size: 30,
                  color: Color.fromARGB(255, 76, 96, 245),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const AddDeletePage(), // استبدل AddTransactionPage بالصفحة المستهدفة
                    ),
                  );
                }),
            const SizedBox(width: 8),
            IconButton(
                icon: const Icon(Icons.search,
                    size: 30, color: Color.fromARGB(255, 106, 245, 111)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const SearchClientPage(), // استبدل AddTransactionPage بالصفحة المستهدفة
                    ),
                  );
                }),
            const SizedBox(width: 8),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(6.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildHighlightedBox(),
                const SizedBox(height: 8.0),
                // عنوان الجدول
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 40),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3.0),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.cyan,
                  ),
                  child: const Text(
                    'العمليات الاخيرة',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8.0),

                // تمت إزالة Expanded من هنا
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.cyan, width: 3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.cyan,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: const [
                            Expanded(
                              flex: 8, // نسبة 80%
                              child: Text(
                                'التفاصيل',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2, // نسبة 20%
                              child: Text(
                                'معلومات',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // تمت إزالة Expanded من هنا أيضًا
                      SizedBox(
                        height:
                            300, // حدد ارتفاعًا ثابتًا أو استخدم MediaQuery لتحديد ارتفاع ديناميكي
                        child: ListView.builder(
                          itemCount: _recentTransactions.length,
                          itemBuilder: (context, index) {
                            final transaction = _recentTransactions[index];

                            return Container(
                              decoration: BoxDecoration(
                                color: index % 2 == 0
                                    ? const Color(0xFFF1F1F1)
                                    : Colors.white,
                                border: const Border(
                                  bottom: BorderSide(
                                      color: Colors.cyan, width: 2.0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 8, // نسبة 80%
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.cyan, width: 2.0),
                                          right: BorderSide(
                                              color: Colors.cyan, width: 2.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                          horizontal: 2,
                                        ),
                                        child: Text(
                                          transaction['client_name'],
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontSize: 14.5,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // عمود معلومات
                                  Expanded(
                                    flex: 2, // نسبة 20%
                                    child: _buildInfoCell(transaction),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// ===============================
  //  دالة صندوق اضافة   عملية
// ===============================
  Widget _buildHighlightedBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.cyan, width: 2.0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // عنوان الصندوق
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: const BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.vertical(
                  // top: Radius.circular(8),
                  ),
            ),
            child: const Center(
              child: Text(
                'إضافة عملية',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),

          // النموذج
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // حقل الاسم مع القائمة
                _buildNameFieldWithSuggestions(),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
          const SizedBox(height: 6.0),
        ],
      ),
    );
  }

  // نافذة اختيار نوع العملية
  void _showTransactionTypeDialog() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save(); // حفظ القيم
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: const Color(0xFFEEEBEB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                    // 'تعديل بيانات عميل',
                    'اختر نوع العملية',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      // padding: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color(0xFFFF665B), width: 2.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'إضافة',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w800),
                          ),
                          Radio<String>(
                            value: 'إضافة',
                            activeColor: Colors.red,
                            groupValue: _transactionType,
                            onChanged: (value) {
                              setState(() {
                                _transactionType = value ?? '';
                              });
                              Navigator.pop(context);
                              _saveTransaction();
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color(0xFF70FF75), width: 2.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'تسديد',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w800),
                          ),
                          Radio<String>(
                            value: 'تسديد',
                            activeColor: const Color(0xFF70FF75),
                            groupValue: _transactionType,
                            onChanged: (value) {
                              setState(() {
                                _transactionType = value ?? '';
                              });
                              Navigator.pop(context);
                              _saveTransaction();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
              ],
            ),
            // mainAxisSize: MainAxisSize.min,
            // ),
          );
        },
      );
    }
  }

  Future<void> _saveTransactionToDatabase() async {
    double? amount = double.tryParse(_amountController.text.trim());
    String details = _detailsController.text.trim();

    if (selectedClientId == null || amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى اختيار عميل صحيح ومبلغ أكبر من 0'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    await DatabaseHelper().insertOperation(
      selectedClientId!, // إرسال ID العميل
      amount,
      details,
      _transactionType,
    );

    _refreshTransactions();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم حفظ العملية بنجاح'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _saveTransaction() async {
    if (_transactionType.isNotEmpty) {
      final databaseHelper = DatabaseHelper();
      String trimmedName =
          _nameController.text.trim(); // استخدام النص مباشرة من وحدة التحكم

      // التحقق من وجود العميل
      bool clientExists = await databaseHelper.doesClientExist(trimmedName);

      if (!clientExists) {
        showDialog(
          context: context,
          builder: (context) {
            String phoneNumber = '';

            return StatefulBuilder(
              builder: (context, setState) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Dialog(
                      backgroundColor: const Color(0xFFEEEBEB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: SingleChildScrollView(
                          child: Container(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              decoration: const BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                              ),
                              child: const Text(
                                ' اضافة عميل جديد',
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
                              width: double.infinity,
                              // padding:
                              // const EdgeInsets.symmetric(vertical: 12.0),
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  const Text(
                                      'اسم العميل غير محفوظ. هل ترغب في حفظه؟'),
                                  const SizedBox(height: 16.0),
                                  TextField(
                                    textDirection: TextDirection.rtl,
                                    decoration: const InputDecoration(
                                      labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800),
                                      labelText: 'رقم الهاتف',
                                      // border: OutlineInputBorder(),
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.cyan),
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
                                    keyboardType: TextInputType.phone,
                                    onChanged: (value) {
                                      phoneNumber = value;
                                    },
                                  ),
                                  const SizedBox(height: 10.0),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 3,
                              color: Colors.cyan,
                            ),
                            const SizedBox(height: 18.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // إغلاق النافذة
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
                                  child: const Text(
                                    'إلغاء',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    if (phoneNumber.isNotEmpty) {
                                      await databaseHelper.insertCustomer(
                                          trimmedName, phoneNumber);

                                      Navigator.of(context).pop();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'تم حفظ العميل والعملية بنجاح'),
                                          backgroundColor: Colors.green,
                                        ),
                                      );

                                      // حفظ العملية بعد حفظ العميل
                                      await _saveTransactionToDatabase();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('يرجى إدخال رقم الهاتف'),
                                          backgroundColor: Colors.red,
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
                                  child: const Text(
                                    'حفظ',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10.0),
                          ],
                        ),
                      ))),
                );
              },
            );
          },
        );
      } else {
        // إذا كان العميل موجودًا، قم بحفظ العملية مباشرة
        await _saveTransactionToDatabase();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى اختيار نوع العملية')),
      );
    }
  }

// ========================================
// دوال التعامل مع الحذف والتعديل
// ========================================
  void _refreshTransactions() async {
    final databaseHelper = DatabaseHelper();
    final newTransactions =
        await databaseHelper.getLastTenOperationsWithNames();
    setState(() {
      _recentTransactions = newTransactions;
    });
  }

// دالة بناء صف لكل معلومة
  TableRow _buildInfoRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
// ============================================
  // حفظ العملية في قاعدة البيانات
// ============================================

  Widget _buildNameFieldWithSuggestions() {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // حقل الاسم
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 10.0),
                const Text(
                  'الاسم :   ',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: TextFormField(
                    controller: _nameController,
                    focusNode: _nameFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_amountFocusNode);
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    ),
                    onChanged: (value) {
                      _searchClients(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال الاسم';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
              ],
            ),

            const SizedBox(height: 10.0),

            // الحقل الثاني: المبلغ
            _buildFieldRow(
              controller: _amountController,
              focusNode: _amountFocusNode,
              label: 'المبلغ :    ',
              hint: '',
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_detailsFocusNode);
              },
            ),

            const SizedBox(height: 10.0),

            // الحقل الثالث: التفاصيل
            _buildFieldRow(
              controller: _detailsController,
              focusNode: _detailsFocusNode,
              label: 'تفاصيل : ',
              hint: '',
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) {
                FocusScope.of(context).unfocus();
              },
            ),

            const SizedBox(height: 10.0),

            // زر الموافقة
            Center(
              child: ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus(); // إخفاء لوحة المفاتيح
                  _showTransactionTypeDialog();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan,
                  onPrimary: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  elevation: 4,
                ),
                child: const Text(
                  'موافق',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),

        // قائمة الأسماء المقترحة
        /*        if (_suggestedNames.isNotEmpty)
          Positioned(
            top: 45.0,
            left: 16,
            right: 80,
            child: Container(
              constraints: const BoxConstraints(maxHeight: 170),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.cyan, width: 3.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListView.builder(
                itemCount: _suggestedNames.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 0.0,
                        ),
                        title: Text(
                          _suggestedNames[index],
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w800),
                        ),
                        onTap: () {
                          setState(() {
                            _nameController.text = _suggestedNames[index];
                            _suggestedNames = [];
                          });
                        },
                      ),
                      if (index < _suggestedNames.length - 1)
                        const Divider(
                          color: Colors.cyan,
                          height: 0.0,
                          // indent: .0,
                          thickness: 1.7,
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
    */

        // if (matchingClients.isNotEmpty)
        //   ListView.builder(
        //     shrinkWrap: true,
        //     itemCount: matchingClients.length,
        //     itemBuilder: (context, index) {
        //       final client = matchingClients[index];
        //       return ListTile(
        //         title: Text(client['name']),
        //         onTap: () {
        //           setState(() {
        //             _nameController.text = client['name'];
        //             selectedClientId = client['id']; // تخزين ID العميل
        //             matchingClients = []; // إخفاء القائمة بعد الاختيار
        //           });
        //         },
        //       );
        //     },
        //   ),
        if (matchingClients.isNotEmpty)
          Positioned(
            top: 45.0, // تحديد موقع القائمة بالنسبة لحقل الإدخال
            left: 16,
            right: 80,
            child: Container(
              constraints: const BoxConstraints(
                  maxHeight: 170), // الحد الأقصى لارتفاع القائمة
              decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: Colors.cyan, width: 3.0), // تحديد الحواف
                borderRadius: BorderRadius.circular(8.0), // زوايا مستديرة
              ),
              child: ListView.builder(
                itemCount: matchingClients.length,
                itemBuilder: (context, index) {
                  final client = matchingClients[index];
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 0.0,
                        ),
                        title: Text(
                          client['name'], // عرض اسم العميل
                          textAlign: TextAlign.right, // محاذاة النص إلى اليمين
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _nameController.text =
                                client['name']; // تحديث حقل النص
                            selectedClientId = client['id']; // تخزين ID العميل
                            matchingClients = []; // إخفاء القائمة بعد الاختيار
                          });
                        },
                      ),
                      // إضافة فاصل بين العناصر
                      if (index < matchingClients.length - 1)
                        const Divider(
                          color: Colors.cyan,
                          height: 0.0,
                          thickness: 1.7,
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildFieldRow({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.done,
    required void Function(String) onFieldSubmitted,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 10.0),
        Text(
          label,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            onFieldSubmitted: onFieldSubmitted,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan, width: 2.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan, width: 2.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              hintText: hint,
            ),
          ),
        ),
        const SizedBox(width: 16.0),
      ],
    );
  }

// =====================================

  Widget _buildInfoCell(Map<String, dynamic> transaction) {
    Color iconColor = transaction['type'] == 'إضافة'
        ? const Color(0xFFFF4134)
        : const Color(0xFF66EE6B);

    return IconButton(
      icon: Icon(
        Icons.info_sharp,
        color: iconColor,
        size: 35,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => _buildTransactionDetailsDialog(transaction),
        );
      },
    );
  }

  Widget _buildTransactionDetailsDialog(Map<String, dynamic> transaction) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
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
                'تفاصيل العملية',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 16.0),

            // جدول التفاصيل
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(7.5),
                  1: FlexColumnWidth(2.5),
                },
                border: TableBorder.all(
                  color: Colors.cyan,
                  width: 1.5,
                ),
                children: [
                  _buildInfoRow(
                      'الاسم', transaction['client_name'] ?? 'غير معروف'),
                  _buildInfoRow('المبلغ',
                      transaction['amount']?.toString() ?? 'غير معروف'),
                  _buildInfoRow(
                      'تفاصيل', transaction['details'] ?? 'غير معروف'),
                  _buildInfoRow('النوع', transaction['type'] ?? 'غير معروف'),
                  // _buildInfoRow('النوع', transaction['id'] ?? 'غير معروف'),
                  _buildInfoRow('التاريخ', transaction['date'] ?? 'غير معروف'),
                ],
              ),
            ),

            const SizedBox(height: 16.0),

            // الأزرار
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // حذف العملية
                    Navigator.of(context).pop();

                    _deleteTransaction(transaction);
                  },
                  icon: const Icon(Icons.delete, color: Colors.white),
                  label: const Text('حذف'),
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Colors.red, // لون الزر
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // تعديل العملية
                    _editTransaction(transaction);
                  },
                  icon: const Icon(Icons.edit, color: Colors.white),
                  label: const Text('تعديل'),
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Colors.blue, // لون الزر
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16.0),

            // زر الإغلاق
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'إغلاق',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteTransaction(Map<String, dynamic> transaction) async {
    // احصل على معرف العملية
    final int? transactionId = transaction['operation_id'];

    if (transactionId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('العملية المحددة غير صالحة للحذف'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      // احصل على المثيل
      final databaseHelper = DatabaseHelper();

      // استدعِ دالة الحذف باستخدام المثيل
      int rowsAffected = await databaseHelper.deleteOperation(transactionId);

      if (rowsAffected > 0) {
        _refreshTransactions(); // تحديث البيانات بعد الحذف

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم حذف العملية بنجاح'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('فشل في حذف العملية'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('حدث خطأ أثناء حذف العملية'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _editTransaction(Map<String, dynamic> transaction) {
    final TextEditingController amountController =
        TextEditingController(text: transaction['amount'].toString());
    final TextEditingController detailsController =
        TextEditingController(text: transaction['details']);
    String selectedType = transaction['type']; // النوع الحالي

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Dialog(
                backgroundColor: Colors.white, // خلفية النافذة بيضاء
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 10, // إضافة ظل للنافذة
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // العنوان بخلفية زرقاء
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                        ),
                        child: const Text(
                          'تعديل العملية',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      // فراغ
                      const SizedBox(height: 20.0),

                      // مربع بحواف زرقاء
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(color: Colors.blue, width: 2.0),
                            bottom: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            // حقل تعديل المبلغ
                            TextField(
                              controller: amountController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'المبلغ',
                                labelStyle: const TextStyle(color: Colors.blue),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20.0),

                            // حقل تعديل التفاصيل
                            TextField(
                              controller: detailsController,
                              decoration: InputDecoration(
                                labelText: 'التفاصيل',
                                labelStyle: const TextStyle(color: Colors.blue),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20.0),

                            // اختيار نوع العملية (مربع)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.2,
                                      child: Radio<String>(
                                        value: 'إضافة',
                                        groupValue: selectedType,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedType = value!;
                                          });
                                        },
                                        activeColor: Colors
                                            .blue, // لون المربع عند الاختيار
                                      ),
                                    ),
                                    const Text(
                                      'إضافة',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.2,
                                      child: Radio<String>(
                                        value: 'تسديد',
                                        groupValue: selectedType,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedType = value!;
                                          });
                                        },
                                        activeColor: Colors
                                            .blue, // لون المربع عند الاختيار
                                      ),
                                    ),
                                    const Text(
                                      'تسديد',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // مربع أسفل النافذة للأزرار
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                          ),
                        ),
                        child: Row(
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
                                    ),
                                  );
                                  return;
                                }

                                try {
                                  // print('Attempting to update operation: ID=${transaction['operation_id']}, '
                                  //     'Amount=${amountController.text}, Details=${detailsController.text}, '
                                  //     'Type=$selectedType');
                                  // print('===================================');
                                  final databaseHelper = DatabaseHelper();
                                  int rowsAffected =
                                      await databaseHelper.updateOperation(
                                    transaction[
                                        'operation_id'], // نفس ID العملية
                                    double.parse(amountController.text),
                                    detailsController.text,
                                    selectedType,
                                  );

                                  if (rowsAffected > 0) {
                                    Navigator.of(context).pop();
                                    _refreshTransactions();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('تم تعديل العملية بنجاح'),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('فشل في تعديل العملية'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                } catch (error) {
                                  // print('Error occurred while updating operation: $error');
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('حدث خطأ أثناء تعديل العملية'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue, // لون زر الحفظ
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              child: const Text(
                                'حفظ',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey, // لون زر الإلغاء
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              child: const Text(
                                'إلغاء',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
 */
/* class _AddTransactionPageState extends State<AddTransactionPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _amountFocusNode = FocusNode();
  final FocusNode _detailsFocusNode = FocusNode();
  String _transactionType = '';
  List<Map<String, dynamic>> _recentTransactions = [];
  int? selectedClientId; // ID العميل المختار
  List<Map<String, dynamic>> matchingClients = []; // قائمة الأسماء المطابقة

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _detailsController.dispose();
    _nameFocusNode.dispose();
    _amountFocusNode.dispose();
    _detailsFocusNode.dispose();
    super.dispose();
  }

  void _searchClients(String query) async {
    final results = await DatabaseHelper().searchClientsByName(query);
    setState(() {
      matchingClients = results;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchRecentTransactions();

    // تحريك المؤشر إلى نهاية النص عند التركيز على الحقل
    _nameFocusNode.addListener(() {
      if (_nameFocusNode.hasFocus) {
        _moveCursorToEnd(_nameController);
      }
    });

    _amountFocusNode.addListener(() {
      if (_amountFocusNode.hasFocus) {
        _moveCursorToEnd(_amountController);
      }
    });

    _detailsFocusNode.addListener(() {
      if (_detailsFocusNode.hasFocus) {
        _moveCursorToEnd(_detailsController);
      }
    });
  }

  void _moveCursorToEnd(TextEditingController controller) {
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
  }

  // جلب آخر 50 عمليات من قاعدة البيانات
  Future<void> _fetchRecentTransactions() async {
    final transactions = await DatabaseHelper().getLastTenOperationsWithNames();
    setState(() {
      _recentTransactions = transactions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFEEEBEB),
        appBar: AppBar(
          title: const Text(
            '  ادارة حسابات العملاء',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.home,
              size: 35,
              color: Color(0xFFF26157),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const MyApp(), // استبدل AddTransactionPage بالصفحة المستهدفة
                ),
              );
            },
          ),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.person,
                  size: 30,
                  color: Color.fromARGB(255, 76, 96, 245),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const AddDeletePage(), // استبدل AddTransactionPage بالصفحة المستهدفة
                    ),
                  );
                }),
            const SizedBox(width: 8),
            IconButton(
                icon: const Icon(Icons.search,
                    size: 30, color: Color.fromARGB(255, 106, 245, 111)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const SearchClientPage(), // استبدل AddTransactionPage بالصفحة المستهدفة
                    ),
                  );
                }),
            const SizedBox(width: 8),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(6.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildHighlightedBox(),
                const SizedBox(height: 8.0),
                // عنوان الجدول
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 40),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3.0),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.cyan,
                  ),
                  child: const Text(
                    'العمليات الاخيرة',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8.0),

                // تمت إزالة Expanded من هنا
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.cyan, width: 3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.cyan,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: const [
                            Expanded(
                              flex: 8, // نسبة 80%
                              child: Text(
                                'التفاصيل',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2, // نسبة 20%
                              child: Text(
                                'معلومات',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // تمت إزالة Expanded من هنا أيضًا
                      SizedBox(
                        height:
                            300, // حدد ارتفاعًا ثابتًا أو استخدم MediaQuery لتحديد ارتفاع ديناميكي
                        child: ListView.builder(
                          itemCount: _recentTransactions.length,
                          itemBuilder: (context, index) {
                            final transaction = _recentTransactions[index];

                            return Container(
                              decoration: BoxDecoration(
                                color: index % 2 == 0
                                    ? const Color(0xFFF1F1F1)
                                    : Colors.white,
                                border: const Border(
                                  bottom: BorderSide(
                                      color: Colors.cyan, width: 2.0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 8, // نسبة 80%
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.cyan, width: 2.0),
                                          right: BorderSide(
                                              color: Colors.cyan, width: 2.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                          horizontal: 2,
                                        ),
                                        child: Text(
                                          transaction['client_name'],
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontSize: 14.5,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // عمود معلومات
                                  Expanded(
                                    flex: 2, // نسبة 20%
                                    child: _buildInfoCell(transaction),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddTransactionDialog();
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.cyan,
        ),
      ),
    );
  }

  void _showAddTransactionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text('إضافة عملية'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildNameFieldWithSuggestions(),
                  const SizedBox(height: 10.0),
                  _buildFieldRow(
                    controller: _amountController,
                    focusNode: _amountFocusNode,
                    label: 'المبلغ :    ',
                    hint: '',
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_detailsFocusNode);
                    },
                  ),
                  const SizedBox(height: 10.0),
                  _buildFieldRow(
                    controller: _detailsController,
                    focusNode: _detailsFocusNode,
                    label: 'تفاصيل : ',
                    hint: '',
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).unfocus();
                    },
                  ),
                  const SizedBox(height: 10.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus(); // إخفاء لوحة المفاتيح
                        _showTransactionTypeDialog();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.cyan,
                        onPrimary: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        elevation: 4,
                      ),
                      child: const Text(
                        'موافق',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // باقي الدوال والأكواد...
  Widget _buildHighlightedBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.cyan, width: 2.0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // عنوان الصندوق
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: const BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.vertical(
                  // top: Radius.circular(8),
                  ),
            ),
            child: const Center(
              child: Text(
                'إضافة عملية',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),

          // النموذج
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // حقل الاسم مع القائمة
                _buildNameFieldWithSuggestions(),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
          const SizedBox(height: 6.0),
        ],
      ),
    );
  }

  void _showTransactionTypeDialog() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save(); // حفظ القيم
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: const Color(0xFFEEEBEB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                    // 'تعديل بيانات عميل',
                    'اختر نوع العملية',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      // padding: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color(0xFFFF665B), width: 2.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'إضافة',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w800),
                          ),
                          Radio<String>(
                            value: 'إضافة',
                            activeColor: Colors.red,
                            groupValue: _transactionType,
                            onChanged: (value) {
                              setState(() {
                                _transactionType = value ?? '';
                              });
                              Navigator.pop(context);
                              _saveTransaction();
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color(0xFF70FF75), width: 2.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'تسديد',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w800),
                          ),
                          Radio<String>(
                            value: 'تسديد',
                            activeColor: const Color(0xFF70FF75),
                            groupValue: _transactionType,
                            onChanged: (value) {
                              setState(() {
                                _transactionType = value ?? '';
                              });
                              Navigator.pop(context);
                              _saveTransaction();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
              ],
            ),
            // mainAxisSize: MainAxisSize.min,
            // ),
          );
        },
      );
    }
  }

  Future<void> _saveTransactionToDatabase() async {
    double? amount = double.tryParse(_amountController.text.trim());
    String details = _detailsController.text.trim();

    if (selectedClientId == null || amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى اختيار عميل صحيح ومبلغ أكبر من 0'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    await DatabaseHelper().insertOperation(
      selectedClientId!, // إرسال ID العميل
      amount,
      details,
      _transactionType,
    );

    _refreshTransactions();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم حفظ العملية بنجاح'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _saveTransaction() async {
    if (_transactionType.isNotEmpty) {
      final databaseHelper = DatabaseHelper();
      String trimmedName =
          _nameController.text.trim(); // استخدام النص مباشرة من وحدة التحكم

      // التحقق من وجود العميل
      bool clientExists = await databaseHelper.doesClientExist(trimmedName);

      if (!clientExists) {
        showDialog(
          context: context,
          builder: (context) {
            String phoneNumber = '';

            return StatefulBuilder(
              builder: (context, setState) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Dialog(
                      backgroundColor: const Color(0xFFEEEBEB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: SingleChildScrollView(
                          child: Container(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              decoration: const BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                              ),
                              child: const Text(
                                ' اضافة عميل جديد',
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
                              width: double.infinity,
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  const Text(
                                      'اسم العميل غير محفوظ. هل ترغب في حفظه؟'),
                                  const SizedBox(height: 16.0),
                                  TextField(
                                    textDirection: TextDirection.rtl,
                                    decoration: const InputDecoration(
                                      labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800),
                                      labelText: 'رقم الهاتف',
                                      // border: OutlineInputBorder(),
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.cyan),
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
                                    keyboardType: TextInputType.phone,
                                    onChanged: (value) {
                                      phoneNumber = value;
                                    },
                                  ),
                                  const SizedBox(height: 10.0),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 3,
                              color: Colors.cyan,
                            ),
                            const SizedBox(height: 18.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // إغلاق النافذة
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
                                  child: const Text(
                                    'إلغاء',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    if (phoneNumber.isNotEmpty) {
                                      await databaseHelper.insertCustomer(
                                          trimmedName, phoneNumber);

                                      Navigator.of(context).pop();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'تم حفظ العميل والعملية بنجاح'),
                                          backgroundColor: Colors.green,
                                        ),
                                      );

                                      // حفظ العملية بعد حفظ العميل
                                      await _saveTransactionToDatabase();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('يرجى إدخال رقم الهاتف'),
                                          backgroundColor: Colors.red,
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
                                  child: const Text(
                                    'حفظ',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10.0),
                          ],
                        ),
                      ))),
                );
              },
            );
          },
        );
      } else {
        // إذا كان العميل موجودًا، قم بحفظ العملية مباشرة
        await _saveTransactionToDatabase();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى اختيار نوع العملية')),
      );
    }
  }

  void _refreshTransactions() async {
    final databaseHelper = DatabaseHelper();
    final newTransactions =
        await databaseHelper.getLastTenOperationsWithNames();
    setState(() {
      _recentTransactions = newTransactions;
    });
  }

  TableRow _buildInfoRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildNameFieldWithSuggestions() {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // حقل الاسم
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 10.0),
                const Text(
                  'الاسم :   ',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: TextFormField(
                    controller: _nameController,
                    focusNode: _nameFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_amountFocusNode);
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    ),
                    onChanged: (value) {
                      _searchClients(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال الاسم';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
              ],
            ),

            const SizedBox(height: 10.0),

            // الحقل الثاني: المبلغ
            _buildFieldRow(
              controller: _amountController,
              focusNode: _amountFocusNode,
              label: 'المبلغ :    ',
              hint: '',
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_detailsFocusNode);
              },
            ),

            const SizedBox(height: 10.0),

            // الحقل الثالث: التفاصيل
            _buildFieldRow(
              controller: _detailsController,
              focusNode: _detailsFocusNode,
              label: 'تفاصيل : ',
              hint: '',
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) {
                FocusScope.of(context).unfocus();
              },
            ),

            const SizedBox(height: 10.0),

            // زر الموافقة
            Center(
              child: ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus(); // إخفاء لوحة المفاتيح
                  _showTransactionTypeDialog();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan,
                  onPrimary: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  elevation: 4,
                ),
                child: const Text(
                  'موافق',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),

        // قائمة الأسماء المقترحة
        if (matchingClients.isNotEmpty)
          Positioned(
            top: 45.0, // تحديد موقع القائمة بالنسبة لحقل الإدخال
            left: 16,
            right: 80,
            child: Container(
              constraints: const BoxConstraints(
                  maxHeight: 170), // الحد الأقصى لارتفاع القائمة
              decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: Colors.cyan, width: 3.0), // تحديد الحواف
                borderRadius: BorderRadius.circular(8.0), // زوايا مستديرة
              ),
              child: ListView.builder(
                itemCount: matchingClients.length,
                itemBuilder: (context, index) {
                  final client = matchingClients[index];
                  return
                   Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 0.0,
                        ),
                        title: Text(
                          client['name'], // عرض اسم العميل
                          textAlign: TextAlign.right, // محاذاة النص إلى اليمين
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _nameController.text =
                                client['name']; // تحديث حقل النص
                            selectedClientId = client['id']; // تخزين ID العميل
                            matchingClients = []; // إخفاء القائمة بعد الاختيار
                          });
                        },
                      ),
                      // إضافة فاصل بين العناصر
                      if (index < matchingClients.length - 1)
                        const Divider(
                          color: Colors.cyan,
                          height: 0.0,
                          thickness: 1.7,
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildFieldRow({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.done,
    required void Function(String) onFieldSubmitted,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 10.0),
        Text(
          label,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            onFieldSubmitted: onFieldSubmitted,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan, width: 2.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan, width: 2.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              hintText: hint,
            ),
          ),
        ),
        const SizedBox(width: 16.0),
      ],
    );
  }

  Widget _buildInfoCell(Map<String, dynamic> transaction) {
    Color iconColor = transaction['type'] == 'إضافة'
        ? const Color(0xFFFF4134)
        : const Color(0xFF66EE6B);

    return IconButton(
      icon: Icon(
        Icons.info_sharp,
        color: iconColor,
        size: 35,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => _buildTransactionDetailsDialog(transaction),
        );
      },
    );
  }

  Widget _buildTransactionDetailsDialog(Map<String, dynamic> transaction) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
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
                'تفاصيل العملية',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 16.0),

            // جدول التفاصيل
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(7.5),
                  1: FlexColumnWidth(2.5),
                },
                border: TableBorder.all(
                  color: Colors.cyan,
                  width: 1.5,
                ),
                children: [
                  _buildInfoRow(
                      'الاسم', transaction['client_name'] ?? 'غير معروف'),
                  _buildInfoRow('المبلغ',
                      transaction['amount']?.toString() ?? 'غير معروف'),
                  _buildInfoRow(
                      'تفاصيل', transaction['details'] ?? 'غير معروف'),
                  _buildInfoRow('النوع', transaction['type'] ?? 'غير معروف'),
                  // _buildInfoRow('النوع', transaction['id'] ?? 'غير معروف'),
                  _buildInfoRow('التاريخ', transaction['date'] ?? 'غير معروف'),
                ],
              ),
            ),

            const SizedBox(height: 16.0),

            // الأزرار
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // حذف العملية
                    Navigator.of(context).pop();

                    _deleteTransaction(transaction);
                  },
                  icon: const Icon(Icons.delete, color: Colors.white),
                  label: const Text('حذف'),
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Colors.red, // لون الزر
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // تعديل العملية
                    _editTransaction(transaction);
                  },
                  icon: const Icon(Icons.edit, color: Colors.white),
                  label: const Text('تعديل'),
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Colors.blue, // لون الزر
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16.0),

            // زر الإغلاق
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'إغلاق',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteTransaction(Map<String, dynamic> transaction) async {
    // احصل على معرف العملية
    final int? transactionId = transaction['operation_id'];

    if (transactionId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('العملية المحددة غير صالحة للحذف'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      // احصل على المثيل
      final databaseHelper = DatabaseHelper();

      // استدعِ دالة الحذف باستخدام المثيل
      int rowsAffected = await databaseHelper.deleteOperation(transactionId);

      if (rowsAffected > 0) {
        _refreshTransactions(); // تحديث البيانات بعد الحذف

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم حذف العملية بنجاح'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('فشل في حذف العملية'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('حدث خطأ أثناء حذف العملية'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _editTransaction(Map<String, dynamic> transaction) {
    final TextEditingController amountController =
        TextEditingController(text: transaction['amount'].toString());
    final TextEditingController detailsController =
        TextEditingController(text: transaction['details']);
    String selectedType = transaction['type']; // النوع الحالي

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Dialog(
                backgroundColor: Colors.white, // خلفية النافذة بيضاء
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 10, // إضافة ظل للنافذة
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // العنوان بخلفية زرقاء
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                        ),
                        child: const Text(
                          'تعديل العملية',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      // فراغ
                      const SizedBox(height: 20.0),

                      // مربع بحواف زرقاء
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(color: Colors.blue, width: 2.0),
                            bottom: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            // حقل تعديل المبلغ
                            TextField(
                              controller: amountController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'المبلغ',
                                labelStyle: const TextStyle(color: Colors.blue),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20.0),

                            // حقل تعديل التفاصيل
                            TextField(
                              controller: detailsController,
                              decoration: InputDecoration(
                                labelText: 'التفاصيل',
                                labelStyle: const TextStyle(color: Colors.blue),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20.0),

                            // اختيار نوع العملية (مربع)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.2,
                                      child: Radio<String>(
                                        value: 'إضافة',
                                        groupValue: selectedType,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedType = value!;
                                          });
                                        },
                                        activeColor: Colors
                                            .blue, // لون المربع عند الاختيار
                                      ),
                                    ),
                                    const Text(
                                      'إضافة',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.2,
                                      child: Radio<String>(
                                        value: 'تسديد',
                                        groupValue: selectedType,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedType = value!;
                                          });
                                        },
                                        activeColor: Colors
                                            .blue, // لون المربع عند الاختيار
                                      ),
                                    ),
                                    const Text(
                                      'تسديد',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // مربع أسفل النافذة للأزرار
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                          ),
                        ),
                        child: Row(
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
                                    ),
                                  );
                                  return;
                                }

                                try {
                                  final databaseHelper = DatabaseHelper();
                                  int rowsAffected =
                                      await databaseHelper.updateOperation(
                                    transaction[
                                        'operation_id'], // نفس ID العملية
                                    double.parse(amountController.text),
                                    detailsController.text,
                                    selectedType,
                                  );

                                  if (rowsAffected > 0) {
                                    Navigator.of(context).pop();
                                    _refreshTransactions();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('تم تعديل العملية بنجاح'),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('فشل في تعديل العملية'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                } catch (error) {
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('حدث خطأ أثناء تعديل العملية'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue, // لون زر الحفظ
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              child: const Text(
                                'حفظ',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey, // لون زر الإلغاء
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              child: const Text(
                                'إلغاء',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
 */
// ==========================================================================



/* 


import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import 'add_delete.dart';
import 'search.dart';
import '../main.dart';
// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, use_build_context_synchronously, duplicate_ignore, deprecated_member_use

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _amountFocusNode = FocusNode();
  final FocusNode _detailsFocusNode = FocusNode();

  String _transactionType = '';
  List<Map<String, dynamic>> _recentTransactions = [];
  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _detailsController.dispose();
    _nameFocusNode.dispose();
    _amountFocusNode.dispose();
    _detailsFocusNode.dispose();
    super.dispose();
  }

  // List<String> _suggestedNames = [];

// =  ===========================
  int? selectedClientId; // ID العميل المختار
  List<Map<String, dynamic>> matchingClients = []; // قائمة الأسماء المطابقة

  void _searchClients(String query) async {
    final results = await DatabaseHelper().searchClientsByName(query);
    setState(() {
      matchingClients = results;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchRecentTransactions();

    // تحريك المؤشر إلى نهاية النص عند التركيز على الحقل
    _nameFocusNode.addListener(() {
      if (_nameFocusNode.hasFocus) {
        _moveCursorToEnd(_nameController);
      }
    });

    _amountFocusNode.addListener(() {
      if (_amountFocusNode.hasFocus) {
        _moveCursorToEnd(_amountController);
      }
    });

    _detailsFocusNode.addListener(() {
      if (_detailsFocusNode.hasFocus) {
        _moveCursorToEnd(_detailsController);
      }
    });
  }

  void _moveCursorToEnd(TextEditingController controller) {
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
  }

  // جلب آخر 50 عمليات من قاعدة البيانات
  Future<void> _fetchRecentTransactions() async {
    final transactions = await DatabaseHelper().getLastTenOperationsWithNames();
    setState(() {
      _recentTransactions = transactions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFEEEBEB),
        appBar: AppBar(
          title: const Text(
            '  ادارة حسابات العملاء',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.home,
              size: 35,
              color: Color(0xFFF26157),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const MyApp(), // استبدل AddTransactionPage بالصفحة المستهدفة
                ),
              );
            },
          ),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.person,
                  size: 30,
                  color: Color.fromARGB(255, 76, 96, 245),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const AddDeletePage(), // استبدل AddTransactionPage بالصفحة المستهدفة
                    ),
                  );
                }),
            const SizedBox(width: 8),
            IconButton(
                icon: const Icon(Icons.search,
                    size: 30, color: Color.fromARGB(255, 106, 245, 111)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const SearchClientPage(), // استبدل AddTransactionPage بالصفحة المستهدفة
                    ),
                  );
                }),
            const SizedBox(width: 8),
          ],
        ),

        /*        body: Padding(
          padding: const EdgeInsets.all(6.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildHighlightedBox(),
                const SizedBox(height: 8.0),
                // عنوان الجدول
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 40),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3.0),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.cyan,
                  ),
                  child: const Text(
                    ' العمليات الاخيرة',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8.0),

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.cyan, width: 3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.cyan,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: const [
                              Expanded(
                                flex: 8, // نسبة 30%
                                child: Text(
                                  'التفاصيل',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2, // نسبة 30%
                                child: Text(
                                  'معلومات',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: _recentTransactions.length,
                            itemBuilder: (context, index) {
                              final transaction = _recentTransactions[index];

                              return Container(
                                decoration: BoxDecoration(
                                  color: index % 2 == 0
                                      ? const Color(0xFFF1F1F1)
                                      : Colors.white,
                                  border: const Border(
                                    bottom: BorderSide(
                                        color: Colors.cyan, width: 2.0),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 8, // نسبة 70%
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            left: BorderSide(
                                                color: Colors.cyan, width: 2.0),
                                            right: BorderSide(
                                                color: Colors.cyan, width: 2.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 15,
                                            horizontal: 2,
                                          ),
                                          child: Text(
                                            transaction['client_name'],
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              fontSize: 14.5,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // عمود معلومات
                                    Expanded(
                                      flex: 2, // نسبة 30%
                                      child: _buildInfoCell(transaction),
                                      // },
                                      // ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
     */

        body: Padding(
          padding: const EdgeInsets.all(6.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildHighlightedBox(),
                const SizedBox(height: 8.0),
                // عنوان الجدول
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 40),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3.0),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.cyan,
                  ),
                  child: const Text(
                    'العمليات الاخيرة',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8.0),

                // تمت إزالة Expanded من هنا
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.cyan, width: 3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.cyan,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: const [
                            Expanded(
                              flex: 8, // نسبة 80%
                              child: Text(
                                'التفاصيل',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2, // نسبة 20%
                              child: Text(
                                'معلومات',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // تمت إزالة Expanded من هنا أيضًا
                      SizedBox(
                        height:
                            300, // حدد ارتفاعًا ثابتًا أو استخدم MediaQuery لتحديد ارتفاع ديناميكي
                        child: ListView.builder(
                          itemCount: _recentTransactions.length,
                          itemBuilder: (context, index) {
                            final transaction = _recentTransactions[index];

                            return Container(
                              decoration: BoxDecoration(
                                color: index % 2 == 0
                                    ? const Color(0xFFF1F1F1)
                                    : Colors.white,
                                border: const Border(
                                  bottom: BorderSide(
                                      color: Colors.cyan, width: 2.0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 8, // نسبة 80%
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.cyan, width: 2.0),
                                          right: BorderSide(
                                              color: Colors.cyan, width: 2.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                          horizontal: 2,
                                        ),
                                        child: Text(
                                          transaction['client_name'],
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontSize: 14.5,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // عمود معلومات
                                  Expanded(
                                    flex: 2, // نسبة 20%
                                    child: _buildInfoCell(transaction),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// ===============================
  //  دالة صندوق اضافة   عملية
// ===============================
  Widget _buildHighlightedBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.cyan, width: 2.0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // عنوان الصندوق
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: const BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.vertical(
                  // top: Radius.circular(8),
                  ),
            ),
            child: const Center(
              child: Text(
                'إضافة عملية',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),

          // النموذج
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // حقل الاسم مع القائمة
                _buildNameFieldWithSuggestions(),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
          const SizedBox(height: 6.0),
        ],
      ),
    );
  }

  // نافذة اختيار نوع العملية
  void _showTransactionTypeDialog() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save(); // حفظ القيم
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: const Color(0xFFEEEBEB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                    // 'تعديل بيانات عميل',
                    'اختر نوع العملية',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      // padding: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color(0xFFFF665B), width: 2.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'إضافة',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w800),
                          ),
                          Radio<String>(
                            value: 'إضافة',
                            activeColor: Colors.red,
                            groupValue: _transactionType,
                            onChanged: (value) {
                              setState(() {
                                _transactionType = value ?? '';
                              });
                              Navigator.pop(context);
                              _saveTransaction();
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color(0xFF70FF75), width: 2.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'تسديد',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w800),
                          ),
                          Radio<String>(
                            value: 'تسديد',
                            activeColor: const Color(0xFF70FF75),
                            groupValue: _transactionType,
                            onChanged: (value) {
                              setState(() {
                                _transactionType = value ?? '';
                              });
                              Navigator.pop(context);
                              _saveTransaction();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
              ],
            ),
            // mainAxisSize: MainAxisSize.min,
            // ),
          );
        },
      );
    }
  }

// ========================================
// دوال التعامل مع الحذف والتعديل
// ========================================
  void _refreshTransactions() async {
    final databaseHelper = DatabaseHelper();
    final newTransactions =
        await databaseHelper.getLastTenOperationsWithNames();
    setState(() {
      _recentTransactions = newTransactions;
    });
  }

// دالة بناء صف لكل معلومة
  TableRow _buildInfoRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
// ============================================
  // حفظ العملية في قاعدة البيانات
// ============================================

  void _saveTransaction() async {
    if (_transactionType.isNotEmpty) {
      final databaseHelper = DatabaseHelper();
      String trimmedName =
          _nameController.text.trim(); // استخدام النص مباشرة من وحدة التحكم

      // التحقق من وجود العميل
      bool clientExists = await databaseHelper.doesClientExist(trimmedName);

      if (!clientExists) {
        showDialog(
          context: context,
          builder: (context) {
            String phoneNumber = '';

            return StatefulBuilder(
              builder: (context, setState) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Dialog(
                      backgroundColor: const Color(0xFFEEEBEB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: SingleChildScrollView(
                          child: Container(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              decoration: const BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                              ),
                              child: const Text(
                                ' اضافة عميل جديد',
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
                              width: double.infinity,
                              // padding:
                              // const EdgeInsets.symmetric(vertical: 12.0),
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  const Text(
                                      'اسم العميل غير محفوظ. هل ترغب في حفظه؟'),
                                  const SizedBox(height: 16.0),
                                  TextField(
                                    textDirection: TextDirection.rtl,
                                    decoration: const InputDecoration(
                                      labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800),
                                      labelText: 'رقم الهاتف',
                                      // border: OutlineInputBorder(),
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.cyan),
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
                                    keyboardType: TextInputType.phone,
                                    onChanged: (value) {
                                      phoneNumber = value;
                                    },
                                  ),
                                  const SizedBox(height: 10.0),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 3,
                              color: Colors.cyan,
                            ),
                            const SizedBox(height: 18.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // إغلاق النافذة
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
                                  child: const Text(
                                    'إلغاء',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    if (phoneNumber.isNotEmpty) {
                                      await databaseHelper.insertCustomer(
                                          trimmedName, phoneNumber);

                                      Navigator.of(context).pop();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'تم حفظ العميل والعملية بنجاح'),
                                          backgroundColor: Colors.green,
                                        ),
                                      );

                                      // حفظ العملية بعد حفظ العميل
                                      await _saveTransactionToDatabase();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('يرجى إدخال رقم الهاتف'),
                                          backgroundColor: Colors.red,
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
                                  child: const Text(
                                    'حفظ',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10.0),
                          ],
                        ),
                      ))),
                );
              },
            );
          },
        );
      } else {
        // إذا كان العميل موجودًا، قم بحفظ العملية مباشرة
        await _saveTransactionToDatabase();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى اختيار نوع العملية')),
      );
    }
  }

  Widget _buildNameFieldWithSuggestions() {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // حقل الاسم
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 10.0),
                const Text(
                  'الاسم :   ',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: TextFormField(
                    controller: _nameController,
                    focusNode: _nameFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_amountFocusNode);
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    ),
                    onChanged: (value) {
                      _searchClients(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال الاسم';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
              ],
            ),

            const SizedBox(height: 10.0),

            // الحقل الثاني: المبلغ
            _buildFieldRow(
              controller: _amountController,
              focusNode: _amountFocusNode,
              label: 'المبلغ :    ',
              hint: '',
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_detailsFocusNode);
              },
            ),

            const SizedBox(height: 10.0),

            // الحقل الثالث: التفاصيل
            _buildFieldRow(
              controller: _detailsController,
              focusNode: _detailsFocusNode,
              label: 'تفاصيل : ',
              hint: '',
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) {
                FocusScope.of(context).unfocus();
              },
            ),

            const SizedBox(height: 10.0),

            // زر الموافقة
            Center(
              child: ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus(); // إخفاء لوحة المفاتيح
                  _showTransactionTypeDialog();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan,
                  onPrimary: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  elevation: 4,
                ),
                child: const Text(
                  'موافق',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),

        // قائمة الأسماء المقترحة
        /*        if (_suggestedNames.isNotEmpty)
          Positioned(
            top: 45.0,
            left: 16,
            right: 80,
            child: Container(
              constraints: const BoxConstraints(maxHeight: 170),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.cyan, width: 3.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListView.builder(
                itemCount: _suggestedNames.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 0.0,
                        ),
                        title: Text(
                          _suggestedNames[index],
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w800),
                        ),
                        onTap: () {
                          setState(() {
                            _nameController.text = _suggestedNames[index];
                            _suggestedNames = [];
                          });
                        },
                      ),
                      if (index < _suggestedNames.length - 1)
                        const Divider(
                          color: Colors.cyan,
                          height: 0.0,
                          // indent: .0,
                          thickness: 1.7,
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
    */

        // if (matchingClients.isNotEmpty)
        //   ListView.builder(
        //     shrinkWrap: true,
        //     itemCount: matchingClients.length,
        //     itemBuilder: (context, index) {
        //       final client = matchingClients[index];
        //       return ListTile(
        //         title: Text(client['name']),
        //         onTap: () {
        //           setState(() {
        //             _nameController.text = client['name'];
        //             selectedClientId = client['id']; // تخزين ID العميل
        //             matchingClients = []; // إخفاء القائمة بعد الاختيار
        //           });
        //         },
        //       );
        //     },
        //   ),
        if (matchingClients.isNotEmpty)
          Positioned(
            top: 45.0, // تحديد موقع القائمة بالنسبة لحقل الإدخال
            left: 16,
            right: 80,
            child: Container(
              constraints: const BoxConstraints(
                  maxHeight: 170), // الحد الأقصى لارتفاع القائمة
              decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: Colors.cyan, width: 3.0), // تحديد الحواف
                borderRadius: BorderRadius.circular(8.0), // زوايا مستديرة
              ),
              child: ListView.builder(
                itemCount: matchingClients.length,
                itemBuilder: (context, index) {
                  final client = matchingClients[index];
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 0.0,
                        ),
                        title: Text(
                          client['name'], // عرض اسم العميل
                          textAlign: TextAlign.right, // محاذاة النص إلى اليمين
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _nameController.text =
                                client['name']; // تحديث حقل النص
                            selectedClientId = client['id']; // تخزين ID العميل
                            matchingClients = []; // إخفاء القائمة بعد الاختيار
                          });
                        },
                      ),
                      // إضافة فاصل بين العناصر
                      if (index < matchingClients.length - 1)
                        const Divider(
                          color: Colors.cyan,
                          height: 0.0,
                          thickness: 1.7,
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildFieldRow({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.done,
    required void Function(String) onFieldSubmitted,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 10.0),
        Text(
          label,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            onFieldSubmitted: onFieldSubmitted,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan, width: 2.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan, width: 2.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              hintText: hint,
            ),
          ),
        ),
        const SizedBox(width: 16.0),
      ],
    );
  }

  Future<void> _saveTransactionToDatabase() async {
    double? amount = double.tryParse(_amountController.text.trim());
    String details = _detailsController.text.trim();

    if (selectedClientId == null || amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى اختيار عميل صحيح ومبلغ أكبر من 0'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    await DatabaseHelper().insertOperation(
      selectedClientId!, // إرسال ID العميل
      amount,
      details,
      _transactionType,
    );

    _refreshTransactions();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم حفظ العملية بنجاح'),
        backgroundColor: Colors.green,
      ),
    );
  }

// =====================================

  Widget _buildTransactionTable() {
    if (_recentTransactions.isEmpty) {
      return const Center(
        child: Text(
          'لا توجد عمليات مالية لعرضها',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
      );
    }
// String Nemi = ;
    return
/*     
                       Container(
                              decoration: BoxDecoration(
                                // color: index % 2 == 0
                                //     ? const Color(0xFFF1F1F1)
                                //     : Colors.white,
                                border: const Border(
                                  bottom: BorderSide(
                                      color: Colors.cyan, width: 2.0),
                                ),
                              ),
                              child: Row(
                                children: [
                    /*               // عمود المبلغ
                                  Expanded(
                                    flex: 3, // نسبة 70%
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 10,
                                      ),
                                      child: Text(
                                        transaction['amount'].toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 15.5,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ), */
                                  // عمود التفاصيل
                                  Expanded(
                                    flex: 5, // نسبة 70%
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.cyan, width: 2.0),
                                          right: BorderSide(
                                              color: Colors.cyan, width: 2.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                          horizontal: 2,
                                        ),
                                        child: Text(
                                          // _recentTransactions,
                                          _recentTransactions(),
                                          // _recentTransactions['details'];
                                          // '(transaction["client_name"])',
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontSize: 14.5,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // عمود معلومات
                          
                          
/*                                   Expanded(
                                    flex: 2, // نسبة 30%
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.info,
                                        // color:
                                        //     iconColor, // اللون يعتمد على نوع العملية
                                      ),
                                      onPressed: () {
                                        _showTransactionDetails(transaction);
                                      },
                                    ),
                                  ),
                                 */],
                              ),
                            );
               */

        Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.36, // ضبط الطول النسبي
      decoration: BoxDecoration(
        border: Border.all(color: Colors.cyan, width: 3),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Column(
        children: [
          // العنوان الثابت للجدول
/*           Container(
            color: Colors.cyan,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(7), // الاسم
                1: FlexColumnWidth(3), // معلومات
              },
              children: [
                TableRow(
                  children: [
                    _buildTableCell('الاسم', isHeader: true),
                    _buildTableCell('معلومات', isHeader: true),
                  ],
                ),
              ],
            ),
          ),
         */
          Container(
            decoration: const BoxDecoration(
              color: Colors.cyan,
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              children: const [
/*                             Expanded(
                              flex: 3, // نسبة 70%
                              child: Text(
                                'المبلغ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                     */

                Expanded(
                  flex: 5, // نسبة 30%
                  child: Text(
                    'التفاصيل',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2, // نسبة 30%
                  child: Text(
                    'معلومات',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),

// ======================================
          // محتوى الجدول
          Expanded(
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(7), // الاسم
                    1: FlexColumnWidth(3), // معلومات
                  },
                  border: TableBorder.all(color: Colors.cyan, width: 1.4),
                  children: _recentTransactions.map((transaction) {
                    return TableRow(
                      children: [
                        _buildTableCellNems(
                            transaction['client_name'] ?? 'غير معروف'),
                        _buildInfoCell(transaction),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCell(Map<String, dynamic> transaction) {
    Color iconColor = transaction['type'] == 'إضافة'
        ? const Color(0xFFFF4134)
        : const Color(0xFF66EE6B);

    return IconButton(
      icon: Icon(
        Icons.info_sharp,
        color: iconColor,
        size: 35,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => _buildTransactionDetailsDialog(transaction),
        );
      },
    );
  }

  Widget _buildTableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: isHeader ? FontWeight.w800 : FontWeight.normal,
          color: isHeader ? Colors.white : Colors.grey[800],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildTableCellNems(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: isHeader ? FontWeight.w800 : FontWeight.w600,
          color: isHeader ? Colors.white : Colors.grey[800],
        ),
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _buildTransactionDetailsDialog(Map<String, dynamic> transaction) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
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
                'تفاصيل العملية',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 16.0),

            // جدول التفاصيل
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(7.5),
                  1: FlexColumnWidth(2.5),
                },
                border: TableBorder.all(
                  color: Colors.cyan,
                  width: 1.5,
                ),
                children: [
                  _buildInfoRow(
                      'الاسم', transaction['client_name'] ?? 'غير معروف'),
                  _buildInfoRow('المبلغ',
                      transaction['amount']?.toString() ?? 'غير معروف'),
                  _buildInfoRow(
                      'تفاصيل', transaction['details'] ?? 'غير معروف'),
                  _buildInfoRow('النوع', transaction['type'] ?? 'غير معروف'),
                  // _buildInfoRow('النوع', transaction['id'] ?? 'غير معروف'),
                  _buildInfoRow('التاريخ', transaction['date'] ?? 'غير معروف'),
                ],
              ),
            ),

            const SizedBox(height: 16.0),

            // الأزرار
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // حذف العملية
                    Navigator.of(context).pop();

                    _deleteTransaction(transaction);
                  },
                  icon: const Icon(Icons.delete, color: Colors.white),
                  label: const Text('حذف'),
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Colors.red, // لون الزر
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // تعديل العملية
                    _editTransaction(transaction);
                  },
                  icon: const Icon(Icons.edit, color: Colors.white),
                  label: const Text('تعديل'),
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Colors.blue, // لون الزر
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16.0),

            // زر الإغلاق
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'إغلاق',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteTransaction(Map<String, dynamic> transaction) async {
    // احصل على معرف العملية
    final int? transactionId = transaction['operation_id'];

    if (transactionId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('العملية المحددة غير صالحة للحذف'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      // احصل على المثيل
      final databaseHelper = DatabaseHelper();

      // استدعِ دالة الحذف باستخدام المثيل
      int rowsAffected = await databaseHelper.deleteOperation(transactionId);

      if (rowsAffected > 0) {
        _refreshTransactions(); // تحديث البيانات بعد الحذف

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم حذف العملية بنجاح'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('فشل في حذف العملية'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('حدث خطأ أثناء حذف العملية'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _editTransaction(Map<String, dynamic> transaction) {
    final TextEditingController amountController =
        TextEditingController(text: transaction['amount'].toString());
    final TextEditingController detailsController =
        TextEditingController(text: transaction['details']);
    String selectedType = transaction['type']; // النوع الحالي

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Dialog(
                backgroundColor: Colors.white, // خلفية النافذة بيضاء
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 10, // إضافة ظل للنافذة
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // العنوان بخلفية زرقاء
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                        ),
                        child: const Text(
                          'تعديل العملية',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      // فراغ
                      const SizedBox(height: 20.0),

                      // مربع بحواف زرقاء
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(color: Colors.blue, width: 2.0),
                            bottom: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            // حقل تعديل المبلغ
                            TextField(
                              controller: amountController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'المبلغ',
                                labelStyle: const TextStyle(color: Colors.blue),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20.0),

                            // حقل تعديل التفاصيل
                            TextField(
                              controller: detailsController,
                              decoration: InputDecoration(
                                labelText: 'التفاصيل',
                                labelStyle: const TextStyle(color: Colors.blue),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20.0),

                            // اختيار نوع العملية (مربع)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.2,
                                      child: Radio<String>(
                                        value: 'إضافة',
                                        groupValue: selectedType,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedType = value!;
                                          });
                                        },
                                        activeColor: Colors
                                            .blue, // لون المربع عند الاختيار
                                      ),
                                    ),
                                    const Text(
                                      'إضافة',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.2,
                                      child: Radio<String>(
                                        value: 'تسديد',
                                        groupValue: selectedType,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedType = value!;
                                          });
                                        },
                                        activeColor: Colors
                                            .blue, // لون المربع عند الاختيار
                                      ),
                                    ),
                                    const Text(
                                      'تسديد',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // مربع أسفل النافذة للأزرار
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                          ),
                        ),
                        child: Row(
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
                                    ),
                                  );
                                  return;
                                }

                                try {
                                  // print('Attempting to update operation: ID=${transaction['operation_id']}, '
                                  //     'Amount=${amountController.text}, Details=${detailsController.text}, '
                                  //     'Type=$selectedType');
                                  // print('===================================');
                                  final databaseHelper = DatabaseHelper();
                                  int rowsAffected =
                                      await databaseHelper.updateOperation(
                                    transaction[
                                        'operation_id'], // نفس ID العملية
                                    double.parse(amountController.text),
                                    detailsController.text,
                                    selectedType,
                                  );

                                  if (rowsAffected > 0) {
                                    Navigator.of(context).pop();
                                    _refreshTransactions();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('تم تعديل العملية بنجاح'),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('فشل في تعديل العملية'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                } catch (error) {
                                  // print('Error occurred while updating operation: $error');
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('حدث خطأ أثناء تعديل العملية'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue, // لون زر الحفظ
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              child: const Text(
                                'حفظ',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey, // لون زر الإلغاء
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              child: const Text(
                                'إلغاء',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}










 */