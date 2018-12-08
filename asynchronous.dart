import 'dart:async';

void main(){

  // regular execution started and print Start -> Instance of Future -> Finish 
  // print("Main Started");
  // printDownloadedContent();
  // print("Main Finished");

  // Asynchronous way Start -> End -> Print Content of File
  // print("Main Started Async-Await");
  // printDownloadedContentAsync();
  // print("Main Finished Async-Await");

  print("Main Started then");
  printDownloadedContentAsyncUsingThen();
  print("Main Finished then");

}
// server that return string after 5 seconds
Future<String> server(){

  Future<String> downlaod = Future.delayed(Duration(seconds: 5), () => "Secret file downloaded in 5 seconds.");

  return downlaod;
}

// 1->Normal Flow, Print content that downloadFile() function returns,Fucntion that takes 5 seconds to return result of string but it will print the instance of Future
void printDownloadedContent() {

  // it has just only instance of Future, no value until 5 sec
  Future<String> content = server();
  print("Download : $content");
}

// 2->Asychrounous Flow, async-await tells cpu that do not wait for me,just execute whatever after me, I'm waiting to get result from someone
void printDownloadedContentAsync() async {
  // it waits to get result back from serverAsync()
  String content = await server();
  print("Async Download : $content");

}

// 3->Asynchronous Flow, Using then, which is similar to async-await, it return value when it finished fetching values
void printDownloadedContentAsyncUsingThen() {
  
  Future<String> content = server();
  content.then((returnValue) => print("Async Downlaod : $returnValue"));
}



