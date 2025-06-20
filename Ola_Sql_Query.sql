--Create a table for Ola Booking System
CREATE TABLE booking (
    Date DATE,
    Time TIME,
    Booking_ID VARCHAR(50) PRIMARY KEY,
    Booking_Status VARCHAR(50),
    Customer_ID VARCHAR(50),
    Vehicle_Type VARCHAR(50),
    Pickup_Location TEXT,
    Drop_Location TEXT,
    V_TAT VARCHAR(50),
    C_TAT VARCHAR(50),
    Canceled_Rides_by_Customer VARCHAR(100),
    Canceled_Rides_by_Driver VARCHAR(100),
    Incomplete_Rides VARCHAR(100),
    Incomplete_Rides_Reason TEXT,
    Booking_Value NUMERIC(10, 2),
    Payment_Method VARCHAR(50),
    Ride_Distance NUMERIC(10, 2),
    Driver_Ratings NUMERIC(2, 1),
    Customer_Rating NUMERIC(2, 1),
    Vehicle_Images TEXT
);

--1. retrieve all successful booking
CREATE VIEW Successful_Booking AS
SELECT * FROM booking 
WHERE Booking_Status = 'Success';

/*Ans:*/ SELECT * FROM Successful_Booking;

--Q2. Find the average ride distance for each vehicle type
CREATE VIEW Average_Ride_Distance_Vehical AS
      SELECT vehicle_type,
      AVG(ride_distance) As Average_Ride_Distance 
      FROM booking
GROUP BY vehicle_type;

/*Ans:*/ SELECT * FROM Average_Ride_Distance_Vehical;

--Q3. Get the total number of canceled rides by customers:
CREATE VIEW Total_Canceled_Rides_By_Customers AS
            SELECT COUNT(canceled_rides_by_customer) AS Total_Canceled_Rides_By_Customers 
FROM booking ;

/*Ans:*/ SELECT * FROM Total_Canceled_Rides_By_Customers;

--Q4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW Total_Rides AS 
       SELECT Customer_ID, COUNT(Booking_ID) AS Total_Rides
       FROM booking 
       GROUP BY Customer_ID
ORDER BY Total_Rides DESC LIMIT 5;

/*Ans:*/ SELECT * FROM Total_Rides;

--Q5. Get the number of rides canceled by drivers due to personal and car-related issues:
CREATE VIEW number_of_rides_canceled_by_drivers AS
       SELECT COUNT(canceled_rides_by_driver) AS number_of_rides_canceled_by_drivers FROM booking
WHERE canceled_rides_by_driver = 'Personal & Car related issue';

/*Ans:*/ SELECT * FROM number_of_rides_canceled_by_drivers;

--Q6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW Max_and_Min_Driver_Rating AS
SELECT vehicle_type, MAX(driver_ratings) AS Max_Driver_Rating, 
                     MIN(driver_ratings) AS Min_Driver_Rating 
					 FROM booking
                     WHERE vehicle_type = 'Prime Sedan'
GROUP BY vehicle_type;

/*Ans:*/ SELECT * FROM Max_and_Min_Driver_Rating;

--Q7. Retrieve all rides where payment was made using UPI:
CREATE VIEW Payment_UPI AS
SELECT * FROM booking 
WHERE payment_method = 'UPI';

/*Ans:*/ SELECT * FROM Payment_UPI;

--Q8. Find the average customer rating per vehicle type:
CREATE VIEW Avg_Customer_Rating_Per_Vehicle_Type AS
SELECT Vehicle_Type, ROUND(AVG(Customer_Rating),2) AS Avg_Customer_Rating_Per_Vehicle_Type FROM booking 
GROUP BY Vehicle_Type;

/*Ans:*/ SELECT * FROM Avg_Customer_Rating_Per_Vehicle_Type;

--Q9. Calculate the total booking value of rides completed successfully:
CREATE VIEW Rides_Completed_Successfully_Values AS
SELECT SUM(Booking_Value) AS Total_Successful_Value FROM booking 
WHERE Booking_Status = 'Success';

/*Ans:*/ SELECT * FROM Rides_Completed_Successfully_Values;

--Q10. List all incomplete rides along with the reason:
CREATE VIEW Incomplete_Rides_And_Reason AS
SELECT  Booking_ID, Incomplete_Rides_Reason FROM booking 
WHERE Incomplete_Rides = 'Yes';

/*Ans:*/ SELECT * FROM Incomplete_Rides_And_Reason;
