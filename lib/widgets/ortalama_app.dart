import 'package:flutter/material.dart';

class OrtalamaApp extends StatefulWidget {
  const OrtalamaApp({super.key});

  @override
  State<OrtalamaApp> createState() => _OrtalamaAppState();
}

class _OrtalamaAppState extends State<OrtalamaApp> {

  List<Map<String, dynamic>> dersler = [];

  String secilenNot = "AA";
  int secilenKredi = 1;
  TextEditingController dersController = TextEditingController();

  Map<String,double> notlar = {
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

    double toplamNot = 0;
    double toplamKredi = 0;

    for(var ders in dersler){
      toplamNot += ders["not"] * ders["kredi"];
      toplamKredi += ders["kredi"];
    }

    return toplamKredi == 0 ? 0 : toplamNot/toplamKredi;
  }

  void dersEkle(){

    setState(() {

      dersler.add({
        "ders": dersController.text,
        "kredi": secilenKredi,
        "not": notlar[secilenNot],
        "harf": secilenNot
      });

      dersController.clear();

    });
  }

  @override
  Widget build(BuildContext context) {

    double ortalama = ortalamaHesapla();

    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [

            const SizedBox(height:40),

            const Text(
              "Ortalama Hesapla",
              style: TextStyle(
                fontSize:28,
                fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(height:20),

            /// ÜST ALAN
            Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: dersController,
                    decoration: InputDecoration(
                      hintText: "Ders adı",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
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
                        fontSize:30,
                        fontWeight: FontWeight.bold
                      ),
                    ),

                    const Text("Ortalama")
                  ],
                )

              ],
            ),

            const SizedBox(height:15),

            /// NOT + KREDİ
            Row(
              children: [

                DropdownButton<String>(
                  value: secilenNot,
                  items: notlar.keys.map((not){

                    return DropdownMenuItem(
                      value: not,
                      child: Text(not),
                    );

                  }).toList(),
                  onChanged: (value){

                    setState(() {
                      secilenNot = value!;
                    });

                  },
                ),

                const SizedBox(width:20),

                DropdownButton<int>(
                  value: secilenKredi,
                  items: List.generate(10, (index){

                    return DropdownMenuItem(
                      value: index+1,
                      child: Text("${index+1}"),
                    );

                  }),
                  onChanged: (value){

                    setState(() {
                      secilenKredi = value!;
                    });

                  },
                ),

                const SizedBox(width:20),

                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: dersEkle,
                )

              ],
            ),

            const SizedBox(height:20),

            /// LİSTE
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

                      itemBuilder: (context,index){

                        var ders = dersler[index];

                        return Card(
                          child: ListTile(

                            leading: CircleAvatar(
                              child: Text(
                                ders["kredi"].toString(),
                              ),
                            ),

                            title: Text(ders["ders"]),

                            subtitle: Text(
                              "${ders["kredi"]}.0 Kredi, Not Değeri ${ders["not"]}"
                            ),

                          ),
                        );

                      },
                    ),
            )

          ],
        ),
      ),
    );
  }
}