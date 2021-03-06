package com.metacampus.vehiclemanagement.helper;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.metacampus.vehiclemanagement.model.Bike;
import com.metacampus.vehiclemanagement.model.Car;
import com.metacampus.vehiclemanagement.model.Vehicle;
import com.metacampus.vehiclemanagement.utils.ConnectionUtil;

/**This class does all the sql work.Objects that are read from the main class are pass to this class and then this class store them to the database.
 * @author Khemanshu
 *
 */
public class VehicleJDBCHelper {
	
	/** Stores the vehicle object to the databse by using Prepared Statement.
	 * @param vehicle
	 */
	@SuppressWarnings("resource")
	public static void insert(Vehicle vehicle) {
		try {
				String created_by = vehicle.getCreated_by();
				Date created_time = vehicle.getCreated_time();
				String make = vehicle.getMake();
				String model = vehicle.getModel();
				String engineInCC = vehicle.getEngineiInCC();
				String fuelCapacity = ""+vehicle.getFuelCapacity();
				String mileage = vehicle.getMileage();
				float price = vehicle.getPrice();
				double roadTax = vehicle.getRoadTax();
				String ac = "";
				String powerSteering = "";
				String accessoryKit = "";
				String selfStart = "";
				float helmetPrice;
				//query for inserting vehcle object in database.
				String query = "INSERT INTO vehicle(created_by, created_time, make, model, engine_cc, fuel_capacity, mileage, price, road_tax) VALUES(?,?,?,?,?,?,?,?,?)";
				Connection con = ConnectionUtil.getConnection();
				PreparedStatement preparedStmt = con.prepareStatement(query);
				preparedStmt.setString(1, created_by);
				preparedStmt.setDate(2, created_time);
				preparedStmt.setString(3, make);
				preparedStmt.setString(4, model);
				preparedStmt.setString(5, engineInCC);
				preparedStmt.setString(6, fuelCapacity);
				preparedStmt.setString(7, mileage);
				preparedStmt.setFloat(8, price);
				preparedStmt.setDouble(9, roadTax);
				preparedStmt.execute();
				
				Statement stmt = con.createStatement();
				//query to get the vehicle_id of currently inserting vehicle.
				query = "SELECT MAX(vehicle_id) as 'current vehicle' FROM vehicle";
				
				int vehicle_id = 0;
				ResultSet rs = stmt.executeQuery(query);
				
				if(rs.next()) {
					vehicle_id = rs.getInt("current vehicle");
				}
				//If the instrance of vehicle is car then the additional informnation of car is inserted in car table.
				if(vehicle instanceof Car) {
					query = "INSERT INTO car(ac, power_steering, accessory_kit, vehicle_id) VALUES(?,?,?,?)";
					Car car = (Car)vehicle;
					ac = ac+car.isAC();
					powerSteering = powerSteering + car.isPowerSteering();
					accessoryKit = accessoryKit + car.isAccessoryKit();
					preparedStmt = con.prepareStatement(query);
					preparedStmt.setString(1, ac);
					preparedStmt.setString(2, powerSteering);
					preparedStmt.setString(3,  accessoryKit);
					preparedStmt.setInt(4, vehicle_id);
					preparedStmt.execute();
				}
				//if the instance of vehicle is bike then the additional information is inserted in Bike table
				else if(vehicle instanceof Bike) {
					Bike bike = (Bike)vehicle;
					selfStart = selfStart + bike.isSelfStart();
					helmetPrice = bike.getHelmetPrice();
					
					query = "INSERT INTO bike(self_start, helmet_price, vehicle_id) VALUES(?,?,?)";
					
					preparedStmt = con.prepareStatement(query);
					preparedStmt.setString(1, selfStart);
					preparedStmt.setFloat(2, helmetPrice);
					preparedStmt.setInt(3, vehicle_id);
					preparedStmt.execute();
				}
				else {
					System.out.println("Can't create vehicle object. It is not correct type");
				}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
}
