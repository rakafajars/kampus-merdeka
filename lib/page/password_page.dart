import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/page/detail_teman_page.dart';
import 'package:flutter_application_1/page/sukses_page.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => SuksesPage(),
              //   ),
              // );
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (_) => SuksesPage(
              //         // modelteman: _modelTemans[index],
              //         // id: _modelTemans[index].id.toString(),
              //         ),
              //   ),
              // ).then(
              //   (value) {
              //     print(value);
              //     // _tankapJenisKelamin = value;
              //     // setState(() {});
              //   },
              // );
              Navigator.pushNamed(
                context,
                RouteNamePage().detailTeman,
              );
            },
            child: Text('Halaman Sukses'),
          ),
        ],
      ),
    );
  }
}
