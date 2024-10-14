import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iot_tdmu/pages/auth/widgets/button_login_widget.dart';
import 'package:iot_tdmu/pages/home/models/garden_model.dart';
import 'package:iot_tdmu/shared/constants/app_constants.dart';

import '../../../shared/constants/styles.dart';

class DetailGardenPage extends StatefulWidget {
  final GardenModel garden;

  const DetailGardenPage({super.key, required this.garden});

  @override
  State<DetailGardenPage> createState() => _DetailGardenPageState();
}

class _DetailGardenPageState extends State<DetailGardenPage> {
  bool isSwitched = false;
  double sliderValue = 50; // Giá trị của slider mặc định

  ///Light
  ///
  bool isSwitchedLight = false;
  Color selectedColorLight = Colors.white;
  double sliderValueLight = 50; // Giá trị của slider mặc định
  double sliderRadiusLight = 50; // Giá trị của slider mặc định

  ///Fan
  bool isSwitchedFan = false;
  String fanSpeed = 'Medium';
  double sliderValueFan = 50; // Giá trị của slider mặc định
  double sliderColdFan = 50; // Giá trị của slider mặc định

  ///Irrigation
  bool isSwitchedIrrigation = false;
  double humidityIrrigation = 50;
  double waterAmountIrrigation = 50;

  ///Sensor
  bool isSwitchedSensor = false;
  double temperatureSensor = 25;
  double humiditySensor = 50;

  ///Heating
  bool isSwitchedHeating = false;
  double temperatureHeating = 25;

  ///Nutrient
  bool isSwitchedNutrient = false;
  double nutrientAmount = 50;
  double frequency = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hình ảnh của khu vườn
                _buildImageGarden(),
                SizedBox(height: 8),
                _buildCardInfo(),
                SizedBox(height: 8),
                // Mô tả vườn
                _buildListOptions(),
                SizedBox(height: 8),
                _buildErrorGarden(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildImageGarden() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
              Text(
                widget.garden.name ?? 'Name not found',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  _showGardenOptionsDialog(context);
                },
                icon: Icon(Icons.more_vert),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.garden.image!,
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildCardInfo() {
    return Container(
      padding: EdgeInsets.all(16),
      height: 150,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/icons/home/icon_weather.svg',
                height: 40,
                width: 40,
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mostly Cloudy',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.garden.location ?? 'Location not found',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                '${widget.garden.temperature}°C',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              _buildNameAndValue('${widget.garden.sensible}°C', 'Sensible'),
              Spacer(),
              _buildNameAndValue('${widget.garden.humidity}%', 'Humidity'),
              Spacer(),
              _buildNameAndValue(
                  '${widget.garden.precipitation}%', 'Precipitation'),
              Spacer(),
              _buildNameAndValue('${widget.garden.wind} km/h', 'Wind'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNameAndValue(String name, String value) {
    return Column(
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ],
    );
  }

  _buildListOptions() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Text(
                  'Your options:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Auto',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ])),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.5,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            children: [
              _buildOption('assets/icons/home/icon_light.svg', 'Light'),
              _buildOption('assets/icons/home/icon_fan.svg', 'Fan'),
              _buildOption(
                  'assets/icons/home/icon_irrigation.svg', 'Irrigation'),
              _buildOption('assets/icons/home/icon_sensor.svg', 'Sensor'),
              _buildOption('assets/icons/home/icon_heating.svg', 'Heating'),
              _buildOption('assets/icons/home/icon_nutrient.svg', 'Nutrient'),
            ],
          ),
        ],
      ),
    );
  }

  _buildOption(String iconUrl, String name) {
    return GestureDetector(
      onTap: () {
        switch (name) {
          case 'Light':
            _showBottomModalLight(context);
            break;
          case 'Fan':
            _showBottomModalFan(context);
            break;
          case 'Irrigation':
            _showBottomModalIrrigation(context);
            break;
          case 'Sensor':
            _showBottomModalSensor(context);
            break;
          case 'Heating':
            _showBottomModalHeating(context);
            break;
          case 'Nutrient':
            _showBottomModalNutrient(context);
            break;
        }
      },
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconUrl,
              height: 30,
              width: 30,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildErrorGarden() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Detect: ",
                style: styleS14W6(Colors.black),
              ),
              Expanded(
                child: Text(
                  widget.garden.description ?? 'Description not found',
                  style: styleS14W6(Colors.black38),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _showBottomModalDetail(context);
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    'Detail',
                    style: styleS14W5(Colors.black),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  _showBottomModalLight(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setStateModal) {
            return Container(
              color: selectedColorLight, // Đặt backgroundColor ở đây
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Configure Light',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Auto', style: TextStyle(fontSize: 18)),
                          Switch(
                            value: isSwitchedLight,
                            onChanged: (value) {
                              setStateModal(() {
                                isSwitchedLight = value;
                                Navigator.pop(context);
                              });
                            },
                            activeTrackColor: Colors.lightGreenAccent,
                            activeColor: Colors.green,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text('Set Value', style: TextStyle(fontSize: 16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setStateModal(() {
                            sliderValueLight =
                                (sliderValueLight - 10).clamp(0, 100);
                          });
                        },
                      ),
                      Expanded(
                        child: Slider(
                          value: sliderValueLight,
                          min: 0,
                          max: 100,
                          divisions: 10,
                          label: sliderValueLight.round().toString(),
                          onChanged: (double value) {
                            setStateModal(() {
                              sliderValueLight = value;
                            });
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setStateModal(() {
                            sliderValueLight =
                                (sliderValueLight + 10).clamp(0, 100);
                          });
                        },
                      ),
                    ],
                  ),
                  Text('Radius Light', style: TextStyle(fontSize: 16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setStateModal(() {
                            sliderRadiusLight =
                                (sliderRadiusLight - 10).clamp(0, 100);
                          });
                        },
                      ),
                      Expanded(
                        child: Slider(
                          value: sliderRadiusLight,
                          min: 0,
                          max: 100,
                          divisions: 10,
                          label: sliderRadiusLight.round().toString(),
                          onChanged: (double value) {
                            setStateModal(() {
                              sliderRadiusLight = value;
                            });
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setStateModal(() {
                            sliderRadiusLight =
                                (sliderRadiusLight + 10).clamp(0, 100);
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text('Change Color', style: TextStyle(fontSize: 16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setStateModal(() {
                            selectedColorLight = Color(0xff00FF00);
                          });
                        },
                        child: CircleAvatar(backgroundColor: Color(0xff00FF00)),
                      ),
                      GestureDetector(
                        onTap: () {
                          setStateModal(() {
                            selectedColorLight = Color(0xffFF0000);
                          });
                        },
                        child: CircleAvatar(backgroundColor: Color(0xffFF0000)),
                      ),
                      GestureDetector(
                        onTap: () {
                          setStateModal(() {
                            selectedColorLight = Colors.green;
                          });
                        },
                        child: CircleAvatar(backgroundColor: Colors.green),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: ButtonLoginWidget(
                      title: 'Apply',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  _showBottomModalFan(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.brown[100],
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setStateModal) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Configure Fan',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Auto', style: TextStyle(fontSize: 18)),
                          Switch(
                            value: isSwitchedFan,
                            onChanged: (value) {
                              setStateModal(() {
                                isSwitchedFan = value;
                                Navigator.pop(context);
                              });
                            },
                            activeTrackColor: Colors.lightGreenAccent,
                            activeColor: Colors.green,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text('Fan Speed', style: TextStyle(fontSize: 16)),
                  DropdownButtonFormField<String>(
                    selectedItemBuilder: (BuildContext context) {
                      return <String>['Low', 'Medium', 'High']
                          .map((String value) {
                        return Text(
                          value,
                          style: TextStyle(fontSize: 16),
                        );
                      }).toList();
                    },
                    hint: Text('Chọn...',
                        style: styleS16W4(const Color(0xffAFAFAF))),
                    value: fanSpeed,
                    onChanged: (String? newValue) {
                      setStateModal(() {
                        fanSpeed = newValue!;
                      });
                    },
                    items: <String>['Low', 'Medium', 'High']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: fanSpeed == value
                                ? Color(0xff00B389).withOpacity(0.1)
                                : Colors.blue.withOpacity(0.6),
                            border: Border.all(
                              color: fanSpeed == value
                                  ? Colors.blue
                                  : Colors.transparent,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            value,
                            style: styleS16W4(
                              fanSpeed == value ? Colors.blue : Colors.black,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  Text('Cold Fan', style: TextStyle(fontSize: 16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setStateModal(() {
                            sliderColdFan = (sliderColdFan - 10).clamp(0, 100);
                          });
                        },
                      ),
                      Expanded(
                        child: Slider(
                          value: sliderColdFan,
                          min: 0,
                          max: 100,
                          divisions: 10,
                          label: sliderColdFan.round().toString(),
                          onChanged: (double value) {
                            setStateModal(() {
                              sliderColdFan = value;
                            });
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setStateModal(() {
                            sliderColdFan = (sliderColdFan + 10).clamp(0, 100);
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text('Set Value', style: TextStyle(fontSize: 16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setStateModal(() {
                            sliderValueFan =
                                (sliderValueFan - 10).clamp(0, 100);
                          });
                        },
                      ),
                      Expanded(
                        child: Slider(
                          value: sliderValueFan,
                          min: 0,
                          max: 100,
                          divisions: 10,
                          label: sliderValueFan.round().toString(),
                          onChanged: (double value) {
                            setStateModal(() {
                              sliderValueFan = value;
                            });
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setStateModal(() {
                            sliderValueFan =
                                (sliderValueFan + 10).clamp(0, 100);
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: ButtonLoginWidget(
                      title: 'Apply',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  _showBottomModalIrrigation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.brown[100],
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setStateModal) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Configure Irrigation',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Auto', style: TextStyle(fontSize: 18)),
                          Switch(
                            value: isSwitchedIrrigation,
                            onChanged: (value) {
                              setStateModal(() {
                                isSwitchedIrrigation = value;
                                Navigator.pop(context);
                              });
                            },
                            activeTrackColor: Colors.lightGreenAccent,
                            activeColor: Colors.green,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text('Set Humidity (%)', style: TextStyle(fontSize: 16)),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setStateModal(() {
                            humidityIrrigation =
                                (humidityIrrigation - 10).clamp(0, 100);
                          });
                        },
                      ),
                      Expanded(
                        child: Slider(
                          value: humidityIrrigation,
                          min: 0,
                          max: 100,
                          divisions: 10,
                          label: humidityIrrigation.round().toString(),
                          onChanged: (double value) {
                            setStateModal(() {
                              humidityIrrigation = value;
                            });
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setStateModal(() {
                            humidityIrrigation =
                                (humidityIrrigation + 10).clamp(0, 100);
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text('Water Amount (ml)', style: TextStyle(fontSize: 16)),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setStateModal(() {
                            waterAmountIrrigation =
                                (waterAmountIrrigation - 10).clamp(0, 100);
                          });
                        },
                      ),
                      Expanded(
                        child: Slider(
                          value: waterAmountIrrigation,
                          min: 0,
                          max: 100,
                          divisions: 10,
                          label: waterAmountIrrigation.round().toString(),
                          onChanged: (double value) {
                            setStateModal(() {
                              waterAmountIrrigation = value;
                            });
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setStateModal(() {
                            waterAmountIrrigation =
                                (waterAmountIrrigation + 10).clamp(0, 100);
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: ButtonLoginWidget(
                      title: 'Apply',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  _showBottomModalSensor(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.brown[100],
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setStateModal) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Configure Sensor',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Auto', style: TextStyle(fontSize: 18)),
                          Switch(
                            value: isSwitchedSensor,
                            onChanged: (value) {
                              setStateModal(() {
                                isSwitchedSensor = value;
                                Navigator.pop(context);
                              });
                            },
                            activeTrackColor: Colors.lightGreenAccent,
                            activeColor: Colors.green,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text('Temperature (°C)', style: TextStyle(fontSize: 16)),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setStateModal(() {
                            temperatureSensor =
                                (temperatureSensor - 1).clamp(0, 100);
                          });
                        },
                      ),
                      Expanded(
                        child: Slider(
                          value: temperatureSensor,
                          min: 0,
                          max: 100,
                          divisions: 10,
                          label: temperatureSensor.round().toString(),
                          onChanged: (double value) {
                            setStateModal(() {
                              temperatureSensor = value;
                            });
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setStateModal(() {
                            temperatureSensor =
                                (temperatureSensor + 1).clamp(0, 100);
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text('Humidity (%)', style: TextStyle(fontSize: 16)),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setStateModal(() {
                            humiditySensor = (humiditySensor - 1).clamp(0, 100);
                          });
                        },
                      ),
                      Expanded(
                        child: Slider(
                          value: humiditySensor,
                          min: 0,
                          max: 100,
                          divisions: 10,
                          label: humiditySensor.round().toString(),
                          onChanged: (double value) {
                            setStateModal(() {
                              humiditySensor = value;
                            });
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setStateModal(() {
                            humiditySensor = (humiditySensor + 1).clamp(0, 100);
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: ButtonLoginWidget(
                      title: 'Apply',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  _showBottomModalHeating(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.brown[100],
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setStateModal) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Configure Heating',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Auto', style: TextStyle(fontSize: 18)),
                          Switch(
                            value: isSwitchedHeating,
                            onChanged: (value) {
                              setStateModal(() {
                                isSwitchedHeating = value;
                                Navigator.pop(context);
                              });
                            },
                            activeTrackColor: Colors.lightGreenAccent,
                            activeColor: Colors.green,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text('Temperature (°C)', style: TextStyle(fontSize: 16)),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setStateModal(() {
                            temperatureHeating =
                                (temperatureHeating - 1).clamp(0, 100);
                          });
                        },
                      ),
                      Expanded(
                        child: Slider(
                          value: temperatureHeating,
                          min: 0,
                          max: 100,
                          divisions: 10,
                          label: temperatureHeating.round().toString(),
                          onChanged: (double value) {
                            setStateModal(() {
                              temperatureHeating = value;
                            });
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setStateModal(() {
                            temperatureHeating =
                                (temperatureHeating + 1).clamp(0, 100);
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: ButtonLoginWidget(
                      title: 'Apply',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  _showBottomModalNutrient(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.brown[100],
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setStateModal) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Configure Nutrient',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Auto', style: TextStyle(fontSize: 18)),
                          Switch(
                            value: isSwitchedNutrient,
                            onChanged: (value) {
                              setStateModal(() {
                                isSwitchedNutrient = value;
                                Navigator.pop(context);
                              });
                            },
                            activeTrackColor: Colors.lightGreenAccent,
                            activeColor: Colors.green,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text('Nutrient Amount (g)', style: TextStyle(fontSize: 16)),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setStateModal(() {
                            nutrientAmount =
                                (nutrientAmount - 10).clamp(0, 100);
                          });
                        },
                      ),
                      Expanded(
                        child: Slider(
                          value: nutrientAmount,
                          min: 0,
                          max: 100,
                          divisions: 10,
                          label: nutrientAmount.round().toString(),
                          onChanged: (double value) {
                            setStateModal(() {
                              nutrientAmount = value;
                            });
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setStateModal(() {
                            nutrientAmount =
                                (nutrientAmount + 10).clamp(0, 100);
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text('Frequency (days)', style: TextStyle(fontSize: 16)),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setStateModal(() {
                            frequency = (frequency - 1).clamp(0, 100);
                          });
                        },
                      ),
                      Expanded(
                        child: Slider(
                          value: frequency,
                          min: 0,
                          max: 100,
                          divisions: 10,
                          label: frequency.round().toString(),
                          onChanged: (double value) {
                            setStateModal(() {
                              frequency = value;
                            });
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setStateModal(() {
                            frequency = (frequency + 1).clamp(0, 100);
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: ButtonLoginWidget(
                      title: 'Apply',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showGardenOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Garden Options',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(Icons.edit, color: Colors.blue),
                title: Text('Rename Garden'),
                onTap: () {
                  Navigator.pop(context); // Đóng dialog
                },
              ),
              Divider(
                height: 1,
              ),
              ListTile(
                leading: Icon(Icons.delete, color: Colors.red),
                title: Text('Delete Garden'),
                onTap: () {
                  Navigator.pop(context); // Đóng dialog
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Đóng dialog khi nhấn nút Hủy
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        );
      },
    );
  }

  _showBottomModalDetail(BuildContext context) {
    showModalBottomSheet(
      context: context,
      scrollControlDisabledMaxHeightRatio: 0.8,
      backgroundColor: Colors.brown[100],
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setStateModal) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'The garden has an error!!!',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 300,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/images/garden/img_error.jpg',
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/home/icon_error.svg',
                          height: 30, width: 30),
                      SizedBox(width: 8),
                      Text(
                        widget.garden.description ?? 'Description not found',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.8)),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: Row(
                      children: [
                        Expanded(
                          child: ButtonLoginWidget(
                            title: 'Close',
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: ButtonLoginWidget(
                            title: 'Fix now',
                            onPressed: () {
                              showSnackBar(context,
                                  'Fixing...About 25 minutes will be completed');
                              Navigator.pop(context);
                            },
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
