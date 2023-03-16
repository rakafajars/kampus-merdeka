import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/page/detail_teman_page.dart';
import 'package:flutter_application_1/page/list_teman_page.dart';

class SuksesPage extends StatelessWidget {
  const SuksesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Berhasil Registrasi',
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.pushAndRemoveUntil(
              //     context,
              //     MaterialPageRoute(
              //       builder: (_) => ListTemanPage(),
              //     ),
              //     (route) => false);
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
            child: Text('Balik'),
          ),
        ],
      ),
    );
  }
}
