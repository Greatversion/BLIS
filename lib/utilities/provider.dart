// TextFormField(
//                 // controller: passController,
//                 // obscureText: isShow,
//                 decoration: InputDecoration(
//                     filled: true,
//                     // fillColor: const Color(0xFFFE9F02),
//                     labelText: "Enter Your Name",
//                     floatingLabelStyle: const TextStyle(
//                         fontSize: 1,
//                         // color: Color(0xFFFE9F02),
//                         fontWeight: FontWeight.bold),
//                     labelStyle: const TextStyle(
//                         color: Color(0xFF212B66), fontWeight: FontWeight.bold),
//                     prefixIcon: const Icon(Icons.verified_user_sharp),
//                     prefixIconColor: const Color(0xFF212B66),
//                     suffixIcon: InkWell(
//                       onTap: () {
//                         // if (isShow == true) {
//                         //   setState(() {
//                         //     isShow = false;
//                         //   });
//                         // } else {
//                         //   setState(() {
//                         //     isShow = true;
//                         //   });
//                         // }
//                       },
//                       child: const Icon(Icons.remove_red_eye_rounded),
//                     ),
//                     suffixIconColor: const Color(0xFF212B66),
//                     hintText: "XXXXXXX",
//                     focusedBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(
//                           width: 10,
//                           // color: Color.fromARGB(255, 255, 255, 255),
//                         ),
//                         borderRadius: BorderRadius.all(Radius.circular(50))),
//                     border: const OutlineInputBorder(
//                         borderSide: BorderSide(
//                           width: 10,
//                           // color: Color(0xFFFE9F02),
//                         ),
//                         borderRadius: BorderRadius.all(Radius.circular(50)))),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please Enter a Password';
//                   } else if (value.length <= 8) {
//                     return 'Please Enter a Password of more than 8 characters';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 // controller: passController,
//                 // obscureText: isShow,
//                 decoration: InputDecoration(
//                     filled: true,
//                     // fillColor: const Color(0xFFFE9F02),
//                     labelText: "Enter Your Password",
//                     floatingLabelStyle: const TextStyle(
//                         fontSize: 1,
//                         // color: Color(0xFFFE9F02),
//                         fontWeight: FontWeight.bold),
//                     labelStyle: const TextStyle(
//                         color: Color(0xFF212B66), fontWeight: FontWeight.bold),
//                     prefixIcon: const Icon(Icons.lock),
//                     prefixIconColor: const Color(0xFF212B66),
//                     suffixIcon: InkWell(
//                       onTap: () {
//                         // if (isShow == true) {
//                         //   setState(() {
//                         //     isShow = false;
//                         //   });
//                         // } else {
//                         //   setState(() {
//                         //     isShow = true;
//                         //   });
//                         // }
//                       },
//                       child: const Icon(Icons.remove_red_eye_rounded),
//                     ),
//                     suffixIconColor: const Color(0xFF212B66),
//                     hintText: "XXXXXXX",
//                     focusedBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(
//                           width: 10,
//                           // color: Color.fromARGB(255, 255, 255, 255),
//                         ),
//                         borderRadius: BorderRadius.all(Radius.circular(50))),
//                     border: const OutlineInputBorder(
//                         borderSide: BorderSide(
//                           width: 10,
//                           // color: Color(0xFFFE9F02),
//                         ),
//                         borderRadius: BorderRadius.all(Radius.circular(50)))),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please Enter a Password';
//                   } else if (value.length <= 8) {
//                     return 'Please Enter a Password of more than 8 characters';
//                   }
//                   return null;
//                 },
//               ),