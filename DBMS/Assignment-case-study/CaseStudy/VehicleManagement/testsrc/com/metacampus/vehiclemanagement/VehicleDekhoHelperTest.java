package com.metacampus.vehiclemanagement;

import static org.junit.Assert.*;

import java.util.HashSet;
import java.util.Set;

import org.junit.Test;

import com.metacampus.vehiclemanagement.helper.VehicleHelper;
import com.metacampus.vehiclemanagement.model.Bike;
import com.metacampus.vehiclemanagement.model.Car;
import com.metacampus.vehiclemanagement.model.Vehicle;
import com.metacampus.vehiclemanagement.model.VehicleType;
import com.metacampus.vehiclemanagement.printer.VehicleDetailPrinter;

public class VehicleDekhoHelperTest {

	@Test
	public void testCreateCar() {
		Car car=null;
		Vehicle vehicle = VehicleHelper.createVehicle(VehicleType.CAR, "Hundai", new java.sql.Date(new java.util.Date().getTime()), "Hundai", "i20", "1300cc", 30, "21.17", 821405, 21);
		if(vehicle instanceof Car){
			car = VehicleHelper.createCar(vehicle, true, true, true);	
		}
		assertNotNull(vehicle);
		assertEquals("1300cc",car.getEngineiInCC());
	}
	
	@Test
	public void testCreateBike() {
		Bike bike = null;
		Vehicle vehicle = VehicleHelper.createVehicle(VehicleType.BIKE, "Honda", new java.sql.Date(new java.util.Date().getTime()), "Honda", "Activa", "124cc", 8, "60.04", 56000, 11);
		if(vehicle instanceof Bike){
			bike = VehicleHelper.createBike(vehicle, true, 1199);
		}
		assertNotNull(vehicle);
		assertEquals("124cc",vehicle.getEngineiInCC());
	}
	
	@Test
	public void testToString() {
		Car car=null;
		Vehicle vehicle = VehicleHelper.createVehicle(VehicleType.CAR, "Hundai", new java.sql.Date(new java.util.Date().getTime()),"Hundai", "i20", "1300cc", 30, "21.17", 821405, 21);
		if(vehicle instanceof Car){
			car = VehicleHelper.createCar(vehicle, true, true, true);	
		}
		assertNotNull(car);
		assertEquals("Created_by:Hundai, Make:Hundai, Model:i20 ,engineInCC:1300cc, fuelCapacity:30, mileage:21.17, Price:821405.0,"
				+ " roadTax:21.0, AC:true, powerSteering:true, accessoryKit:true",VehicleDetailPrinter.printVehicleSpecification(car));
	}
	
	@Test
	public void testToStringBike() {
		Bike bike = null;
		Vehicle vehicle = VehicleHelper.createVehicle(VehicleType.BIKE, "Honda", new java.sql.Date(new java.util.Date().getTime()),"Honda", "Activa", "124cc", 8, "60.04", 56000, 11);
		if(vehicle instanceof Bike){
			bike = VehicleHelper.createBike(vehicle, true, 1199);
		}
		assertNotNull(bike);
		assertEquals("Created_by:Honda, Make:Honda, Model:Activa ,engineInCC:124cc, fuelCapacity:8, mileage:60.04, Price:56000.0,"
				+ " roadTax:11.0, selfStart:true, helmetPrice:1199.0",VehicleDetailPrinter.printVehicleSpecification(bike));
		
	}
	
	@Test
	public void testSet() {
		Set<Vehicle> vehicleSet = new HashSet<Vehicle>();
		Bike bike1 = null;
		Vehicle vehicleBike1 = VehicleHelper.createVehicle(VehicleType.BIKE, "Honda", new java.sql.Date(new java.util.Date().getTime()),"Honda", "Activa", "124cc", 8, "60.04", 56000, 11);
		if(vehicleBike1 instanceof Bike){
			bike1 = VehicleHelper.createBike(vehicleBike1, true, 1199);
		}
		vehicleSet.add(bike1);
		Bike bike2 = null;
		Vehicle vehicleBike2 = VehicleHelper.createVehicle(VehicleType.BIKE, "Honda", new java.sql.Date(new java.util.Date().getTime()),"Honda", "Activa", "124cc", 8, "60.04", 56000, 11);
		if(vehicleBike2 instanceof Bike){
			bike2 = VehicleHelper.createBike(vehicleBike2, true, 1199);
		}
		vehicleSet.add(bike2);
		Car car=null;
		Vehicle vehicleCar1 = VehicleHelper.createVehicle(VehicleType.CAR, "Hundai", new java.sql.Date(new java.util.Date().getTime()),"Hundai", "i20", "1300cc", 30, "21.17", 821405, 21);
		if(vehicleCar1 instanceof Car){
			car = VehicleHelper.createCar(vehicleCar1, true, true, true);	
		}
		vehicleSet.add(car);
		System.out.println("Size of vehicleSet is " + vehicleSet.size());
		assertEquals("not matched", 2, vehicleSet.size());
		
	}
	

}