import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignUpImageCubit extends Cubit<File?> {
  SignUpImageCubit() : super(null);

  Future<void> pickImage() async {
    final image = ImagePicker();
    final pickedImage = await image.pickImage(source: ImageSource.camera);
    // final pickedImage = await image.pickImage(source: ImageSource.gallery);
    emit(pickedImage == null ? null : File(pickedImage.path));
  }
}
