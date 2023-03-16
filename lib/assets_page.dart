import 'package:flutter/material.dart';
import 'package:flutter_application_1/image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

class AssetsPage extends StatelessWidget {
  const AssetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.red,
            height: 200,
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Icon(Icons.abc),
                      Text(
                        "adasdasdasdasdasdasda",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Icon(Icons.abc_rounded),
                      Text(
                        "adasdasdasdasdasdasda",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Icon(Icons.abc_rounded),
                      Text(
                        "adasdasdasdasdasdasda",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Icon(Icons.abc_rounded),
                      Text(
                        "adasdasdasdasdasdasda",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Expanded(
          //   child: Container(
          //     color: Colors.red,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     color: Colors.orange,
          //   ),
          // ),
        ],
      ),
      // body: Stack(
      //   children: [
      //     ClipRRect(
      //       borderRadius: const BorderRadius.only(
      //         bottomLeft: Radius.circular(42),
      //         bottomRight: Radius.circular(42),
      //       ),
      //       child: Image.asset(
      //         'assets/images/background.png',
      //         height: 334,
      //         width: double.infinity,
      //         fit: BoxFit.cover,
      //       ),
      //     ),
      //     Positioned(
      //       top: 24,
      //       left: 24,
      //       right: 24,
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           const Text(
      //             'Hai, Member',
      //           ),
      //           ElevatedButton(
      //             onPressed: () {},
      //             child: const Text(
      //               'Upgrade',
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Positioned(
      //       top: 150,
      //       left: 24,
      //       right: 24,
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text('Saldo'),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Text(
      //                 'Rp. 1.000.000',
      //               ),
      //               Icon(
      //                 Icons.remove_red_eye,
      //               )
      //             ],
      //           )
      //         ],
      //       ),
      //     )
      //   ],
      // ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Text(
      //       'Halo Semua',
      //     ),

      //     Text(
      //       'Style Beda',
      //       style: TextStyle(fontFamily: 'RubikIso-Regular'),
      //     ),
      //     Text(
      //       'Rak Fajar',
      //       style: GoogleFonts.notoNaskhArabic(),
      //     )
      //     // Container(
      //     //   height: 300,
      //     //   width: double.infinity,
      //     //   margin: EdgeInsets.symmetric(horizontal: 30),
      //     //   decoration: const BoxDecoration(
      //     //     color: Colors.red,
      //     //     borderRadius: BorderRadius.all(
      //     //       Radius.circular(
      //     //         10,
      //     //       ),
      //     //     ),
      //     //   ),
      //     //   child: ClipRRect(
      //     //     borderRadius: const BorderRadius.all(
      //     //       Radius.circular(
      //     //         20,
      //     //       ),
      //     //     ),
      //     //     child: Image.asset(
      //     //       flutterLogo,
      //     //       height: 900,
      //     //       width: 100,
      //     //       fit: BoxFit.fill,
      //     //     ),~
      //     //   ),
      //     // ),
      //     // SvgPicture.asset('assets/images/icon_svg.svg'),
      //     // Image.network(
      //     //   "https://cdn-2.tstatic.net/sumsel/foto/bank/images/One-Piece-Episode-1054-Jadwal-Rilis-dan-Preview-Lengkap.jpg",
      //     // ),
      //     // CachedNetworkImage(
      //     //   imageUrl:
      //     //       "https://cdn-2.tstatic.net/sumsel/foto/bank/images/One-Piece-Episode-1054-Jadwal-Rilis-dan-Preview-Lengkap.jpg",
      //     //   placeholder: (context, url) => CircularProgressIndicator(),
      //     //   errorWidget: (context, url, error) => Icon(Icons.error),
      //     // ),
      //   ],
      // ),
    );
  }
}
