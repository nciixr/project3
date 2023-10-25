//import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project3/screen/saved_places.dart';


class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final _emailController = TextEditingController();
  final _passwordControoler = TextEditingController();
  final _confirmpasswordControoler = TextEditingController();
  final _usernameController = TextEditingController();

  Future signup() async {
    if (passwordConfirm()){
      //await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim();
        password: _passwordControoler.text.trim();
      //);
      Navigator.of(context).pushNamed('/');
    }
  }
  bool passwordConfirm(){
    if (_passwordControoler.text.trim() ==
        _confirmpasswordControoler.text.trim()){
      return true;
    } else {
      return false;
    }

  }

  void openSignup(){
    Navigator.of(context).pushReplacementNamed('signup');
  }
  void saved(){
    Navigator.of(context).pushReplacementNamed('saved_places');
  }


  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordControoler.dispose();
    _confirmpasswordControoler.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 235, 235),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              //Title
              Text(
                'Sign Up',
                style: GoogleFonts.robotoCondensed(
                    fontSize: 40, fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 71, 69, 69)),
              ),
              //subtitle
              Text(
                'Welcome Here you can Sign Up',
                style: GoogleFonts.robotoCondensed(fontSize: 18),
              ),
            SizedBox(height: 40,),
            TextField(cursorColor: Colors.black,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.0),
                labelText: 'User Name',
                hintText: 'Full Nmae',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
                prefixIcon: Icon(Icons.supervised_user_circle_outlined, color: Colors.black, size: 18, ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade100, width: 2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                floatingLabelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                      ),
                    ),
            SizedBox(height: 20,),
            TextField(cursorColor: Colors.black,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.0),
                labelText: 'Phone NO',
                hintText: 'Phone Number',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
                prefixIcon: Icon(Icons.phone_android, color: Colors.black, size: 18, ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade100, width: 2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                floatingLabelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                      ),
                    ),
            SizedBox(height: 20,),
            TextField(cursorColor: Colors.black,
              controller: _passwordControoler ,
              obscureText: true,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.visibility_off,color: Colors.grey,),
                contentPadding: EdgeInsets.all(0.0),
                labelText: 'Password',
                hintText: 'Password',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,

                ),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
                prefixIcon: Icon(Icons.admin_panel_settings_sharp, color: Colors.black, size: 18, ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade100, width: 2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                floatingLabelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                      ),
                    ),

            SizedBox(height: 20,),
            TextField(cursorColor: Colors.black,
              controller: _confirmpasswordControoler,
              obscureText: true,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.visibility_off,color: Colors.grey,),
                contentPadding: EdgeInsets.all(0.0),
                labelText: 'Confirm',
                hintText: 'Confirm Password',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
                prefixIcon: Icon(Icons.admin_panel_settings_sharp, color: Colors.black, size: 18, ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade100, width: 2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                floatingLabelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                      ),
                    ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: saved,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Color(0xffc4dde0))
                    ,
                        //borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: Text(
                          'Sign UP',
                          style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //text_signUp
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'I agree with',
                  style: GoogleFonts.robotoCondensed(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: openSignup,
                  child: Text(
                    'Terms & Condition', // توديني لصفحه التسجيل بس ما تفعلت
                    style: GoogleFonts.robotoCondensed(
                      color: Color.fromRGBO(113, 180, 177, 0.984),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ])
            ]),
          ),
        ),
      ),
    );
  }
}



