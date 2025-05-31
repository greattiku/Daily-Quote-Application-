// import 'package:daily_qoutes_app/Screens/quote_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Quote extends StatelessWidget {
//   const Quote({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(15.0),
//       child: Center(
//         child: Column(mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: double.infinity,
//               height: 400,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 boxShadow: [
//                   BoxShadow(color: Colors.blueAccent,spreadRadius: 4,
//                   blurRadius: 3
//                   )
//                 ],
//                 color: Colors.white
//               ),
//               child: Obx(()=>
//                  Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                    children: [
//                      Text('"${controller.dailyQuote.value.text}"',
//                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
//                       Text('-${controller.dailyQuote.value.author}'),
//                    ],
//                  ),
//               ),
//             ),
//             Row(mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Obx(()=>
//                    Checkbox(
//                    // fillColor: Colors.blueAccent,
//                     value: controller.favoriteQuotes.contains(controller.dailyQuote.value) , 
//                     onChanged: (value)=> controller.toggleFavorite(controller.dailyQuote.value),),
//                 ),
//                 Text('Click to add to Favourite'),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }