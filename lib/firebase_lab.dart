import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;

class FirebaseLabPage extends StatefulWidget {
  @override
  _FirebaseLabPageState createState() => _FirebaseLabPageState();
}

class _FirebaseLabPageState extends State<FirebaseLabPage> {
  final firebaseAuth = fb.auth();
  final formKey = GlobalKey<FormState>();
  String email;
  String password;
  fb.User user;

  void login() async {
    formKey.currentState.save();
    await firebaseAuth.signInWithEmailAndPassword(email, password);
    setState(() {
      user = firebaseAuth.currentUser;
    });
    print(user.displayName);
  }

  void logout() async {
    setState(() {
      user = null;
    });
  }

  void updateProfile() async {
    final profile = fb.UserProfile();
    profile.displayName = 'Another Name';
    profile.photoURL = '';
    final user = fb.auth().currentUser;
    await user.updateProfile(profile);
    await user.reload();
    print(user.displayName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Lab'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'email'),
                onSaved: (value) => email = value,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'password'),
                onSaved: (value) => password = value,
              ),
              user == null
                  ? RaisedButton(
                      child: Text('login'),
                      onPressed: login,
                    )
                  : RaisedButton(
                      child: Text('logout'),
                      onPressed: logout,
                    ),
              RaisedButton(
                child: Text('test'),
                onPressed: updateProfile,
              )
            ],
          ),
        ),
      ),
    );
  }
}
