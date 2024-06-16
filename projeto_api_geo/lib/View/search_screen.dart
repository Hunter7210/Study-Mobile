import 'package:flutter/material.dart';
import 'package:projeto_api_geo/Controller/city_database_controller.dart';
import 'package:projeto_api_geo/Controller/weather_controller.dart';
import 'package:projeto_api_geo/Model/city_model.dart';
import 'package:projeto_api_geo/View/details_weather_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _cityContrller = TextEditingController();
  final WeatherController _controller = WeatherController();
  final CityDbController _cityDbController = CityDbController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Form(
            //Criado somente conseguir realizar a verificação dos campos
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _cityContrller,
                  decoration: const InputDecoration(hintText: "Search"),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Please enter a city";
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      _findCity(
                          _cityContrller.text); //Executa o metodo cityFind
                    }
                  },
                  child: const Text("Search"),
                ),
                const SizedBox(
                  height: 12,
                ),
                FutureBuilder(
                  future: _cityDbController.listcity(),
                  builder: (context, snapshot) {
                    if (_cityDbController.cities().isNotEmpty) {
                      return ListView.builder(
                        itemCount: _cityDbController.cities().length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                                _cityDbController.cities()[index].cityName),
                            onTap: () {},
                          );
                        },
                      );
                    }
                    return const Center(child: Text("Empty Location"));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//C
  Future<void> _findCity(String city) async {
    if (await _controller.findCity(city)) {
      City cityadd = City(cityName: city, favoritesCities: false);
      _cityDbController.addCity(cityadd);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("City found"),
          duration: Duration(seconds: 1),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WeatherDetailsScreen(cityName: city),
        ),
      );
      setState(() {});
    } else {
      // snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("City not found"),
          duration: Duration(seconds: 2),
        ),
      );
      _cityContrller.clear();
    }
  }
}
