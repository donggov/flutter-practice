import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  File _imageFile;
  TextEditingController _captionController = TextEditingController();
  String _caption = "";
  bool _isLoading = false;

  _showSelectImageDialog() {
    return Platform.isIOS ? _iosBottomSheet() : _androidDialog();
  }

  _iosBottomSheet() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            title: Text("Add Photo"),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text("Take Photo"),
                onPressed: () => _handleImage(ImageSource.camera),
              ),
              CupertinoActionSheetAction(
                child: Text("Choose from gallery"),
                onPressed: () => _handleImage(ImageSource.gallery),
              )
            ],
            cancelButton: CupertinoActionSheetAction(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel")
            ),
          );
        }
    );
  }

  _androidDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text("Add Photo"),
          children: <Widget>[
            SimpleDialogOption(
              child: Text("Take Photo"),
              onPressed: () => _handleImage(ImageSource.camera),
            ),
            SimpleDialogOption(
              child: Text("Choose from gallery"),
              onPressed: () => _handleImage(ImageSource.gallery),
            ),
            SimpleDialogOption(
              child: Text("Cancel", style: TextStyle(color: Colors.redAccent),),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      }
    );
  }

  _handleImage(ImageSource source) async {
    Navigator.pop(context);
    File imageFile = await ImagePicker.pickImage(source: source);
    if (imageFile != null) {
      imageFile = await _cropImage(imageFile);
      setState(() {
        _imageFile = imageFile;
      });
    }
  }

  _cropImage(File imageFile) async {
    File croppedImage = await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
    );
    return croppedImage;
  }

  _submit() async {
    print("submit");
    print(_isLoading);
    print(_imageFile);

    if (!_isLoading && _imageFile != null && _caption.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });

      // todo : Save post

      // Reset data
      _captionController.clear();

      setState(() {
        _caption = "";
        _imageFile = null;
        _isLoading = false;
      });

      // todo : move to feed
//      _pageController.


    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Create Post',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _submit,
          )
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            height: height,
            child: Column(
              children: <Widget>[
                _isLoading
                  ? Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.blue[200],
                        valueColor: AlwaysStoppedAnimation(Colors.blue),
                      ),
                    )
                  : SizedBox.shrink(),
                GestureDetector(
                  onTap: _showSelectImageDialog,
                  child: Container(
                    width: width,
                    height: width,
                    color: Colors.grey[300],
                    child: _imageFile == null ? Icon(
                      Icons.add_a_photo,
                      color: Colors.white70,
                      size: 150.0,
                    )
                    : Image(image: FileImage(_imageFile), fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 20.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextField(
                    controller: _captionController,
                    style: TextStyle(fontSize: 18.0),
                    decoration: InputDecoration(
                      labelText: 'Caption',
                    ),
                    onChanged: (input) => _caption = input,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
