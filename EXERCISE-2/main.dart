import 'package:flutter/material.dart';

import 'EXERCISE-2/ui/screens/profile.dart';
import 'EXERCISE-2/data/profile_data.dart';
 
void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileApp(profile: ronanProfile,),
  ));
}
