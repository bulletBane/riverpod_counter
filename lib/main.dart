import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter/riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: RiverpodGlobalScopeHomePage(title: 'Flutter Demo Home Page'),
      home: HomePage(),
    );
  }
}

class RiverpodProviderHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context,
      T Function<T>(ProviderBase<Object, T> provider) watch) {
    final counterValue = watch(counterProvider.state);
    return Center(
      child: Text(
        counterValue.toString(),
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RiverpodProviderHomePage(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          context.read(counterProvider).increment();
        },
      ),
    );
  }
}

// class RiverpodGlobalScopeHomePage extends StatefulWidget {
//   RiverpodGlobalScopeHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _RiverpodGlobalScopeHomePageState createState() => _RiverpodGlobalScopeHomePageState();
// }

// class _RiverpodGlobalScopeHomePageState extends State<RiverpodGlobalScopeHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Consumer(
//               builder: (context, watch, child) => Text(
//                 '${watch(counterVal).state}',
//                 style: Theme.of(context).textTheme.headline4,
//               ),
//             ),
//             FlatButton(
//                 onPressed: () {
//                   debugPrint('pressed');
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => NewPage()));
//                 },
//                 child: Text('open new page'))
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           context.read(counterVal).state++;
//         },
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// class NewPage extends StatefulWidget {
//   NewPage({Key key}) : super(key: key);

//   @override
//   _NewPageState createState() => _NewPageState();
// }

// class _NewPageState extends State<NewPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Consumer(
//             builder: (context, watch, child) => Text(
//                   '${watch(counterVal).state}',
//                   style: Theme.of(context).textTheme.headline1,
//                 )),
//       ),
//     );
//   }
// }
