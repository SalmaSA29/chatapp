
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../reusable_components.dart';

class Payslip extends StatefulWidget {
  const Payslip({Key? key}) : super(key: key);

  @override
  State<Payslip> createState() => _PayslipState();
}

class _PayslipState extends State<Payslip> {
  var fem = 1.0;
  var ffem = 1.0;
  final numericRange = RegExp(r'\d');
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final TextEditingController code = TextEditingController();
  final TextEditingController email = TextEditingController();
   TextEditingController pass = TextEditingController();
   TextEditingController confirmPass = TextEditingController();

  bool isPassword = true;
  bool confirmPassword = true;

  DatabaseReference ref = FirebaseDatabase.instance.ref('users');

  @override
  Widget build(BuildContext context) {

    Future popUp() async {
      showDialog(
        context: context ,
        builder: (context) => AlertDialog(
          backgroundColor:Colors.black,
          title: Text('Are You Sure You Want To Save?',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () async{
              final reset = FirebaseDatabase.instance.ref('users');
                await reset.set({
                  "email": email.text,
                  "password": confirmPass.text,
                         });
                         print('done');
                                },
              child: Text('SUBMIT',
              style: TextStyle(color: Colors.white),),

            )
          ],

        ),);
    }




    double height= MediaQuery.of(context).size.height;


    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new),
        backgroundColor: const Color(0xff021d2e),
        elevation: 0.0,
      ),
      body: Container(
        // iphone14promax1Dfx (1:2)
        width: double.infinity,
        height: 932 * fem,
        decoration: const BoxDecoration (
          color: Color(0xffffffff),
        ),
        child:
        Stack(
          children: [
            Positioned(
              // rectangle1VNa (3:4)
              left: 0 * fem,
              top: 0 * fem,
              child:
              Align(
                child:
                SizedBox(
                  width: 430 * fem,
                  height: 576 * fem,
                  child:
                  Container(
                    decoration: const BoxDecoration (
                      color: Color(0xff0e3b5a),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // mainbackground15ra (3:3)
              left: 0 * fem,
              top: 350 * fem,
              child:
              Align(
                child:
                SizedBox(
                  width: 430 * fem,
                  height: 368 * fem,
                  child:
                  const Image(image: AssetImage('assets/img.jpg'),),
                  //Image.network('https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80'),
                ),
              ),
            ),
            Positioned(
              // rectangle2aDB (3:7)
              left:  0*fem,
              top:  0*fem,
              child:
              Align(
                child:
                SizedBox(
                  width:  430*fem,
                  height:  388*fem,
                  child:
                  Container(
                    decoration:  const BoxDecoration (
                      gradient:  LinearGradient (
                        begin:  Alignment(0, -1),
                        end:  Alignment(0, 1),
                        colors:  <Color>[Color(0xff021d2e), Color(0x00021d2e)],
                        stops:  <double>[0, 1],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Form(
              key: form,
              child :
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Center(
                            child: Column(
                              children: [
                                const SizedBox(
                                    height: 40.0
                                ),
                                Text(

                                  'Payslip',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 24 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125 * ffem / fem,
                                    color: const Color(0xffffffff),
                                  ),
                                ),//payslip layer
                                  SizedBox(
                                    height : height * 0.05
                                ),//SPACING
                                SizedBox(
                                  width: 283 * fem,
                                  height: 25 * fem,
                                  child:
                                  Text(
                                    'Request To Change Password',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2125 * ffem / fem,
                                      color: const Color(0xffffffff),
                                    ),
                                  ),
                                ),//request to change password layer
                                const SizedBox(
                                    height: 20.0
                                ),//SPACING
                                SizedBox(
                                  width: 277 * fem,
                                  height: 39 * fem,
                                  child:
//--------------------------------------------------------------------------------------------------
                                  //EMAIL ADDRESS
//--------------------------------------------------------------------------------------------------
                                  textformfield(
                                      controller: email,
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'This Field Is Required';
                                        }
                                        else {
                                          return null;
                                        }
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      labelText: 'Email Adress',
                                      prefixIcon: Icons.email_outlined),
                                ),//email address
                                const SizedBox(
                                    height: 20.0
                                ),//SPACING
                                SizedBox(
                                  width: 277 * fem,
                                  height: 39 * fem,
                                  child:
//--------------------------------------------------------------------------------------------------
                                  //CODE VERIFICATION
//--------------------------------------------------------------------------------------------------
                                  textformfield(
                                      controller: code,
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'This Field Is Required';
                                        }
                                        else {
                                          return null;
                                        }
                                      },
                                      keyboardType: TextInputType.text,
                                      labelText: 'Validation Code',
                                      prefixIcon: Icons.verified_outlined),
                                ),//validation code
                                const SizedBox(
                                    height: 20.0
                                ),//SPACING
                                SizedBox(
                                  width: 277 * fem,
                                  height: 39 * fem,
                                  child:
//--------------------------------------------------------------------------------------------------
                                  //PASSWORD CREATION
//--------------------------------------------------------------------------------------------------

                                  textformfield(
                                      controller: pass,
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'This Field Is Required';
                                        }
                                        else if(!numericRange.hasMatch(value)){
                                          return 'your password should contain at least 1 number ';
                                        }
                                        else {
                                          return null;
                                        }
                                      },
                                      keyboardType: TextInputType.visiblePassword,
                                      labelText: 'New Password',
                                      prefixIcon: Icons.key,
                                      Ispassword: isPassword,
                                      suffixIconPressed: () {
                                        setState(() {
                                          isPassword = !isPassword;

                                        });
                                      },
                                      suffixIcon: isPassword?Icons.visibility_off_outlined: Icons.visibility_outlined,
                                  ),
                                ),//new pass
                                const SizedBox(
                                    height: 20.0
                                ),//SPACING
                                SizedBox(
                                  width: 277 * fem,
                                  height: 39 * fem,
                                  child:
//--------------------------------------------------------------------------------------------------
                                  //CONFIRM YOUR PASSWORD
//--------------------------------------------------------------------------------------------------
                                  textformfield(
                                      controller: confirmPass,
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'This Field Is Required';
                                        }
                                        else if (pass.text!=confirmPass.text){
                                          return 'password is no match';
                                        }
                                        else {
                                          return null;
                                        }
                                      },
                                      keyboardType: TextInputType.visiblePassword,
                                      labelText: 'Confirm Password',
                                      prefixIcon: Icons.key,
                                      Ispassword: confirmPassword,
                                      suffixIconPressed: () {
                                        setState(() {
                                          confirmPassword = !confirmPassword;
                                        });
                                      },
                                      suffixIcon:confirmPassword?Icons.visibility_off_outlined: Icons.visibility_outlined,


                                  ),
                                ),//confirm pass
                                const SizedBox(
                                    height: 20.0
                                ),//SPACING
                                Container(
                                  width: 140 * fem,
                                  height: 36 * fem,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10 * fem),
                                  ),
                                  child:
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10 * fem),
                                      color: const Color(0xff0f3c5b),
                                    ),
                                    child:
                                    // AnimatedButton(
                                    //     text: 'Save',
                                    //     buttonTextStyle: TextStyle(
                                    //       fontSize:  20*ffem,
                                    //       fontWeight:  FontWeight.w400,
                                    //       height:  1.2125*ffem/fem,
                                    //       color:  Color(0xffffffff),
                                    //     ),
                                    //     color:Color(0xff0f3c5b),
                                    //     borderRadius: BorderRadius.circular(10*fem),
                                    //     pressEvent: () {
                                    //       AwesomeDialog(
                                    //         context: context,
                                    //         dialogType: DialogType.question,
                                    //         animType: AnimType.bottomSlide,
                                    //         showCloseIcon: true,
                                    //         desc: 'Are You Sure That You Want To Change Your Password?',
                                    //         btnCancelOnPress: () {},
                                    //         btnOkOnPress: () {},
                                    //       ).show();
                                    //     })
                                    MaterialButton(
                                      // onPressed: () async{
                                      //   final reset = FirebaseDatabase.instance.ref('users/-NRSSP3d2CfH4x0t6AZC');
                                      //   if (form.currentState!.validate()) {
                                      //     await reset.update({
                                      //       "email": email.text,
                                      //       "password": confirmPass.text,
                                      //     });
                                      //     print('done');
                                      //   }else {
                                      //     print('no data');
                                      //   }
                                      // },
                                      onPressed: () {
                                        if (form.currentState!.validate()){
                                          popUp();
                                        }
                                        else {
                                          print('no data');
                                        }
                                      },
                                      child:
                                      Center(
                                        child:
                                        SizedBox(
                                          width: 47 * fem,
                                          height: 25 * fem,
                                          child:
                                          Text(
                                            'Save',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 20 * ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.2125 * ffem / fem,
                                              color: const Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),//the save button

                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),


            ),

          ],
        ),
      ),
    );
  }
}
//  void register(email, pass,confirmpass){
//    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.toString(),
//        password: pass.toString()).then((value) {
//      print(value.user?.email);
//      print(value.user?.uid);
// });}


