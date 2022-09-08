public class order {
    int package1;
    String model;
    int cpu;
    int gpu;
    int hdd;
    int ram;
    int body;
    int paint;
    int display;
    int wash;
    String status;
    String username;

public order(int package1, String model, int cpu, int gpu, int hdd, int ram, int body, int paint, int display, int wash,
String status,
String username ) { 
    this.package1=package1;
    this.model=model;
    this.cpu=cpu;
    this.gpu=gpu;
    this.hdd=hdd;
    this.ram=ram;
    this.display=display;
    this.body=body;
    this.wash=wash;
    this.paint=paint;
    this.status=status;
    this.username=username;

}

    // public String toString() {
    //     return "Name: " + name + " Address: " + address + " Phone No: " + phoneNum;
    // }
}
