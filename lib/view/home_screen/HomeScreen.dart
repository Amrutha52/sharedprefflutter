import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  String? action = 'a';
  late final SharedPreferences prefs;
  @override
  void initState() {
    init();
    super.initState();
  }
  init() async {
    // Obtain shared preferences.
    prefs = await SharedPreferences.getInstance();
  }
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
            ),
            SizedBox(height: 10,),
            Text(action!, style: TextStyle(color: Colors.blue, fontSize: 20),),
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){
                  // Try reading data from the 'action' key. If it doesn't exist, returns null.
                  action = prefs.getString('myData');
                  print(prefs.getString('myData'));
                  setState(() {

                  });
                },
                child: Text("Read")),
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: () async {


                  // Save an String value to 'action' key.
                  prefs.setString('myData', controller.text);

                  setState(() {

                  });
                },
                child: Text("Write"))
          ],
        ),
      ),
    );
  }
}
