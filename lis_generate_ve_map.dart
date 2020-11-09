import 'dart:math';

void main(List<String> args) {
  //List<int> ogrenciNumaralari =List.generate(30, (index) => rastgeleOgrenciNoOlustur());
  List<int> ogrenciNumaralari =
      List.generate(30, (index) => rastgeleOgrenciNoOlustur());
  /* List<Ogrenci> tumOgrenciler = ogrenciNumaralari.map((ogrNo) {
    return Ogrenci("ogrenci $ogrNo adı ", ogrNo);
  }).toList();
*/
  List<Ogrenci> tumOgrenciler = ogrenciNumaralari
      .map((ogrNo) => Ogrenci("ogrenci $ogrNo adı ", ogrNo))
      .toList();

  tumOgrenciler
      .forEach((oankiOgrenci) => print("ogrenci adı : ${oankiOgrenci.ad}"));
}

int rastgeleOgrenciNoOlustur() {
  int olusturulanSayi = Random().nextInt(60);
  if (olusturulanSayi != 0) {
    return olusturulanSayi;
  } else {
    rastgeleOgrenciNoOlustur();
  }
}

class Ogrenci {
  String ad;
  int no;

  Ogrenci(this.ad, this.no);

  @override
  String toString() {
    return "ogrenci adı $ad ve numarası $no";
  }
}
