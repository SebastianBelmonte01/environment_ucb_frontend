# Classroom Reservation System

This is a Flutter app with a Spring Boot backend that serves as a classroom reservation system for professors. The app automates the process of reserving classrooms for extra classes, allowing professors to easily request and manage reservations. It also includes features for administrators to review and handle reservations and claims.

## Features

- **Professor Interface**: Professors can log in to the app and access various screens to manage their reservations and claims.
- **Classroom Reservation**: Professors can request a reservation for a specific environment or classroom through the app.
- **Automatic Assignment**: The app automatically assigns a classroom to the professor based on their reservation request.
- **QR Code Entrance**: Professors can register their entrance to the assigned classroom by scanning a QR code.
- **Claims Submission**: If professors encounter any issues with their reservation, they can submit a claim along with pictures of the classroom.
- **Administrator Interface**: Administrators can log in to the app and perform actions related to reservations and claims.
- **Reservation Approval**: Administrators can review and accept or decline reservation requests from professors.
- **Claims Handling**: Administrators can address claims by providing a response and reviewing the pictures submitted by professors.

## Repository Links

- [Spring Boot Backend Repository](https://github.com/SebastianBelmonte01/environment_ucb_backend)

## Screenshots

### Professor Screens

#### Login
![Login](readme-screen/login.jpeg)

#### Loading Screen
![Loading](readme-screen/loading.jpeg)

#### Initial Screen
![Initial Screen](readme-screen/initial_screen.jpeg)

#### Register a New Request
![New Request 1](readme-screen/new_request.jpeg)
![New Request 2](readme-screen/new_request2.jpeg)

#### Classroom Assignment
![Successful Assignment](readme-screen/success.jpeg)
![Failed Assignment](readme-screen/failure.jpeg)

#### Pending Requests
![Pending Requests](readme-screen/request.jpeg)

#### Accepted Requests
![Accepted Requests](readme-screen/accepted.jpeg)
![Accepted Request Information](readme-screen/accepted_info.jpeg)
![Share Reservation](readme-screen/share.jpeg)

#### Register Entrance
![Register Entrance](readme-screen/qr_scan.jpeg)

#### Finished Reservations
![Finished Reservations](readme-screen/finished.jpeg)

#### Register Claim
![Register Claim](readme-screen/res_claim.jpeg)

#### Pending Claims
![Pending Claims](readme-screen/pending_claims.jpeg)

#### Attended Claims Information
This screenshot shows a response from the administrator of the University regarding a claim.
![Attended Claims Information](readme-screen/attended_claim.jpeg)

### Admin Screens

#### Professor's Reservation Information
![Professor's Reservation Information](readme-screen/admin/admin.jpeg)

#### Pending Claims
![Pending Claims](readme-screen/admin/admin_claim.jpeg)

The admin can view the picture submitted by the professor for a claim.
![Admin Viewing Claim Picture](readme-screen/admin/admin_see_claim.jpeg)

Feel free to explore the repository for more information about the app's implementation and usage.
