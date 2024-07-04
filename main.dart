import 'package:flutter/material.dart';
import 'package:navigator_all_methods_app/newscreen.dart';
import 'package:navigator_all_methods_app/screen1.dart';
import 'package:navigator_all_methods_app/screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator Methods Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/screen1': (context) => const Screen1(),
        '/screen2': (context) => const Screen2(),
        '/newScreen': (context) => const NewScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator Methods Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Screen1()),
                );
              },
              child: const Text('Push'),

              //Navigator.push() is used in Flutter to navigate to a new route (screen)
              // by adding that route to the navigation stack.
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Pop'),

              //Navigator.pop() is used in Flutter to remove the current route from the
              // navigation stack, effectively navigating back to the previous screen.
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Screen1()),
                );
              },
              child: const Text('Push Replacement'),
              //If you don't want the user to be able to navigate back to the previous screen,
              // Navigator.pushReplacement ensures that the current route is replaced and thus removed from the stack.
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/screen2');
              },
              child: const Text('Pop and Push Named'),
              //same as push replacement
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/screen1');
              },
              child: const Text('Push Named'),
              //used to navigate to a new route by specifying a named route.
              // provide a cleaner and more maintainable way to manage navigation
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/newScreen',
                  (route) => false,
                );
              },
              child: const Text('Push Named and Remove Until'),
              //used to navigate to a new route and remove routes
              // from the navigation stack until a certain condition is met.
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Screen1()),
                  (route) => false,
                );
              },
              child: const Text('Push and Remove Until'),
              //same as push named and remove until
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text('Pop Until'),
              //method allows you to programmatically control how far back in the navigation stack you want to go,
            ),
            ElevatedButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: const Text('Can Pop'),
              // used to check whether it's possible to pop (navigate back) from the current route. It returns a boolean
              // value indicating whether there are any routes in the navigation stack that can be popped.
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.maybePop(context);
              },
              child: const Text('Maybe Pop'),
              // used to attempt to pop (close) the current route if possible.
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/screen1');
              },
              child: const Text('Push Replacement Named'),
              //used in Flutter to navigate to a new route
              // while replacing the current route in the navigation stack with the new route.
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.restorablePush(
                  context,
                  (context, arguments) => MaterialPageRoute(
                    builder: (context) => const Screen1(),
                  ),
                );
              },
              child: const Text('Restorable Push'),
              //to push a new route onto the navigation stack with the
              // ability to restore its state after the app is terminated and restarted.
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.restorablePopAndPushNamed(context, '/newScreen');
              },
              child: const Text('Restorable Pop and Push Named'),
              //used to pop (remove) the current route from the navigation
              // stack and then push a new named route onto the stack while
              // preserving the state of the new route across app restarts.
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.restorablePushNamed(context, '/screen1');
              },
              child: const Text('Restorable Push Named'),
              //used in Flutter to handle navigation in a way that can
              // be restored if the app is terminated and later restored by the operating system.
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.restorablePushNamedAndRemoveUntil(
                  context,
                  '/newScreen',
                  (route) => false,
                );
              },
              child: const Text('Restorable Push Named and Remove Until'),
              //used in Flutter for navigation that not only pushes a new route
              // onto the stack but also removes routes from the stack until a specified condition is met.
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.restorablePushAndRemoveUntil(
                  context,
                  (context, arguments) => MaterialPageRoute(
                    builder: (context) => const Screen1(),
                  ),
                  (route) => false,
                );
              },
              child: const Text('Restorable Push and Remove Until'),
              //used to push a new route onto the navigation stack
              // while removing all the routes that are currently on top of a specified route.
            ),
          ],
        ),
      ),
    );
  }
}
