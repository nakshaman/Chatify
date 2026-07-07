import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key, required this.onPickImage});
  final void Function(File pickedImage) onPickImage;

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _selectedImage;
  void _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 150,
      imageQuality: 50,
    );
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _selectedImage = File(pickedImage.path);
    });
    widget.onPickImage(_selectedImage!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          foregroundImage: _selectedImage != null
              ? FileImage(_selectedImage!)
              : const AssetImage(
                  'assets/images/user_icon.jpg',
                ),
        ),
        TextButton.icon(
          onPressed: _pickImage,
          label: const Text(
            'Add image',
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          icon: const Icon(
            Icons.image,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
