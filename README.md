# 🏥 Clinic Booking System

##  Description

The **Clinic Booking System** is a MySQL-based database project that manages patient-doctor interactions, appointments, treatments, and specializations. It simulates real-world healthcare workflows such as:

- Scheduling appointments between patients and doctors
- Assigning doctors to multiple specializations
- Linking patients to treatments they've received
- Tracking treatment history and appointment logs

It is designed with relational database principles in mind, demonstrating one-to-one, one-to-many, and many-to-many relationships.

---

##  How to Setup and Run the Project

### Requirements
- MySQL Server (8.0 or later recommended)
- MySQL Workbench or phpMyAdmin (optional GUI)

###  Steps

1. **Clone or Download the SQL File**
   Save the `clinic_booking_system.sql` file to your machine.

2. **Open MySQL Workbench / CLI**
   Launch your MySQL client and connect to your server.

3. **Create a New Database**
   ```sql
   CREATE DATABASE clinic_db;
   USE clinic_db;