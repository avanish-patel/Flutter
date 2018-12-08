import 'dart:async';

void main(){

  // regular execution started and print Start -> Instance of Future -> Finish 
  print("Main Started");
  printDownloadedContent();
  print("Main Finished");

  // Asynchronous way Start -> End -> Print Content of File
  print("Main Started Async");
  printDownloadedContentAsync();
  print("Main Finished Async");

}

// print content that downloadFile() function returns
void printDownloadedContent() {

  // it has just only instance of Future, no value until 5 sec
  Future<String> content = downlaodFile();
  print("Download : $content");
}

// Fucntion that takes 5 seconds to return result of string, we are doing promise to return result that's why it's future
Future<String> downlaodFile(){

  Future<String> downlaod = Future.delayed(Duration(seconds: 5), () => "Secret file downloaded in 5 seconds.");

  return downlaod;
}

// async-await tells cpu that do not wait for me,just execute whatever after me, I'm waiting to get result from someone
void printDownloadedContentAsync() async {
  // it waits to get result back from downlaodFileAsync()
  String content = await downloadFileAsync();
  print("Async Download : $content");

}

Future<String> downloadFileAsync() {

  Future<String> download = Future.delayed(Duration(seconds: 5), () => "Secret file downloaded in 5 seconds, Ansyncronously");
  return download;
}

