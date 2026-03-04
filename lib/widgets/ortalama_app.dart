import 'package:flutter/material.dart';

class OrtalamaApp extends StatefulWidget {
  const OrtalamaApp({super.key});

  @override
  State<OrtalamaApp> createState() => _OrtalamaAppState();
}

class _OrtalamaAppState extends State<OrtalamaApp> {

  List<Map<String,dynamic>> dersler=[];

  TextEditingController dersController=TextEditingController();

  String secilenNot="AA";
  int secilenKredi=1;

  Map<String,double> notlar={
    "AA":4,
    "BA":3.5,
    "BB":3,
    "CB":2.5,
    "CC":2,
    "DC":1.5,
    "DD":1,
    "FF":0
  };

  double ortalamaHesapla(){

    double toplamNot=0;
    double toplamKredi=0;

    for(var ders in dersler){

      toplamNot+=ders["not"]*ders["kredi"];
      toplamKredi+=ders["kredi"];

    }

    if(toplamKredi==0) return 0;

    return toplamNot/toplamKredi;

  }

  void dersEkle(){

    if(dersController.text.isEmpty) return;

    setState(() {

      dersler.add({

        "ders":dersController.text,
        "kredi":secilenKredi,
        "not":notlar[secilenNot],
        "harf":secilenNot

      });

      dersController.clear();

    });

  }

  @override
  Widget build(BuildContext context) {

    double ortalama=ortalamaHesapla();

    return Scaffold(

      backgroundColor: Colors.grey.shade100,

      body: SafeArea(

        child: Padding(

          padding: const EdgeInsets.all(16),

          child: Column(

            children: [

              /// BAŞLIK
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Ortalama Hesapla",
                  style: TextStyle(
                    fontSize:26,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),

              const SizedBox(height:15),

              /// ÜST PANEL
              Container(

                padding: const EdgeInsets.all(15),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8
                    )
                  ]
                ),

                child: Row(

                  children: [

                    Expanded(

                      child: TextField(
                        controller: dersController,
                        decoration: InputDecoration(
                          hintText: "Ders Adı",
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none
                          ),
                        ),
                      ),

                    ),

                    const SizedBox(width:20),

                    Column(

                      children: [

                        Text("${dersler.length} Ders Girildi"),

                        Text(
                          ortalama.toStringAsFixed(2),
                          style: const TextStyle(
                            fontSize:28,
                            fontWeight: FontWeight.bold
                          ),
                        ),

                        const Text("Ortalama")

                      ],
                    )

                  ],
                ),
              ),

              const SizedBox(height:15),

              /// NOT + KREDİ + BUTON
              Row(

                children: [

                  Expanded(

                    child: Container(

                      padding: const EdgeInsets.symmetric(horizontal:10),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)
                      ),

                      child: DropdownButton<String>(

                        value: secilenNot,
                        underline: Container(),

                        items: notlar.keys.map((not){

                          return DropdownMenuItem(
                            value: not,
                            child: Text(not),
                          );

                        }).toList(),

                        onChanged: (value){

                          setState(() {
                            secilenNot=value!;
                          });

                        },

                      ),

                    ),

                  ),

                  const SizedBox(width:10),

                  Expanded(

                    child: Container(

                      padding: const EdgeInsets.symmetric(horizontal:10),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)
                      ),

                      child: DropdownButton<int>(

                        value: secilenKredi,
                        underline: Container(),

                        items: List.generate(10, (index){

                          return DropdownMenuItem(
                            value:index+1,
                            child: Text("${index+1}"),
                          );

                        }),

                        onChanged: (value){

                          setState(() {
                            secilenKredi=value!;
                          });

                        },

                      ),

                    ),

                  ),

                  const SizedBox(width:10),

                  /// EKLE BUTONU
                  Container(

                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15)
                    ),

                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward,color:Colors.white),
                      onPressed: dersEkle,
                    ),

                  )

                ],

              ),

              const SizedBox(height:15),

              /// DERS LİSTESİ
              Expanded(

                child: dersler.isEmpty

                ? const Center(
                  child: Text(
                    "Lütfen ders ekleyiniz",
                    style: TextStyle(fontSize:18),
                  ),
                )

                : ListView.builder(

                  itemCount: dersler.length,

                  itemBuilder:(context,index){

                    var ders=dersler[index];

                    return Dismissible(

                      key:Key(index.toString()),

                      direction:DismissDirection.startToEnd,

                      onDismissed:(direction){

                        setState(() {
                          dersler.removeAt(index);
                        });

                      },

                      background:Container(
                        alignment:Alignment.centerLeft,
                        padding:const EdgeInsets.only(left:20),
                        color:Colors.red,
                        child:const Icon(Icons.delete,color:Colors.white),
                      ),

                      child:Card(

                        shape:RoundedRectangleBorder(
                          borderRadius:BorderRadius.circular(15)
                        ),

                        child:ListTile(

                          leading:CircleAvatar(

                            backgroundColor:Colors.blue,

                            child:Text(
                              ders["not"].toString(),
                              style:const TextStyle(color:Colors.white),
                            ),

                          ),

                          title:Text(ders["ders"]),

                          subtitle:Text(
                            "${ders["kredi"]}.0 Kredi, Not Değeri ${ders["not"]}"
                          ),

                        ),

                      ),

                    );

                  }

                ),

              )

            ],

          ),

        ),

      ),

    );

  }

}