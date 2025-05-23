import 'package:flutter/material.dart';
import 'package:medichub/const.dart' as cons;

class HomeScreen extends StatefulWidget {
  final Function(String) onSearchPressed;

  const HomeScreen({super.key, required this.onSearchPressed});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool arrowText=true;
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
            decoration: BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xffFFFFFF),
              cons.Cerulean
            ]
            )
            ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/icono.png', height:40, width: 40, fit: BoxFit.contain,),
                      Text(
                        'Doctonear',
                        style: TextStyle(
                            fontFamily: 'titulo',
                            fontSize: 40,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  Image.asset('assets/images/doctor_image.png', height: 350, fit: BoxFit.contain,),
                  SizedBox(height: 20,),
                  Text(
                    'Encuentra el doctor más confiable y cercano',
                    style: TextStyle(
                      fontFamily: 'titulo',
                      fontSize: 30,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: _controller,
                    style: TextStyle(
                      fontFamily: 'cuerpo',
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      hintText:'Escpecialidad o nombre',
                      hintStyle:TextStyle(
                          fontFamily: 'cuerpo',
                          fontSize: 16,
                          color: Color(0x80000000)
                      ) ,
                      suffixIcon: IconButton(
                        icon: arrowText?
                        Icon(Icons.keyboard_arrow_down_outlined,size: 20, color: Color(0xff007EA7)) : Icon(Icons.keyboard_arrow_up_outlined,size:20,color: Color(0xff007EA7)),
                        onPressed: (){
                          setState((){
                            arrowText=arrowText;
                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Color(0xff007EA7),
                          width: 2.0, // grosor
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Color(0xff007EA7),
                          width: 2.0,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30,),
                  ElevatedButton(
                    onPressed: () {widget.onSearchPressed(_controller.text);},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: cons.Prussian_Blue,
                      padding: EdgeInsets.symmetric(horizontal: 100,vertical: 12),
                      elevation: 5,
                    ),
                    child: Text(
                      'Buscar',
                      style: TextStyle(
                          fontFamily: 'butLOg',
                          fontSize: 22,
                          color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        ),
        ),
    );
  }
}
