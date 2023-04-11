
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/text_string.dart';

class WelcomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const WelcomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return AppBar(
  leading: IconButton(onPressed: (){
        
        // Get.to(() => const MenuList(), transition :Transition.leftToRight,  duration: const Duration(milliseconds: 500));
        }, icon: const Icon(Icons.menu, color: Colors.black,)),      
        title: Text(tAppname, style: Theme.of(context).textTheme.headline4),
      centerTitle: true,
      elevation: 0,
      backgroundColor: tPrimaryColor,
      // actions: [
      //   Container(
         
      //     margin: const EdgeInsets.only(right: 0, top: 0) ,
      //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.black12),
          
      //     child: IconButton(onPressed: () { 
      //       Get.to(() => const MenuList());
      //       }, icon: const Icon(Icons.menu
      //       ), 
        
      //     )
      //     )
      // ],
    );
  } 

  @override
  // implement preferred size
  Size get preferredSize => const Size.fromHeight(55);
  

}