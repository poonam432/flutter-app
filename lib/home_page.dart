import 'package:flutter/material.dart';

import 'landing_view.dart';
import 'tab_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _counter = 0;
  List<dynamic> filterList = ['All', 'Men', 'Women', "Kids"];

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TabController? tabController;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  List<Widget>? businessCoordTabs = [
    Container(
        padding: const EdgeInsets.all(8.0),
        child: Tab(text: 'New Registration')),
    Container(
        padding: const EdgeInsets.all(8.0),
        child: Tab(text: 'Registration History'))
  ];
  int initPosition = 1;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: filterList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.redAccent,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shien',
            ),
            Row(
              children: [
                Icon(Icons.search),
                SizedBox(
                  width: 15.0,
                ),
                Icon(Icons.shopping_cart)
              ],
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: PlainTabView(
          initPosition: initPosition,
          itemCount: filterList.length,
          tabBuilder: (context, index) => Tab(
            text: filterList[index],
          ),
          pageBuilder: (context, index) => Center(
              child: index == 0
                  ? const LandingView()
                  : index == 1
                      ? Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              TextField(
                                controller: nameController,
                              ),
                              TextField(
                                controller: phoneController,
                              ),
                              TextField(
                                controller: emailController,
                              ),
                              const SizedBox(height: 20,),
                              FloatingActionButton(
                                onPressed: () {
                                  print(nameController.text);
                                  print(phoneController.text);
                                  print(emailController.text);
                                },
                                tooltip: 'Increment',
                                child: Text('Submit'),
                              ),

                            ],
                          ),
                        )
                      : Text(
                          filterList[index],
                          style: TextStyle(color: Colors.black26),
                        )),
          onPositionChange: (index) {
            print('current position: $index');
            initPosition = index;
          },
          onScroll: (position) => print('$position'),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
