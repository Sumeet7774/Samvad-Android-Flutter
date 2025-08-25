import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:samvad/custom/custom_motion_toast_message.dart';

class SignUpProfilePicker extends StatefulWidget {
  final void Function(XFile?) onPhotoSelected;

  const SignUpProfilePicker({super.key, required this.onPhotoSelected});

  @override
  State<SignUpProfilePicker> createState() => _SignUpProfilePickerState();
}

class _SignUpProfilePickerState extends State<SignUpProfilePicker> {
  XFile? _profilePhoto;

  Future<void> _pickProfilePhoto() async {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.white,
          title: const Text("Select Profile Photo"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.blue),
                title: const Text("Take a photo"),
                onTap: () async {
                  Navigator.pop(ctx);
                  final pickedImage = await ImagePicker().pickImage(
                    source: ImageSource.camera,
                  );
                  if (pickedImage != null) {
                    setState(() => _profilePhoto = pickedImage);
                    widget.onPhotoSelected(_profilePhoto);
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library, color: Colors.green),
                title: const Text("Choose from gallery"),
                onTap: () async {
                  Navigator.pop(ctx);
                  final pickedImage = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                  );
                  if (pickedImage != null) {
                    setState(() => _profilePhoto = pickedImage);
                    widget.onPhotoSelected(_profilePhoto);
                  }
                },
              ),
              if (_profilePhoto != null)
                ListTile(
                  leading: const Icon(Icons.delete, color: Colors.red),
                  title: const Text("Remove photo"),
                  onTap: () {
                    Navigator.pop(ctx);
                    setState(() => _profilePhoto = null);
                    widget.onPhotoSelected(null);
                    CustomToast.warningToast(context, "Profile photo removed.");
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickProfilePhoto,
      child: CircleAvatar(
        radius: 60.r,
        backgroundColor: Colors.white24,
        backgroundImage: _profilePhoto != null
            ? FileImage(File(_profilePhoto!.path))
            : null,
        child: _profilePhoto == null
            ? Icon(Icons.camera_alt, size: 40.sp, color: Colors.white)
            : null,
      ),
    );
  }
}
