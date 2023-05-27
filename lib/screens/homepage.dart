import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:info/models/apiHelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    ApiHelper.apiHelper.fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        title: const Text("Countries"),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder(
          future: ApiHelper.apiHelper.fetchdata(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            } else if (snapshot.hasData) {
              var data = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, i) {
                  return Card(
                    color: Colors.primaries[i % 18].shade300,
                    child: ListTile(
                      leading: Text(
                        "${i + 1}",
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            'DetailsPage',
                            arguments: data![i],
                          );
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color:Colors.primaries[i % 18].shade900,
                        ),
                      ),
                      title: Text(data![i]!.countries.toString()),
                    ),
                  );
                },
                itemCount: 250,
                shrinkWrap: true,
              );
            } else {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
