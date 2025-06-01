
import 'package:file_picker/file_picker.dart';

Future<Map<String, dynamic>?> pickImg() async {
  try {
    final picker = FilePicker.platform;
    final picked = await picker.pickFiles(withData: true,);

    final imagedata = picked?.files[0];
    if(imagedata!= null) {
       return {
        'originalname': imagedata.name,
        'bytes': imagedata.bytes,
       };
    }

  } catch (e) {
    print("Error picking image: $e");
    return null;
  }
  return null;
}

