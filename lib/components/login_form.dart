// // import 'package:abc/components/button.dart';
// // import 'package:abc/main.dart';
// // import 'package:abc/models/auth_model.dart';
// // import 'package:abc/utils/config.dart';
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// //
// // import '../providers/dio_provider.dart';
// //
// // class LoginForm extends StatefulWidget {
// //   const LoginForm({super.key});
// //
// //   @override
// //   State<LoginForm> createState() => _LoginFormState();
// // }
// //
// // class _LoginFormState extends State<LoginForm> {
// //   final _formKey = GlobalKey<FormState>();
// //   final _emailController = TextEditingController();
// //   final _passController = TextEditingController();
// //   bool obsecurePass = true;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Form(
// //       key: _formKey,
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.start,
// //         children: <Widget>[
// //           TextFormField(
// //             controller: _emailController,
// //             keyboardType: TextInputType.emailAddress,
// //             cursorColor: Config.primaryColor,
// //             decoration: const InputDecoration(
// //               hintText: 'Email Address',
// //               labelText: 'Email',
// //               alignLabelWithHint: true,
// //               prefixIcon: Icon(Icons.email_outlined),
// //               prefixIconColor: Config.primaryColor,
// //             ),
// //           ),
// //           Config.spaceSmall,
// //           TextFormField(
// //             controller: _passController,
// //             keyboardType: TextInputType.visiblePassword,
// //             cursorColor: Config.primaryColor,
// //             obscureText: obsecurePass,
// //             decoration:  InputDecoration(
// //               hintText: 'Password',
// //               labelText: 'Password',
// //               alignLabelWithHint: true,
// //               prefixIcon: const Icon(Icons.lock_outline),
// //               prefixIconColor: Config.primaryColor,
// //               suffixIcon: IconButton(onPressed: () {
// //                 setState(() {
// //                   obsecurePass = !obsecurePass;
// //                 });
// //               },
// //                   icon: obsecurePass ? const Icon(Icons.visibility_off_outlined, color: Colors.black38,) : const Icon(Icons.visibility_outlined, color: Config.primaryColor,))),
// //             ),
// // Config.spaceSmall,
// // Consumer<AuthModel>(
// //   builder: (context, auth, child) {
// //     return Button(
// //         width: double.infinity,
// //         title: 'Sign In',
// //         onPressed: () async {
// //
// //           final token = await DioProvider()
// //               .getToken(_emailController.text, _passController.text);
// //
// //           if(token) {
// //             auth.loginSuccess();
// //             MyApp.navigatorKey.currentState!.pushNamed('main');
// //           }
// //           //Navigator.of(context).pushNamed('main');
// //         },
// //         disable: false
// //     );
// //
// //   },
// // ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
// import 'package:abc/components/button.dart';
// import 'package:abc/main.dart';
// import 'package:abc/providers/dio_provider.dart';
// import 'package:abc/utils/config.dart';
// import 'package:flutter/material.dart';
//
// class LoginForm extends StatefulWidget {
//   const LoginForm({super.key});
//
//   @override
//   State<LoginForm> createState() => _LoginFormState();
// }
//
// class _LoginFormState extends State<LoginForm> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passController = TextEditingController();
//   bool obsecurePass = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           TextFormField(
//             controller: _emailController,
//             keyboardType: TextInputType.emailAddress,
//             cursorColor: Config.primaryColor,
//             decoration: const InputDecoration(
//               hintText: 'Email Address',
//               labelText: 'Email',
//               alignLabelWithHint: true,
//               prefixIcon: Icon(Icons.email_outlined),
//               prefixIconColor: Config.primaryColor,
//             ),
//           ),
//           Config.spaceSmall,
//           TextFormField(
//             controller: _passController,
//             keyboardType: TextInputType.visiblePassword,
//             cursorColor: Config.primaryColor,
//             obscureText: obsecurePass,
//             decoration: InputDecoration(
//               hintText: 'Password',
//               labelText: 'Password',
//               alignLabelWithHint: true,
//               prefixIcon: const Icon(Icons.lock_outline),
//               prefixIconColor: Config.primaryColor,
//               suffixIcon: IconButton(
//                 onPressed: () {
//                   setState(() {
//                     obsecurePass = !obsecurePass;
//                   });
//                 },
//                 icon: obsecurePass
//                     ? const Icon(
//                   Icons.visibility_off_outlined,
//                   color: Colors.black38,
//                 )
//                     : const Icon(
//                   Icons.visibility_outlined,
//                   color: Config.primaryColor,
//                 ),
//               ),
//             ),
//           ),
//           Config.spaceSmall,
//           Button(
//             width: double.infinity,
//             title: 'Sign In',
//             onPressed: () async {
//               final token = await DioProvider().getToken(_emailController.text, _passController.text);
//               // MyApp.navigatorKey.currentState!.pushNamed('main');
//               print(token.runtimeType);
//               // var user = await DioProvider().getUser(token);
//               // print(user);
//
//             },
//             disable: false,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:abc/components/button.dart';
import 'package:abc/main.dart';
import 'package:abc/models/auth_model.dart';
import 'package:abc/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/dio_provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool obsecurePass = true;

  @override
  Widget build(BuildContext context) {
      return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Config.primaryColor,
              decoration: const InputDecoration(
                hintText: 'Email Address',
                labelText: 'Email',
                alignLabelWithHint: true,
                prefixIcon: Icon(Icons.email_outlined),
                prefixIconColor: Config.primaryColor,
              ),
            ),
            Config.spaceSmall,
            TextFormField(
              controller: _passController,
              keyboardType: TextInputType.visiblePassword,
              cursorColor: Config.primaryColor,
              obscureText: obsecurePass,
              decoration:  InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                alignLabelWithHint: true,
                prefixIcon: const Icon(Icons.lock_outline),
                prefixIconColor: Config.primaryColor,
                suffixIcon: IconButton(onPressed: () {
                  setState(() {
                    obsecurePass = !obsecurePass;
                  });
                },
                    icon: obsecurePass ? const Icon(Icons.visibility_off_outlined, color: Colors.black38,) : const Icon(Icons.visibility_outlined, color: Config.primaryColor,))),
              ),
  Config.spaceSmall,
  Consumer<AuthModel>(
    builder: (context, auth, child) {
      return Button(
          width: double.infinity,
          title: 'Sign In',
          onPressed: () async {

            final token = await DioProvider()
                .getToken(_emailController.text, _passController.text);

            if(token) {
              auth.loginSuccess();
              MyApp.navigatorKey.currentState!.pushNamed('main');
            }

            //Navigator.of(context).pushNamed('main');
          },
          disable: false
      );

    },
  ),
          ],
        ),
      );
  }
}



