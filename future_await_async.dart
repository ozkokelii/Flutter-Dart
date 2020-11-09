import 'dart:io';

import 'dart:async';

void main(List<String> args) {
  print("program başladı");

  dosyaIceriginiGoste();

  print("program bitti");
}

dosyaIceriginiGoste() {
  /*print("dosya içeriği gösterilecek ... ");
  String dosyaIcerigi = await dosyaIndir();
  print("DOSYA ICERIGI : $dosyaIcerigi");
  print("DOSYA ICERIGI : $dosyaIcerigi");
  print("DOSYA ICERIGI : $dosyaIcerigi");
  print("DOSYA ICERIGI : $dosyaIcerigi");
  */

  print("dosya içeriği gösterilecek ... ");
  Future<String> dosyaIcerigi = dosyaIndir();
  dosyaIcerigi.then((sonuc) => print("DOSYA İÇERİĞİ : $sonuc"));
}

Future<String> dosyaIndir() {
  print("dosya indirme işlemi başladı ");
  //sleep(Duration(seconds: 15));
  Future<String> sonuc = Future.delayed(Duration(seconds: 5), () {
    return "indirilen dosya içerği";
  });

  print("dosya indirme işlemi bitti");
  return sonuc;
}
