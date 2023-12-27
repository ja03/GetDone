import 'package:flutter/material.dart';


//--------Registration Pages----------//
import 'registration/landing.dart';
import 'registration/welcoming_two.dart';
import 'registration/login.dart';
import 'registration/signup.dart';
import 'registration/user_info.dart';
import 'registration/confirm_email.dart';
import 'registration/confirm_code.dart';
import 'registration/reset_pass.dart';

//--------Home Pages----------//
import 'home/home_page.dart';

//--------Profile Pages----------//
import 'profile/user_profile.dart';
import 'profile/edit_profile.dart';

//--------Tasks Pages----------//
import 'task/create_task.dart';
import 'task/close_call.dart';
import 'task/future_focus.dart';
import 'task/task_details.dart';
import 'task/edit_task.dart';

//--------Workspaces Pages----------//
import 'workspace/workspaces.dart';
import 'workspace/create_workspace.dart';
import 'workspace/workspace_details.dart';
import 'workspace/edit_workspace.dart';

// Firebase stuff
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
Future<void> main() async {
   // ensureInitialized Flutter
  WidgetsFlutterBinding.ensureInitialized();

   // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetDone',
      initialRoute: '/registration',
      routes: {
        '/registration': (context) => Landing(),
        '/registration/welcoming': (context) => WelcomingTwo(),
        '/registration/login': (context) => Login(),
        '/registration/signup': (context) => Signup(),
        '/registration/userInfo': (context) => UserInformation(),
        '/registration/confirmEmail': (context) => ConfirmEmail(),
        '/registration/confirmCode': (context) => ConfirmCode(),
        '/registration/resetPass': (context) => ResetPass(),
        '/home': (context) => Homepage(),
        '/profile': (context) => UserProfile(),
        '/profile/edit': (context) => EditProfile(),
        '/tasks/create': (context) => CreateTask(),
        '/tasks/close-call': (context) => CloseCall(),
        '/tasks/future-focus': (context) => FutureFocus(),
        '/tasks/task-details': (context) => TaskDets(),
        '/tasks/edit': (context) => EditTask(),
        '/workspaces': (context) => Workspaces(),
        '/workspaces/create': (context) => CreateWorkspace(),
        '/workspaces/workspace-details': (context) => WorkspaceDets(),
        '/workspaces/edit-worspace': (context) => EditWorkspace(),
      },
    );
  }
}
