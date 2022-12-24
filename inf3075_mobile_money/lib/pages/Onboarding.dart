class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            margin: const EdgeInsets.fromLTRB(20, 30, 20,0),
            child: const Text('Bienvenue sur Youth Money',
              style: TextStyle(
                fontSize: 75,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            child:
            Image.asset('assets/images/onboarding_image.png',
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0,0,20,45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const[
                Text('Get Started',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  size: 25,
                  color: Colors.black,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}