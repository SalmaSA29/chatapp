import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
   UserImagePicker(this.imagePickFn);
  final void Function(File pickedimage) imagePickFn;
  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}
class _UserImagePickerState extends State<UserImagePicker> {
    XFile ?_pickedImage;
  Future<void> _pickImage()async{
    final ImagePicker picker = ImagePicker();
    XFile? imagePickedXFile = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 50, //3alashan el size bta3ha kan kber awi
      maxWidth: 150,
         );
     //File? imagefile = File(imageFromFile!.path);
    if(imagePickedXFile !=null){
      setState(() {
        _pickedImage =imagePickedXFile;
      });
    }
     File imagePickedFile = File(imagePickedXFile!.path);
    widget.imagePickFn(imagePickedFile);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
    //file image takes the file
    // that holds the image then create a connection and load that image
    //     CircleAvatar(
    //       radius: 20,
    //       backgroundImage: _pickedImage !=null? FileImage(imagefile):null,
    //     ),
      Container(
        child: Image.file(
        File(_pickedImage?.path??""),
        ),
        height: 80.0,
        width: 80.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // borderRadius: BorderRadius.circular(30),
          border: Border.all(color: const Color(0x33A6A6A6)),
        )

      ),

        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          onPressed: _pickImage,
          icon: Icon(Icons.camera_alt_outlined),
          label: Text('pick an image',
          ),),
      ],
    );
  }
}
