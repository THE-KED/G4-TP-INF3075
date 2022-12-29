class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  final styleText = const TextStyle(
    fontSize: 20,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    color: Colors.black,);

  final List<HistoryModel> historyElement =[
    HistoryModel(
        sendersNumbers: "697624477",
        message: "Le numéro xxxxxxxx vous a envoyez la somme de .....FCFA"
    ),
    HistoryModel(
        sendersNumbers: "697624477",
        message: "Le numéro xxxxxxxx vous a envoyez la somme de .....FCFA"
    ),
    HistoryModel(
        sendersNumbers: "697624477",
        message: "Le numéro xxxxxxxx vous a envoyez la somme de .....FCFA"
    ),
    HistoryModel(
        sendersNumbers: "697624477",
        message: "Le numéro xxxxxxxx vous a envoyez la somme de .....FCFA"
    ),
    HistoryModel(
        sendersNumbers: "697624477",
        message: "Le numéro xxxxxxxx vous a envoyez la somme de .....FCFA"
    ),
    HistoryModel(
        sendersNumbers: "697624477",
        message: "Le numéro xxxxxxxx vous a envoyez la somme de .....FCFA"
    ),
    HistoryModel(
        sendersNumbers: "697624477",
        message: "Le numéro xxxxxxxx vous a envoyez la somme de .....FCFA"
    ),

  ];
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        backgroundColor: Color.fromRGBO(45, 42, 158, 100),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemBuilder: (_, index){
            return Card(

              child: Container(
                padding: const EdgeInsets.all(16),
                decoration:  const BoxDecoration(
                  color: Color.fromRGBO(194, 228, 233, 100),
                ),
                child: Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          const Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.deepPurpleAccent,
                          ),
                          Text(
                            historyElement[index].sendersNumbers,
                            style: styleText,
                          ),
                        ],
                      ),

                      Text(
                        historyElement[index].message,
                        style: styleText,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: historyElement.length,
        ),
      ),
    );

  }
}