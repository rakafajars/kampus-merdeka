import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/page/list_teman_page.dart';
import 'package:flutter_application_1/page/password_page.dart';
import 'package:flutter_application_1/widget/button_teman_widget.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_application_1/widget/utils.dart';

Widget _informationPayment({
  required String title,
  required String subtitle,
  bool isFontWeight700 = false,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isFontWeight700 ? FontWeight.w700 : FontWeight.w500,
          color: isFontWeight700 ? Colors.black : const Color(0xFF898989),
        ),
      ),
      Text(
        subtitle,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
    ],
  );
}

class DetailTemanArguments {
  final String? id;
  final String? nama;

  DetailTemanArguments({
    this.id,
    this.nama,
  });
}

class DetailTemanPage extends StatefulWidget {
  // final Modelteman modelteman;
  // final String? id;
  // const DetailTemanPage({
  //   super.key,
  //   required this.modelteman,
  //   required this.id,
  // });

  @override
  State<DetailTemanPage> createState() => _DetailTemanPageState();
}

class _DetailTemanPageState extends State<DetailTemanPage> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  String _valueRadio = "";

  @override
  Widget build(BuildContext context) {
    final parameter =
        ModalRoute.of(context)?.settings.arguments as DetailTemanArguments? ??
            DetailTemanArguments();
    // final arg = ModalRoute.of(context)?.settings.arguments as Map? ?? {};

    return Scaffold(
      appBar: AppBar(
        title: Text("Masukan OTP"),
        leading: IconButton(
          icon: Icon(
            Icons.close,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text("munculin id ${widget.id ?? "-"}"),

            // Text(arg["v4"] ?? ""),

            Text(parameter.nama.toString()),

            TextField(
              controller: _nameController,
            ),
            Row(
              children: [
                Text('Laki-Laki'),
                Radio(
                  value: 'Laki-Laki',
                  groupValue: _valueRadio,
                  onChanged: (val) {
                    _valueRadio = val ?? "-";
                    setState(() {});
                  },
                ),
              ],
            ),
            Row(
              children: [
                Text('Perempuan'),
                Radio(
                  value: 'Perempuan',
                  groupValue: _valueRadio,
                  onChanged: (val) {
                    _valueRadio = val ?? "-";
                    setState(() {});
                  },
                ),
              ],
            ),
            ButtonWidget(
              titleButton: 'Ke halam password',
              backgroundColor: Colors.red,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PasswordPage(),
                  ),
                );
                // Navigator.pushNamed(context, RouteNamePage().passwordPageRoute);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const PasswordPage(),
                //   ),
                // );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ListTemanPage(),
                //   ),
                // );
                // Navigator.pop(
                //   context,
                // );
                // showModalBottomSheet(
                //   isDismissible: false,
                //   enableDrag: false,
                //   shape: const RoundedRectangleBorder(
                //     borderRadius: BorderRadius.only(
                //       topLeft: Radius.circular(16),
                //       topRight: Radius.circular(16),
                //     ),
                //   ),
                //   context: context,
                //   builder: (context) {
                //     return StatefulBuilder(
                //       builder: (context, setState) {
                //         return Padding(
                //           padding: const EdgeInsets.symmetric(
                //             horizontal: 24,
                //           ),
                //           child: SingleChildScrollView(
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 const SizedBox(height: 40),
                //                 IconButton(
                //                   onPressed: () {
                //                     Navigator.pop(context);
                //                   },
                //                   icon: Icon(
                //                     Icons.close,
                //                   ),
                //                 ),
                //                 const Text(
                //                   'Konfirmasi Tarik Tunai',
                //                   style: TextStyle(
                //                     fontWeight: FontWeight.w700,
                //                     fontSize: 16,
                //                   ),
                //                 ),
                //                 SizedBox(height: 10),
                //                 garisDivider(),
                //                 const SizedBox(height: 20),
                //                 const InformationWidget(
                //                   title: 'Metode Penarikan',
                //                   subtitle: 'ATM BCA',
                //                 ),
                //                 const SizedBox(height: 20),
                //                 _informationPayment(
                //                   title: 'Jumlah Penarikan',
                //                   subtitle: 'Rp. 50.000',
                //                 ),
                //                 const SizedBox(height: 20),
                //                 UtilsGlobal().informationPayment(
                //                   title: 'Biaya Admin',
                //                   subtitle: 'Rp. 1.000',
                //                 ),
                //                 const SizedBox(height: 20),
                //                 garisDivider(),
                //                 const SizedBox(height: 20),
                //                 _informationPayment(
                //                   title: 'Total Pembayaran',
                //                   subtitle: 'Rp. 55.000',
                //                   isFontWeight700: true,
                //                 ),
                //                 const SizedBox(height: 20),
                //                 const Text('Jenis - Kelamin'),
                //                 Row(
                //                   children: [
                //                     Radio(
                //                       value: 'Laki-Laki',
                //                       groupValue: _valueRadio,
                //                       onChanged: (val) {
                //                         _valueRadio = val ?? "-";
                //                         setState(() {});
                //                       },
                //                     ),
                //                     Radio(
                //                       value: 'Perempuan',
                //                       groupValue: _valueRadio,
                //                       onChanged: (val) {
                //                         _valueRadio = val ?? "-";
                //                         setState(() {});
                //                       },
                //                     ),
                //                   ],
                //                 ),
                //                 TextField(
                //                   controller: _phoneController,
                //                 ),
                //                 const SizedBox(height: 20),
                //                 ButtonWidget(
                //                   titleButton: 'Close',
                //                   onPressed: () {},
                //                 )
                //               ],
                //             ),
                //           ),
                //         );
                //       },
                //     );
                //   },
                // );

                // AwesomeDialog(
                //   context: context,
                //   animType: AnimType.rightSlide,
                //   dialogType: DialogType.success,
                //   title: 'Yakin Menghapus ${_nameController.text}',
                //   desc: 'Raka akan terhapus dari daftar teman kamu!',
                //   btnCancelOnPress: () {},
                //   btnOkOnPress: () {},
                // ).show();
                // showDialog(
                //   context: context,
                //   builder: (context) {
                //     return Dialog(
                //       child: Column(
                //         mainAxisSize: MainAxisSize.min,
                //         children: [
                //           Text('Halo'),
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               ButtonWidget(
                //                 titleButton: 'Tidak',
                //                 onPressed: () {
                //                   print('Tidak Jadi Keluar');
                //                 },
                //               ),
                //               ButtonWidget(
                //                 titleButton: 'Ya',
                //                 onPressed: () {
                //                   print('Tidak Jadi Keluar');
                //                 },
                //               ),
                //             ],
                //           ),
                //         ],
                //       ),
                //     );

                //     //  AlertDialog(
                //     //   content: Text(
                //     //     'Apakah Kamu Yaking Menghapus ${_nameController.text} ?',
                //     //   ),
                //     //   actions: [
                //     //     ButtonWidget(
                //     //       titleButton: 'Tidak',
                //     //       onPressed: () {
                //     //         print('Tidak Jadi Keluar');
                //     //       },
                //     //     ),
                //     //     ButtonWidget(
                //     //       titleButton: 'Ya',
                //     //       onPressed: () {
                //     //         print('Akun Keluar');
                //     //       },
                //     //       backgroundColor: Colors.red,
                //     //     ),
                //     //   ],
                //     // );
                //   },
                // );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget garisDivider() {
    return Container(
      width: double.infinity,
      color: Colors.red,
      height: 1,
    );
  }
}

class InformationWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const InformationWidget(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF898989),
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
