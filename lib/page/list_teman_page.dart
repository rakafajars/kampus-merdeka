import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/page/detail_teman_page.dart';
import 'package:flutter_application_1/widget/button_teman_widget.dart';

class Modelteman {
  final int id;
  final String nama;

  Modelteman(
    this.id,
    this.nama,
  );
}

class ListTemanPage extends StatefulWidget {
  @override
  State<ListTemanPage> createState() => _ListTemanPageState();
}

class _ListTemanPageState extends State<ListTemanPage> {
  List<Modelteman> _modelTemans = [
    Modelteman(1, 'Raka'),
    Modelteman(2, 'Rai'),
  ];

  var _tankapJenisKelamin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: ListView.builder(
        itemCount: _modelTemans.length,
        itemBuilder: (context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                RouteNamePage().detailTeman,
                arguments: DetailTemanArguments(
                  id: _modelTemans[index].id.toString(),
                  nama: _modelTemans[index].nama,
                ),
                // arguments: {
                //   'v1': 'data1',
                //   'v2': 'data2',
                //   'v3': 'data3',
                // },
              );
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (_) => DetailTemanPage(
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
            },
            child: Container(
              color: Colors.amber,
              margin: const EdgeInsets.only(bottom: 30),
              height: 50,
              width: 300,
              child: Text(
                "${_modelTemans[index].id} ${_modelTemans[index].nama} $_tankapJenisKelamin",
              ),
            ),
          );
        },
      ),
      // body: SizedBox(
      //   width: double.infinity,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       const Text('List Teman'),
      //       ButtonWidget(
      //         titleButton: 'Pindah Ke Detail Page',
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (_) => DetailTemanPage(),
      //             ),
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
