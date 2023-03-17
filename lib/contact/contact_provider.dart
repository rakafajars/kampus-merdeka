import 'package:flutter/material.dart';
import 'package:flutter_application_1/contact/contact_model.dart';

class ContactProvider with ChangeNotifier {
  List<ContactModel> _contacts = [];
  TextEditingController _namaController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  List<ContactModel> get contacts => _contacts;

  TextEditingController get namaController => _namaController;
  TextEditingController get phoneController => _phoneController;

  void addContact(ContactModel contactModel) {
    _contacts.add(contactModel);
    notifyListeners();
  }

  void removeContact() {
    _contacts.removeLast();
    notifyListeners();
  }
}
