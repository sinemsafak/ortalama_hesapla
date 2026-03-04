import 'package:flutter/material.dart';
import '../model/ders.dart';
import '../helper/data_helper.dart';
import 'ortalama_goster.dart';

class OrtalamaApp extends StatefulWidget {
  const OrtalamaApp({super.key});

  @override
  State<OrtalamaApp> createState() => _OrtalamaAppState();
}

class _OrtalamaAppState extends State<OrtalamaApp> {

  List<Ders> tumDersler = [];

  void dersEkle() {
    setState(() {
      tumDersler.add(Ders("Algoritma", 3, 3));
    });
  }

  void dersSil(int index) {
    setState(() {
      tumDersler.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {

    double ortalama = DataHelper.ortalamaHesapla(tumDersler);

    return Scaffold(
      appBar: AppBar(
        title: Text("Ortalama Hesapla"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: dersEkle,
        child: Icon(Icons.add),
      ),

      body: Column(
        children: [

          Expanded(
            flex: 2,
            child: OrtalamaGoster(
              ortalama: ortalama,
              dersSayisi: tumDersler.length,
            ),
          ),

          Expanded(
            flex: 3,
            child: tumDersler.isEmpty
                ? Center(
              child: Text(
                "Lütfen ders ekleyiniz",
                style: TextStyle(fontSize: 20),
              ),
            )
                : ListView.builder(
              itemCount: tumDersler.length,
              itemBuilder: (context, index) {

                return Dismissible(
                  key: Key(index.toString()),
                  direction: DismissDirection.startToEnd,

                  onDismissed: (direction) {
                    dersSil(index);
                  },

                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),

                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].dersAdi),
                      subtitle: Text(
                          "${tumDersler[index].kredi} kredi"
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}