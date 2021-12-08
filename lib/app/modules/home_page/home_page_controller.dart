import 'package:colegio_juventude/app/UI/breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePageController extends GetxController { 

  
  late Size _size;

  void recebeMediaQuery(Size query){
      _size = query;
  }

  Size get tamanhoTela => _size;

  @override
  void onInit() {   
    super.onInit();

  }
  

  //tamanho do Texto
  double get textSize{    
    if (_size.width <= tabletBreakPoint){      
      return 12.0;      
    } else if (_size.width <= webBreakPoint){      
      return 14.0;      
    }
    
    return 16.0;
  }

  double get widthMax => _size.width;
  double get heigthMax => _size.height;

  // tamanho appBar
  Size get tamanhoAppBar{
    if (_size.width <= tabletBreakPoint){      
      return const Size.fromHeight(56.0);      
    } else if (_size.width <= webBreakPoint){      
      return const Size.fromHeight(80.0);      
    }
    
    return const Size.fromHeight(100.0);      
  }

  //tamanho Ícones AppBar
  Size get tamanhoIconesAppBar{
    if (_size.width <= tabletBreakPoint){      
      return const Size.square(25.0);
    } else if (_size.width <= webBreakPoint){      
      return const Size.square(45.0);
    }
    
    return const Size.square(65.0);
  }

}
