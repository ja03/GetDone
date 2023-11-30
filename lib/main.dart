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

//--------Workspaces Pages----------//
import 'workspace/workspaces.dart';
import 'workspace/create_workspace.dart';
import 'workspace/workspace_details.dart';
import 'workspace/edit_workspace.dart';

// import 'authentication/registration_screen.dart';
// import 'home/home_screen.dart';
// import 'home/home_detail_screen.dart';
// import 'profile/profile_screen.dart';
// import 'profile/profile_settings_screen.dart';
// import 'tasks/tasks_screen.dart';
// import 'tasks/create_task_screen.dart';
// import 'tasks/task_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetDone',
      initialRoute: '/home',
      routes: {
        '/registration': (context) => Landing(),
        '/registration/welcoming': (context) => WelcomingTwo(),
        '/registration/login': (context) => Login(),
        '/registration/signup': (context) => Signup(),
        '/registration/userInfo': (context) => UserInfo(),
        '/registration/confirmEmail': (context) => ConfirmEmail(),
        '/registration/confirmCode': (context) => ConfirmCode(),
        '/registration/resetPass': (context) => ResetPass(),
        '/home': (context) => Homepage(),
        '/profile': (context) => UserProfile(),
        '/profile/edit': (context) => EditProfile(),
        '/tasks/create': (context) => CreateTask(),
        '/tasks/close-call': (context) => CloseCall(),
        '/tasks/future-focus': (context) => FutureFocus(),
        '/workspaces': (context) => Workspaces(),
        '/workspaces/create': (context) => CreateWorkspace(),
        '/workspaces/workspace-details': (context) => WorkspaceDets(),
        '/workspaces/edit-worspace': (context) => EditWorkspace(),
        // '/profile': (context) => ProfileScreen(),
        // '/profile/settings': (context) => ProfileSettingsScreen(),
        // '/tasks': (context) => TasksScreen(),
        // '/tasks/create': (context) => CreateTaskScreen(),
      },
      // onGenerateRoute: (settings) {
      //   if (settings.name == '/tasks/detail') {
      //     // Extract the task ID from the arguments
      //     final String taskId = settings.arguments as String;
      //     return MaterialPageRoute(
      //       builder: (context) => TaskDetailScreen(taskId: taskId),
      //     );
      //   }
      //   return null;
      // },
    );
  }
}
