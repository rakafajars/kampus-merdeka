import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/input_contact_widget.dart';

class ContactWidget extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final Function()? onPressed;
  const ContactWidget({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.onPressed,
  });

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InputContactWidget(
            labelText: 'Nama',
            hintText: 'Insert Your Name',
            controller: widget.nameController,
          ),
          InputContactWidget(
            labelText: 'Nomor',
            hintText: '+62.....',
            controller: widget.phoneController,
          ),
          ElevatedButton(
            onPressed: widget.onPressed,
            child: const Text(
              'Submit',
            ),
          )
        ],
      ),
    );
  }
}
