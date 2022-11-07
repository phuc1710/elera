import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';

class Avatar extends StatefulWidget {
  const Avatar({
    Key? key,
  }) : super(key: key);

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  File? image;

  Future<void> _pickImage(ImageSource source) async {
    final XFile? selectedImage = await ImagePicker().pickImage(source: source);
    if (selectedImage != null) {
      setState(() => image = File(selectedImage.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        CircleAvatar(
          radius: MediaQuery.of(context).size.width * 0.17,
          backgroundImage: (image != null)
              ? Image.file(image!).image
              : Image.asset('assets/images/avatar.png').image,
        ),
        Positioned(
          width: MediaQuery.of(context).size.width * 0.63,
          bottom: 0,
          right: 0,
          child: IconButton(
            icon: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Padding(
                padding: EdgeInsets.all(2.0),
                child: Icon(
                  IconlyBold.edit,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
            onPressed: () => _pickImage(ImageSource.gallery),
          ),
        ),
      ],
    );
  }
}
