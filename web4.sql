-- Table to store information about users
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(100) NOT NULL,
    UserType ENUM ('student', 'tutor') NOT NULL
);

-- Table to store information about courses
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100) NOT NULL,
    Description TEXT,
    TutorID INT,
    FOREIGN KEY (TutorID) REFERENCES Users(UserID)
);

-- Table to store booking information
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    BookingDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (StudentID) REFERENCES Users(UserID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Table to store additional information about tutors (optional)
CREATE TABLE TutorDetails (
    TutorID INT PRIMARY KEY,
    Bio TEXT,
    Experience INT,
    FOREIGN KEY (TutorID) REFERENCES Users(UserID)
);

-- Table to store reviews for tutors or courses (optional)
CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    CourseID INT,
    TutorID INT,
    StudentID INT,
    Rating INT,
    Comment TEXT,
    ReviewDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (TutorID) REFERENCES Users(UserID),
    FOREIGN KEY (StudentID) REFERENCES Users(UserID)
);
