import 'package:flutter/material.dart';
import 'package:flutter_application_1/switch_color/switch_color_provider.dart';
import 'package:provider/provider.dart';

class SwitchColorPage extends StatefulWidget {
  const SwitchColorPage({super.key});

  @override
  State<SwitchColorPage> createState() => _SwitchColorPageState();
}

class _SwitchColorPageState extends State<SwitchColorPage> {
  @override
  Widget build(BuildContext context) {
    final _switchProvider = Provider.of<SwitchColorProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: 250,
              color: _switchProvider.isOnOff ? Colors.orange : Colors.red,
            ),
            const SizedBox(
              height: 16,
            ),
            Switch(
              value: _switchProvider.isOnOff,
              onChanged: (val) {
                _switchProvider.switchOnOff();
              },
            )
          ],
        ),
      ),
    );
  }
}
