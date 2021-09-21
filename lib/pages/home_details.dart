import 'package:flutter_catalog_app/models/catalog.dart';
import 'package:flutter_catalog_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class HomeDetailPage extends StatelessWidget { 
  final Items catalog;
  const HomeDetailPage({Key key, @ required this.catalog}) : assert ( catalog != null ),super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(        
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar:Container(   
        child: ButtonBar(                        
                    buttonPadding: EdgeInsets.all(16),
                    alignment: MainAxisAlignment.spaceAround,
                    children: [
                     "\$${catalog.price}".text.color(Theme.of(context).accentColor).bold.xl4.make(),
                     ElevatedButton(                     
                       style: ButtonStyle(
                         backgroundColor: MaterialStateProperty.all(Theme.of(context).buttonColor),
                         shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(08)))
                       ),
                       onPressed: (){},
                       child: "Add to cart".text.xl.make().p1()
                     ).wh(120, 45),
                    ],
                  ),
      ),      
      body: SafeArea(        
        bottom: false,
        child: Column(      
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.imageUrl)
              ).p16().h32(context),
            Expanded(
              child: VxArc(
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                height: 30,
                child: Container(
                  width: context.screenWidth,
                  color: Theme.of(context).cardColor,
                  child: SingleChildScrollView(
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        catalog.name.text.color(Theme.of(context).accentColor).xl4.bold.make(),
                        catalog.desc.text.color(MyTheme.myGreyColor).textStyle(context.captionStyle).xl.make(),
                        "Amet ea stet lorem dolor invidunt clita diam dolores, sadipscing amet kasd tempor diam at ut, ea ipsum ipsum tempor at lorem sea et diam. Sea sit amet erat gubergren ut, sit invidunt amet ea amet lorem, justo et sit et est justo diam dolor diam sanctus, aliquyam takimata sed.".text.color(MyTheme.myGreyColor).align(TextAlign.justify).make().pOnly(top: 16,),
                      ],
                    ).p64(),
                  ),
              
                ),
              ),
            ),
          ],  
        ),
      ),
    );
  }
}