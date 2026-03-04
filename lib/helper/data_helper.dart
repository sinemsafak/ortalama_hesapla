import '../model/ders.dart';

class DataHelper {

  static double ortalamaHesapla(List<Ders> tumDersler){

    double toplamNot = 0;
    double toplamKredi = 0;

    for (var ders in tumDersler) {
      toplamNot += ders.kredi * ders.harfDegeri;
      toplamKredi += ders.kredi;
    }

    return toplamKredi == 0 ? 0 : toplamNot / toplamKredi;
  }

}