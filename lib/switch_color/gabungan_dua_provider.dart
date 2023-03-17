import 'package:flutter/material.dart';
import 'package:flutter_application_1/contact/contact_model.dart';
import 'package:flutter_application_1/contact/contact_provider.dart';
import 'package:flutter_application_1/switch_color/switch_color_provider.dart';
import 'package:provider/provider.dart';

class GabunganDuaProvider extends StatefulWidget {
  const GabunganDuaProvider({super.key});

  @override
  State<GabunganDuaProvider> createState() => _GabunganDuaProviderState();
}

class _GabunganDuaProviderState extends State<GabunganDuaProvider> {
  @override
  Widget build(BuildContext context) {
    final _switchProvider = Provider.of<SwitchColorProvider>(context);
    final _contactProvider = Provider.of<ContactProvider>(context);
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
            ),
            TextField(
              controller: _contactProvider.namaController,
              decoration: const InputDecoration(
                hintText: 'Nama Kontrak',
              ),
            ),
            TextField(
              controller: _contactProvider.phoneController,
              decoration: const InputDecoration(
                hintText: 'Nomor Telp',
              ),
            ),
            Column(
              children: List.generate(
                _contactProvider.contacts.length,
                (index) => ListTile(
                  title: Text(_contactProvider.contacts[index].nama ?? ""),
                  subtitle: Text(_contactProvider.contacts[index].phone ?? ""),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _contactProvider.addContact(
                      ContactModel(
                        nama: _contactProvider.namaController.text,
                        phone: _contactProvider.phoneController.text,
                      ),
                    );
                  },
                  child: const Text("Tambah"),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _contactProvider.removeContact,
                  child: const Text("Remove"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
