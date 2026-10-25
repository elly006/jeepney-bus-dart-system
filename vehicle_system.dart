
abstract class Vehicle {
  String plateNumber;
  int capacity;
  List<String> _passengers = [];

  Vehicle(this.plateNumber, this.capacity);

  int get passengerCount => _passengers.length;

  void boardPassenger(String name) {
    if (_passengers.length < capacity) {
      _passengers.add(name);
      print("$name boarded $plateNumber.");
    } else {
      print("$plateNumber is full. $name cannot board.");
    }
  }

  void displayInfo();

  // Asynchronous method to simulate saving vehicle data
  Future<String> saveVehicleData() async {
    print("Saving data for $plateNumber...");

    await Future.delayed(Duration(seconds: 2));

    return "Vehicle $plateNumber saved successfully!";
  }
}

mixin Maintenance on Vehicle {
  void checkMaintenance() {
    print("$plateNumber maintenance check completed.");
  }
}

class Jeepney extends Vehicle with Maintenance {
  Jeepney(String plateNumber, int capacity)
      : super(plateNumber, capacity);

  @override
  void displayInfo() {
    print("Vehicle Type: Jeepney");
    print("Plate Number: $plateNumber");
    print("Capacity: $capacity passengers");
  }
}

class Bus extends Vehicle {
  Bus(String plateNumber, int capacity)
      : super(plateNumber, capacity);

  @override
  void displayInfo() {
    print("Vehicle Type: Bus");
    print("Plate Number: $plateNumber");
    print("Capacity: $capacity passengers");
  }
}

Future<void> main() async {
  Jeepney jeepney = Jeepney("ABC-123", 2);
  Bus bus = Bus("BUS-456", 5);

  print("=== JEEPNEY ASYNC SYSTEM ===");

  jeepney.displayInfo();
  jeepney.boardPassenger("Ana");
  jeepney.boardPassenger("Ben");
  jeepney.checkMaintenance();

  print("\nStarting asynchronous operation...");

  // Start saving without waiting for the result immediately.
  Future<String> saveFuture = jeepney.saveVehicleData();

  print("The program can continue while saving is in progress.");
  print("Please wait for the result...");

  // Wait for the asynchronous operation to finish.
  String result = await saveFuture;

  print(result);

  print("\n=== BUS INFORMATION ===");
  bus.displayInfo();

  print("\nProgram completed.");
}
