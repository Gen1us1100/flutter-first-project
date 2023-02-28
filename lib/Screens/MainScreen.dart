import 'package:flutter/material.dart';
import 'package:untitled/constants.dart' as constants;
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //color: Color.fromARGB(255, 32, 32, 32),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/green_aes.jpg",),
          fit: BoxFit.cover,
          opacity: 0.5
        )
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top:size.height*0.1,
              child: Text(
            '${constants.apiInstance.city}',
            style: TextStyle(
              color: constants.hinttextColor,
              decoration: TextDecoration.none,
              fontSize: 45,
              fontFamily:'Poppins',
            ),
          )),
          Positioned(
              top: size.height*0.21,
              child: Text(
            constants.apiInstance.date,
            style: TextStyle(
              color: constants.hinttextColor,
              decoration: TextDecoration.none,
              fontSize: 30,
              fontFamily: 'Poppins',
            ),
          )),
          Positioned(
              top: size.height*0.26,
              child: SizedBox(
                width: size.width*0.9,
                height: size.height*0.3,
                child: Image.network('http://openweathermap.org/img/wn/${constants.apiInstance.icon}@2x.png',
                scale : 0.1,),
                ),
              ),
          Positioned(
              top: size.height*0.54,
              child: Text(
                '${constants.apiInstance.temp}°C',
                style: TextStyle(
                  color: constants.hinttextColor,
                  decoration: TextDecoration.none,
                  fontSize: size.width*0.18,
                  fontFamily: 'Poppins',
                ),
              )),
          Positioned(
            bottom: size.height * 0.1,
              child: Row(
                children: [
                  extraInfo(
                    size: size,
                    icon: Icons.thermostat,
                    name: 'MaxTemp',
                    value: '${constants.apiInstance.maxTemp}°c',
                  ),
                  extraInfo(
                    size: size,
                    icon: Icons.air_outlined,
                    name: 'Windspeed',
                    value: '${constants.apiInstance.airSpeed}m/s',
                  ),
                  extraInfo(
                    size: size,
                    icon: Icons.percent,
                    name: 'Humidity',
                    value: '${constants.apiInstance.humidity}%',
                  ),
                ],
          ))
        ],
      ),
    );
  }
}


class extraInfo extends StatelessWidget {
  extraInfo({
    super.key,
    required this.size,
    required this.icon,
    required this.name,
    required this.value,
  });

  final Size size;
  final IconData icon;
  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.3,
      child: Column(
        children: [
          Icon(
            icon,
            color: constants.hinttextColor,
            size: 40,
          ),
          Text(
            name,
            style: TextStyle(
              color: constants.hinttextColor,
              decoration: TextDecoration.none,
              fontSize: 20,
              fontFamily: 'Poppins',
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 25,
              color: constants.hinttextColor,
              decoration: TextDecoration.none,
            ),
          )
        ],
      ),
    );
  }
}