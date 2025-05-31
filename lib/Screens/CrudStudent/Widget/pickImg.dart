
import 'package:file_picker/file_picker.dart';

pickImg()async{
  
  try{
  final _picker = FilePicker.platform;
  final _image = await _picker.pickFiles();

  final _imageDetails = _image?.files[0];

  print(_imageDetails?.name);
  print(_imageDetails?.path);
  print(_imageDetails?.size);

  }catch(e){
    print("Error picking image: $e");
  }

}