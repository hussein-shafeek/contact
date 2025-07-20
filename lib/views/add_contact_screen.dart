import 'dart:io';
import 'package:contact/components/app_colors.dart';
import 'package:contact/components/app_layout.dart';
import 'package:contact/components/contact_model.dart';
import 'package:contact/components/contacts_save.dart';
import 'package:contact/components/custom_text_field.dart';
import 'package:contact/components/routes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  File? _imageFile;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _imageFile = File(picked.path);
      });
    }
  }

  void validateAndSave() {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final phone = phoneController.text.trim();

    if (name.isEmpty || email.isEmpty || phone.isEmpty) {
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: const Text('Missing Fields'),
              content: const Text('Please fill in all fields.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Done'),
                ),
              ],
            ),
      );
      return;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: const Text('Invalid Email'),
              content: const Text('Enter a valid email address.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    FocusScope.of(
                      context,
                    ).requestFocus(FocusNode()); // remove focus
                  },
                  child: const Text('Done'),
                ),
              ],
            ),
      );
      return;
    }

    // Optional: Validate phone

    final cleanedPhone = phone.replaceAll(
      RegExp(r'\D'),
      '',
    ); // يشيل أي حاجة مش رقم

    if (cleanedPhone.length != 11) {
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: const Text('Invalid Phone Number'),
              content: const Text('Phone number must be exactly 11 digits.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Done'),
                ),
              ],
            ),
      );
      return;
    }

    globalContacts.add(
      ContactModel(name: name, email: email, phone: phone, image: _imageFile),
    );

    Navigator.pushReplacementNamed(context, AppRoutes.contactListScreen);
  }

  @override
  void initState() {
    super.initState();
    nameController.addListener(() => setState(() {}));
    emailController.addListener(() => setState(() {}));
    phoneController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_element

    return AppLayout(
      child: SingleChildScrollView(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Center(
                  child: Lottie.asset(
                    'assets/animations/empty.json',
                    width: 220,
                    height: 220,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: pickImage,
                      child: Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Theme.of(context).primaryColor,

                            width: 1.5,
                          ),
                        ),

                        child:
                            _imageFile != null
                                ? ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.file(
                                    _imageFile!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                                : Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Lottie.asset(
                                    'assets/animations/contact_animations/image_picker.json',
                                  ),
                                ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nameController.text.isEmpty
                                ? 'User Name'
                                : nameController.text,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const Divider(color: AppColors.primary, thickness: 1),
                          const SizedBox(height: 4),
                          Text(
                            emailController.text.isEmpty
                                ? 'example@email.com'
                                : emailController.text,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const Divider(color: AppColors.primary, thickness: 1),

                          const SizedBox(height: 4),
                          Text(
                            phoneController.text.isEmpty
                                ? '01xxxxxxxxx'
                                : phoneController.text,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const Divider(color: AppColors.primary, thickness: 1),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hint: 'Enter User Name ',
                  controller: nameController,
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  hint: 'Enter User Email ',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  hint: 'Enter User Phone',
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 17),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: validateAndSave,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: const Text('Enter user'),
                  ),
                ),
                // const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
