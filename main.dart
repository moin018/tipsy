import 'package:flutter/material.dart';

void main() {
  runApp(const TipsyApp());
}

class TipsyApp extends StatelessWidget {
  const TipsyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tipsy',
      theme: ThemeData(
        scaffoldBackgroundColor:
            Colors.black, // Change scaffold background color to black
        fontFamily: 'Arial',
      ),
      home: const TipsyHomePage(),
      debugShowCheckedModeBanner: false, // Remove the debug banner
    );
  }
}

class TipsyHomePage extends StatefulWidget {
  const TipsyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TipsyHomePageState createState() => _TipsyHomePageState();
}

class _TipsyHomePageState extends State<TipsyHomePage> {
  double billAmount = 0.0;
  int numOfPeople = 1;
  double tipPercentage = 0.1; // Default tip percentage is 10%

  void calculateBill() {
    double tipAmount = billAmount * tipPercentage;
    double totalAmount = billAmount + tipAmount;
    double billPerPerson = totalAmount / numOfPeople;

    // Update the state to reflect the calculated values
    setState(() {
      _tipAmount = tipAmount;
      _totalAmount = totalAmount;
      _billPerPerson = billPerPerson;
    });
  }

  double _tipAmount = 0.0;
  double _totalAmount = 0.0;
  double _billPerPerson = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tipsy',
          style: TextStyle(
            color: Colors.white, // Change app bar title color to white
          ),
        ),
        backgroundColor:
            Colors.black, // Change app bar background color to black
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  color: Colors.white, // Change container color to white
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Per Person Bill',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Change text color to black
                        ),
                      ),
                      Text(
                        '\$${_billPerPerson.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Change text color to black
                        ),
                      ),
                      Text(
                        'Subtotal: \$${billAmount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black, // Change text color to black
                        ),
                      ),
                      Text(
                        'Tip: \$${_tipAmount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black, // Change text color to black
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  color: Colors.white, // Change container color to white
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Total Bill',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Change text color to black
                        ),
                      ),
                      Text(
                        '\$${_totalAmount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Change text color to black
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTipButton(0.1),
                buildTipButton(0.15),
                buildTipButton(0.2),
                buildTipButton(0.25),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Total Bill Amount',
                      labelStyle: TextStyle(
                        color: Colors.white, // Change label color to white
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              Colors.white, // Change underline color to white
                        ),
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.white, // Change text color to white
                    ),
                    onChanged: (value) {
                      setState(() {
                        billAmount = double.tryParse(value) ?? 0.0;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Number of People',
                      labelStyle: TextStyle(
                        color: Colors.white, // Change label color to white
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              Colors.white, // Change underline color to white
                        ),
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.white, // Change text color to white
                    ),
                    onChanged: (value) {
                      setState(() {
                        numOfPeople = int.tryParse(value) ?? 1;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: calculateBill,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.pink, // Change button background color to pink
              ),
              child: const Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTipButton(double percentage) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          tipPercentage = percentage;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pink, // Change button background color to pink
      ),
      child: Text(
        '${(percentage * 100).toInt()}%',
        style: const TextStyle(
          color: Colors.white, // Change button text color to white
        ),
      ),
    );
  }
}
