import 'package:flutter/material.dart';

class AddCodeQrBarra extends StatefulWidget {
  const AddCodeQrBarra({super.key});

  @override
  State<AddCodeQrBarra> createState() => _AddCodeQrBarraState();
}

class _AddCodeQrBarraState extends State<AddCodeQrBarra> {
  TextEditingController respuesta = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Escanear Codigo"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: GestureDetector(
                  child: Icon(
                    Icons.qr_code,
                    color: Colors.green,
                    size: 50,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: TextField(
                  onChanged:(value) {
                    //respuesta = value;
                  },
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
