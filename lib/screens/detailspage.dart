import 'package:flutter/material.dart';
import 'package:info/models/globals.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    Info data = ModalRoute.of(context)!.settings.arguments as Info;

    return Scaffold(
      appBar: AppBar(
        title: Text(data.countries),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: Row(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Cepital : ",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  ...data.capital
                      .map(
                        (e) => Text("${e} "),
                      )
                      .toList()
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              elevation: 5,
              child: Row(
                children: [
                  const Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Language : ",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.grey,
                        )),
                  )),
                  ...data.lang.values.map(
                    (e) => Row(
                      children: [
                        Text(
                          e.toString(),
                        ),
                        const Text(", "),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              elevation: 5,
              child: Row(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Populations : ",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.grey,
                          )),
                    ),
                  ),
                  Text(
                    "${data.population} ",
                  ),
                ],
              ),
            ),
            Spacer(),
            Theme(
              data: ThemeData(
                useMaterial3: true,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', (route) => false);
                },
                child: const Text(
                  "Back",
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
