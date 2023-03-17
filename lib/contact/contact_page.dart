import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/contact/contact_model.dart';
import 'package:flutter_application_1/contact/contact_provider.dart';
import 'package:provider/provider.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    final _contactProvider = Provider.of<ContactProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                  child: Text("Tambah"),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _contactProvider.removeContact,
                  child: Text("Remove"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
