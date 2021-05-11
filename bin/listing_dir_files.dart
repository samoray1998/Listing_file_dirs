import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'constant.dart';
import 'model/citiesAgencies.dart';
import 'model/myFile.dart';

List<Result> allResults = <Result>[];
void main(List<String> arguments) async {
  List<MyFile> myFiles = <MyFile>[];
  print('Hello world!');
  var xx = await dirContents(Directory("images"));
  xx.forEach((element) {
    print('"' + "assets/" + element.path + '",');
  });
  print(xx.length);
  // var x = await dirContents(Directory("myData"));
  // for (var item in x) {
  //   //print(item.path);
  //   var s = File(item.path);
  //   var length = await s.length();
  //   myFiles.add(MyFile(path: item.path, size: length));
  // }
  // print(myFiles.length);
  // myFiles.sort((a, b) => a.size.compareTo(b.size));
  // //myFiles.reversed;
  // var reversedList = new List.from(myFiles.reversed);
  // reversedList.forEach((element) async {
  //   // var ss = (element as MyFile).path.split(RegExp(r'[/.]'));
  //   // print('"' + ss[1].replaceAll("_", " ") + '",');
  // });
  // for (var i = 0; i < cities.length; i++) {
  //   var myresult = await File('myData/${cities[i].replaceAll(" ", "_")}.json')
  //       .readAsString();
  //   getResult(myresult, cities[i]);
  // }
  // allResults.sort((a, b) => (a.rating == null ? 0 : a.rating)
  //     .compareTo(b.rating == null ? 0 : b.rating));

  // var sortedListByRating = List.from(allResults.reversed);

  // var sortedList = sortedListByRating
  //     .map((e) => Result(
  //           businessStatus: (e as Result).businessStatus,
  //           geometry: (e as Result).geometry,
  //           icon: (e as Result).icon,
  //           name: (e as Result).name,
  //           photos: (e as Result).photos,
  //           placeId: (e as Result).placeId,
  //           rating: (e as Result).rating,
  //           reference: (e as Result).reference,
  //           scope: (e as Result).scope,
  //           types: (e as Result).types,
  //           userRatingsTotal: (e as Result).userRatingsTotal,
  //           vicinity: (e as Result).vicinity,
  //           openingHours: (e as Result).openingHours,
  //         ))
  //     .toList();
  // print(sortedList.length);
  // sortedListByRating.sort((a, b) => ((a as Result).userRatingsTotal == null
  //         ? 0
  //         : (a as Result).userRatingsTotal)
  //     .compareTo((b as Result).userRatingsTotal == null
  //         ? 0
  //         : (a as Result).userRatingsTotal));
  // sortedListByRating.forEach((element) {
  //   print(
  //       "Name: ${(element as Result).name} ,Rating: ${(element as Result).rating}, totalUserRating : ${(element as Result).userRatingsTotal}");
  // });
  //var sortedListbyTotalRating =
  //     List.from((sortedListByRating as List<Result>).reversed);

  // sortedListbyTotalRating.forEach((element) {
  //   print(
  //       "Name: ${(element as Result).name} ,Rating: ${(element as Result).rating}, totalUserRating : ${(element as Result).userRatingsTotal}");
  // });
}

Future<List<FileSystemEntity>> dirContents(Directory dir) {
  var files = <FileSystemEntity>[];
  var completer = Completer<List<FileSystemEntity>>();
  var lister = dir.list(recursive: false);
  lister.listen((file) => files.add(file),
      // should also register onError
      onDone: () => completer.complete(files));
  return completer.future;
}

void getResult(String mydata, String city) async {
  // for (var i = 0; i < cities.length; i++) {
  //   // print(cities[i]);
  //   var myresult = await File('myData/${cities[i].replaceAll(" ", "_")}.json')
  //       .readAsString();
  final data = await json.decode(mydata);
  if (data["results"] != null) {
    // print("-----------------------------------------" +
    //     city +
    //     cityAgenciesFromJson(mydata).results.length.toString() +
    //     "-----------------------------------------");
    allResults.addAll(cityAgenciesFromJson(mydata).results);
    // print(cityAgenciesFromJson(myresult).results.length);
  } else {
    print("something went wrong");
  }
  //}
}
