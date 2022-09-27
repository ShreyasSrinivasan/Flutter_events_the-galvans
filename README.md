# Flutter_events_the-galvans
Connectify is a smart visiting card. A personable, informative and thoughtful LinkedIn profile, designed to connect with those who matter most to you.

For the application to run smoothly, the PC must adhere to the following:
- It must have flutter installed
- Flutter doctor should not give any errors on being run
- The device should be connected to the PC
- Run the command 'flutter run'

Upon opening the application, if existing user, they will have to sign in using their email id and password. Else, user can registerby giving the below details:
- Name
- Email Id
- Password
- LinkedIn Profile

Upon logging in, user will be directed to the home page

Home Page has 2 functionalities:
- QR Code of the current user (user A), which when scanned would give details of this user's linkedin profile
- Option to scan QR code of another user. 
  - On scanning user B's QR Code, user A will receive profile details of user B and an option to connect with user B on LinkedIn.
  - On sending connection request, the application will notify whether the request has been successfully sent or not
