import 'package:flutter/material.dart';

class CardOptions extends StatelessWidget {

  const CardOptions({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Padding(
         padding: const EdgeInsets.all(16.0),
         child: SizedBox(
           width: 150,
           height: 250,
           child: Card(         
             child: Column(
               children: [
                 Icon(Icons.ac_unit_outlined),
                 Text('Comunicados'),
               ],
             ),
           ),
         ),
       );
  }
}