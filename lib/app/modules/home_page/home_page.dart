import 'package:colegio_juventude/app/modules/home_page/home_page_controller.dart';
import 'package:colegio_juventude/app/modules/home_page/widgets/card_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends GetView<HomePageController> {

  const HomePage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {

     //final HomePageController controller = Get.put(HomePageController());

     var size = MediaQuery.of(context).size.width;

     controller.recebeMediaQuery(MediaQuery.of(context).size);

     print('tamanho tela: ${controller.tamanhoTela}');

       return Scaffold(
           appBar: PreferredSize(
             preferredSize: controller.tamanhoAppBar,
             child: AppBar(             
               actions: [
                 IconButton(iconSize: controller.tamanhoIconesAppBar.width,onPressed: (){}, icon: Icon(Icons.ac_unit_sharp)),
                 PreferredSize(preferredSize: controller.tamanhoIconesAppBar,child: IconButton(onPressed: (){}, icon: Icon(Icons.access_alarms))),
                 PreferredSize(preferredSize: controller.tamanhoIconesAppBar,child: IconButton(onPressed: (){}, icon: Icon(Icons.image))),
                 PreferredSize(preferredSize: controller.tamanhoIconesAppBar,child: IconButton(onPressed: (){}, icon: Icon(Icons.import_export))),
               ],
               title: Text('AppBAR',style: TextStyle(fontSize: controller.textSize,),),),
           ),
           body: SizedBox(
             width: controller.widthMax,
             height: controller.heigthMax,
             child: Column(
               children: [
                 const CardOptions(),
                 const CardOptions(),

                     
                     /* Expanded(
                       flex: 3,
                       child: Container(
                         width: controller.widthMax *.9, height: 200,color: Colors.blue,
                         child: Padding(
                           padding: const EdgeInsets.all(20.0),
                           child: Container(width: controller.widthMax * .8,height: 100,color: Colors.black,
                           child: Text('oolllaa',style: TextStyle(fontSize: controller.textSize,color: Colors.white),),),
                         ),),
                     ),                   
                 
                 Expanded(flex: 3,child: Container(width: controller.widthMax *.9,height: 200,color: Colors.red,)),
                 Expanded(flex: 3,child: Container(width: controller.widthMax *.9,height: 200,color: Colors.green,)),
                 */
               ],
             ),
           ),
       );
  }
}