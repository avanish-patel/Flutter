import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Image Assets"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              // first child widget
              Container(
                width: 200.0,
                height: 200.0,
                child: AndroidImage(),
              ),
              // second child widget
              Container(
                width: 200.0,
                height: 200.0,
                child: IosImage(),
              )
            ],
        ),
        ),
      ),
    );
  }

}

// class that has Android image
class AndroidImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    AssetImage assetImage = AssetImage("images/android.png");
    Image androidImage = Image(image: assetImage);

    return Container(child: androidImage,);
  }

}

// class that has apple image
class IosImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    AssetImage assetImage = AssetImage("images/ios.png");
    Image iosImage = Image(image: assetImage);

    return Container(child: iosImage,);
  }

}

