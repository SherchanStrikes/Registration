import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class toast extends StatefulWidget {
  const toast({Key? key}) : super(key: key);

  @override
  _toastState createState() => _toastState();
}

class _toastState extends State<toast> {
  TextEditingController user = TextEditingController();
  TextEditingController pw = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Menu"),
            ),
            ListTile(
              title: const Text("Call"),
              leading: const Icon(Icons.phone),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Email"),
              leading: const Icon(Icons.email),
              onTap: () {},
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Welcome To Facebook"),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Username must be filled!!";
                    }
                    return null;
                  },
                  controller: user,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: 'Enter your username',
                    labelText: 'Username',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password must be filled!!";
                    }
                    return null;
                  },
                  controller: pw,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      hintText: "Enter your password", labelText: "Password"),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      setState(() {

                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Something Wrong!')));
                    }
                  },
                  child: const Text('Signup'),
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    const Text(
                  "Already have an account?",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.purple,
                    fontStyle: FontStyle.italic,

                  ),
                ),
                  ElevatedButton(onPressed: (){}, child: const Text("Login"))
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
