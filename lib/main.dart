import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/assets_page.dart';
import 'package:flutter_application_1/page/detail_teman_page.dart';
import 'package:flutter_application_1/page/list_teman_page.dart';
import 'package:flutter_application_1/page/password_page.dart';
import 'package:flutter_application_1/page/sukses_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';

void main() {
  runApp(const MyApp());
}

class RouteNamePage {
  String initialPage = "/";
  String detailTeman = "/detailTemanPage";
  String passwordPageRoute = "/passwordPage";
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: RouteNamePage().initialPage,
      routes: {
        RouteNamePage().initialPage: (_) => ListTemanPage(),
        RouteNamePage().detailTeman: (_) => DetailTemanPage(),
        RouteNamePage().passwordPageRoute: (_) => PasswordPage()
      },
    );
  }
}

class NewHomePage extends StatefulWidget {
  const NewHomePage({super.key});

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  final formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  var _username = "";

  bool _isHidePassword = false;

  String _messageError = "";

  // Untuk Radio
  String _jenisKelamin = "";
  bool _isSelectLainnya = false;
  // Akhir Radio

  // Untuk Checkbox
  var _checkValue = false;
  // Ahkir Checkbox

  // Untuk DropDown
  int _dropDownKota = 0;
  // Akhir DropDown

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    } else if (value.length <= 8) {
                      return "Nomor Telp Wajib Lebih dari 8 angka";
                    }
                    return null;
                  },
                  maxLines: 1,
                  onChanged: (value) {
                    _username = value;
                    // if (value.isEmpty) {
                    //   _messageError = "Nomor Telp Tidak Boleh Kosong";
                    // } else if (value.length <= 8) {
                    //   _messageError = "Nomor Telp Wajib Lebih dari 8 angka";
                    // } else {
                    //   _messageError = "";
                    // }
                    setState(() {});
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    FilteringTextInputFormatter.deny(RegExp('^0+'))
                  ],
                  controller: _usernameController,
                  obscureText: false,
                  obscuringCharacter: "*",
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF343434),
                  ),
                  decoration: InputDecoration(
                    errorText: _messageError,
                    filled: true,
                    fillColor: const Color(0xFFECFCF9),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orange,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          15,
                        ),
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(
                          0xFFCACACA,
                        ),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          15,
                        ),
                      ),
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text("+62"),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isHidePassword = !_isHidePassword;
                        });
                      },
                      child: Icon(
                        _isHidePassword ? Icons.lock : Icons.lock_open_outlined,
                      ),
                    ),
                    hintText: 'Masukan No Telp',
                    hintStyle: GoogleFonts.nunito(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF989898),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  validator: (value) => EmailValidator.validate(value ?? "")
                      ? null
                      : "Kamu Harus Masukan Email",
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 1,
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: _emailController,
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF343434),
                  ),
                  decoration: InputDecoration(
                    errorText: _messageError,
                    filled: true,
                    fillColor: const Color(0xFFECFCF9),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orange,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          15,
                        ),
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(
                          0xFFCACACA,
                        ),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          15,
                        ),
                      ),
                    ),
                    hintText: 'Masukan Email',
                    hintStyle: GoogleFonts.nunito(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF989898),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('Hobi'),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
                          value: "Mobile",
                          groupValue: _jenisKelamin,
                          onChanged: (value) {
                            _jenisKelamin = value ?? "";
                            _isSelectLainnya = false;

                            setState(() {});
                          },
                          title: const Text("Mobile"),
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          value: "Komputer",
                          groupValue: _jenisKelamin,
                          onChanged: (value) {
                            _jenisKelamin = value ?? "";
                            _isSelectLainnya = false;

                            setState(() {});
                          },
                          title: const Text("Komputer"),
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          value: "Dll",
                          groupValue: _jenisKelamin,
                          onChanged: (value) {
                            _jenisKelamin = value ?? "";
                            _isSelectLainnya = true;
                            setState(() {});
                          },
                          title: const Text("Lainnya"),
                        ),
                      ),
                    ],
                  ),
                  _isSelectLainnya ? TextField() : Container()
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _checkValue = !_checkValue;
                      });
                    },
                    child: Icon(
                      _checkValue
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                    ),
                  ),
                  Text(
                    'Setuju',
                    style: TextStyle(
                      color: _checkValue ? Colors.black : Colors.grey,
                    ),
                  )
                ],
              ),

              // Checkbox(
              //   value: _checkValue,
              //   onChanged: (val) {
              //     _checkValue = val ?? false;
              //     setState(() {});
              //   },
              // ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<int>(
                  isExpanded: true,
                  icon: Icon(Icons.arrow_downward_outlined),
                  value: _dropDownKota,
                  items: const [
                    DropdownMenuItem(
                      value: 0,
                      child: Text(
                        'Pilih...',
                      ),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: Text(
                        'Kota Bandung',
                      ),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text(
                        'Kab. Bandung',
                      ),
                    ),
                    DropdownMenuItem(
                      value: 3,
                      child: Text(
                        'Semarang',
                      ),
                    )
                  ],
                  onChanged: (val) {
                    _dropDownKota = val ?? 0;
                    setState(() {});
                  },
                ),
              ),
              Text(_username),
              ElevatedButton(
                onPressed: _checkValue
                    ? () {
                        if (formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          print(_usernameController.text);
                          // _username = _usernameController.text;
                          setState(() {});
                          print(_emailController.text);
                        }
                      }
                    : null,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add),
                    Text('Register'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
