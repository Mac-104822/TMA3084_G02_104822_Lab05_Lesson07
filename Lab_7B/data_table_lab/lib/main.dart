import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DataTable Sorting Lab',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const CarTablePage(),
    );
  }
}

class CarTablePage extends StatefulWidget {
  const CarTablePage({super.key});

  @override
  State<CarTablePage> createState() => _CarTablePageState();
}

class _CarTablePageState extends State<CarTablePage> {
  List<Car> cars = [
    Car("Honda", 2021, 35000),
    Car("Toyota", 2011, 6000),
    Car("BMW", 2010, 9000),
  ];

  bool sortAscending = true;
  int? sortColumnIndex;

  void sortBy(
    int columnIndex,
    bool ascending,
    int Function(Car a, Car b) compare,
  ) {
    setState(() {
      cars.sort((a, b) => ascending ? compare(a, b) : compare(b, a));
      sortColumnIndex = columnIndex;
      sortAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: const Text(
          "DataTable Sorting Lab",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 4,
      ),

      body: DataTable(
        sortColumnIndex: sortColumnIndex,
        sortAscending: sortAscending,
        border: TableBorder.all(color: Colors.black),
        headingRowColor: WidgetStateProperty.all<Color>(Colors.grey),
        columns: [
          DataColumn(
            label: const Text('Car Make'),
            onSort: (i, asc) =>
                sortBy(i, asc, (a, b) => a.make.compareTo(b.make)),
          ),
          DataColumn(
            label: const Text('Model'),
            numeric: true,
            onSort: (i, asc) =>
                sortBy(i, asc, (a, b) => a.model.compareTo(b.model)),
          ),
          DataColumn(
            label: const Text('Price'),
            numeric: true,
            onSort: (i, asc) =>
                sortBy(i, asc, (a, b) => a.price.compareTo(b.price)),
          ),
        ],
        rows: cars.map((car) {
          return DataRow(
            cells: [
              DataCell(Text(car.make)),
              DataCell(Text(car.model.toString())),
              DataCell(Text(car.price.toString())),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class Car {
  final String make;
  final int model;
  final int price;

  Car(this.make, this.model, this.price);
}
