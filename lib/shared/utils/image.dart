import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File?> pickImage(ImageSource source) async {
  File? image;
  final picker = ImagePicker();
  final file = await picker.pickImage(
    source: source,
    maxHeight: 720,
    maxWidth: 720,
  );

  if (file != null) {
    image = File(file.path);
  }

  return image;
}
