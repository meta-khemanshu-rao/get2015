package com.metacampus.vehiclemanagement.helper;

import java.sql.Date;

import com.metacampus.vehiclemanagement.model.Bike;
import com.metacampus.vehiclemanagement.model.Car;
import com.metacampus.vehiclemanagement.model.Vehicle;
import com.metacampus.vehiclemanagement.model.VehicleType;

public class VehicleHelper {

	
	/**This function is use to insert data in bike object.
	 * @return vehicle object
	 */
	public static Bike createBike(Vehicle vehicle, boolean selfStart, float helmetPrice) {
		Bike bike = (Bike)vehicle;
		bike.setSelfStart(selfStart);
		bike.setHelmetPrice(helmetPrice); 
		return bike;
	}
	
	/**This function is use to insert data in car object.
	 * @return vehicle object
	 */
	public static Car createCar(Vehicle vehicle, boolean AC, boolean powerSteering, boolean accessoryKit) {
		Car car = (Car)vehicle;
		car.setAC(AC);
		car.setPowerSteering(powerSteering);;
		car.setAccessoryKit(accessoryKit);
		
		return car;
	}
	
	/**This function is use to insert data in vehicle object.
	 * 
	 * @return vehicle object
	 */
	@SuppressWarnings({ "static-access"})
	public static Vehicle createVehicle(VehicleType vehicleType,String created_by, Date created_time, String make, String model, String engineInCC, int fuelCapacity, 
			String mileage, float price, float roadTax) {
		Vehicle vehicle = null;
		if(vehicleType.equals(vehicleType.CAR)) {
			vehicle = new Car();
			vehicle.setCreated_by(created_by);
			vehicle.setCreated_time(created_time);
			vehicle.setMake(make);
			vehicle.setModel(model);
			vehicle.setEngineInCC(engineInCC);
			vehicle.setFuelCapacity(fuelCapacity);
			vehicle.setMileage(mileage);
			vehicle.setPrice(price);
			vehicle.setRoadTax(roadTax);
		}
		else if(vehicleType.equals(VehicleType.BIKE)) {
			vehicle = new Bike();
			vehicle.setCreated_by(created_by);
			vehicle.setCreated_time(created_time);
			vehicle.setMake(make);
			vehicle.setModel(model);
			vehicle.setEngineInCC(engineInCC);
			vehicle.setFuelCapacity(fuelCapacity);
			vehicle.setMileage(mileage);
			vehicle.setPrice(price);
			vehicle.setRoadTax(roadTax);
		}
		else {
			System.out.println("Object type is un defined");
		}
		
		return vehicle;
	}
	
}