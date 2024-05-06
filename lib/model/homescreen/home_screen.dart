import 'package:flutter/material.dart';
import 'package:news_app/controller/homescreen_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget{
const HomeScreen ({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp)async {
await Provider.of<Homecontroller>(context,listen: false).getdata();
      
    },);
    
    super.initState();
  }


@override

Widget build (BuildContext context){
  final provider = context.watch<Homecontroller>();
  return DefaultTabController(
    length: provider.categories.length,
    child: Scaffold(
      appBar: AppBar(bottom: TabBar(onTap: (value) {
        
      },
        isScrollable: true,
        tabs: List.generate(provider.categories.length, (index) => Tab(child: Text('${provider.categories[index]}'),))
        
      ),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        context.read<Homecontroller>().getdata();
      }),
      body:provider.isLoading?const Center(child: CircularProgressIndicator(),):
       ListView.builder(itemCount: provider.resModel?.articles?.length ?? 0,
        itemBuilder: (context,index){
        return ListTile(
          title: Text(provider.resModel?.articles?[index].title ?? 'hi'),
        );
      })
    ),
  );
}
}




