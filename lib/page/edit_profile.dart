import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tugassatu/page/profile.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final globalKey = GlobalKey<ScaffoldState>();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body: Container(
        padding: EdgeInsets.only(
          top: 64,
          bottom: 64,
          left: 24,
          right: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Text(
                'EDIT PROFILE',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            Container(
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Your Name',
                ),
              ),
            ),
            Container(
              height: 48,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  backgroundColor: Colors.blueAccent,
                ),
                child: Text(
                  'Update',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                onPressed: () {
                  if (nameController.text.isEmpty) {
                    // Show toast or snackbar if name is empty
                    showSnackBar('Please input your name');
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile(),
                      ),
                    );
                    // Handle successful name update here
                    // For example, save the name or navigate back
                    // showToast('Name updated successfully!'); // Optional
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showToast(String text) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black.withOpacity(0.5),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void showSnackBar(String text) {
    final snackBar = SnackBar(
      content: Text(text),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          print('Clicked Undo!');
        },
      ),
    );
    globalKey.currentState?.showSnackBar(snackBar); // Fixed variable name
  }
}

extension on ScaffoldState? {
  void showSnackBar(SnackBar snackBar) {}
}
