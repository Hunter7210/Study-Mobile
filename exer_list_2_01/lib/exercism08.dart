import 'package:flutter/material.dart';

class Exercism08 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Galeria de imagens",
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      backgroundColor: Colors.amber,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Title(
            color: Colors.black,
            child: Text(
              "Galeria Nurburgring",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(
                "https://imgs.search.brave.com/W2FM2RWJWBbmGSaUQz6SgLjmL-OrVn-R0oder9V1LII/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93d3cu/c3RhdHNmMS5jb20v/cGhvdG9zL2NpcmN1/aXRzL251cmJ1cmcu/anBn",
                height: 150,
              ),
              Image.network(
                "https://imgs.search.brave.com/kj7nVZvxEAjOJw_5LuLKwOA4ICn9WmRYBkpaD4lNkKA/rs:fit:860:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy9i/L2IwL0FEQUNfR1Rf/TWFzdGVyc19hdF9O/dWVyYnVyZ3Jpbmcu/anBn",
                height: 150,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "assets/Audi_night.jpg",
                height: 150,
              ),
              Image.asset(
                "assets/Bmw_Box.jpg",
                height: 150,
              ),
            ],
          )
        ],
      ),
    );
  }
}
