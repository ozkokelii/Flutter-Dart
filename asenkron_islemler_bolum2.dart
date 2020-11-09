import 'dart:async';
import 'dart:math';

void main(List<String> args) {
  //var future = Future.value("b").then((sonuc) => print("sonuc $sonuc"));
  //zincirlendirilmisFuture();
  //errorWhenCompleted();
  /*print("hesaplama başlıyor ");
  futureOlustur();
  print("hesaplama bitti");
  */
  asyncDenem();
}

void asyncDenem() async {
  var fun1 = (int v) async => v + 1;
  var fun2 = (int v) async => v - 9;
  var fun3 = (int v) async => v * 10;

  var value = 10;
  value = await fun1(value);
  value = await fun2(value);
  value = await fun3(value);
  print(value);
}

void futureOlustur() {
  new Future(() {
    var sum = 0;
    for (var i = 0; i < 5000000; i++) {
      sum += i;
    }
    return sum;
  }).then(print);
}

void errorWhenCompleted() {
  var random = new Random();
  var future = new Future.delayed(new Duration(seconds: 3), () {
    if (random.nextBool()) {
      return 100;
    } else {
      throw "boom!";
    }
  });

  var future2 = future.then(print);
  var future3 = future2.catchError(print);
  var future4 = future3.whenComplete(() {
    print("done!");
  });
}

void futureKullanimi() {
  var random = new Random();
  var future = new Future.delayed(new Duration(seconds: 4), () {
    if (random.nextBool()) {
      return 100;
    } else {
      throw 'boom!';
    }
  });
  future.then((value) {
    print('completed with value $value');
  }, onError: (error) {
    print('completed with eror $error');
  });
}

void zincirlendirilmisFuture() {
  var future = new Future.value("a").then((v1) {
    //value a  ==> v1 içeriğinde a var
    return new Future.value("$v1 b").then((v2) {
      //value a b ==> v2 içeriğinde a b olacak
      return new Future.value("$v2 c").then((v3) {
        //value a b c ==> v3 içeriğinde a b c olacak
        return new Future.value("$v3 d"); //value a b c d
      });
    });
  });
  future.then((sonDeger) => print("zincirin son işlemi : $sonDeger"),
      onError: print); //future.then ilk paramtre olan print içinde ==> a b c d
}
