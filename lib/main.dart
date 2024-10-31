import 'package:flutter/material.dart';
import 'package:tugassatu/page/edit_profile.dart';

void main(){
runApp(myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EditProfile(),
    );
}
}