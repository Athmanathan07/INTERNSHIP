 create Byjus;
 use Byjus;
 
 CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('student', 'teacher', 'admin') NOT NULL,
    date_of_birth DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

CREATE TABLE UserProfiles (
    user_id INT PRIMARY KEY,
    profile_picture VARCHAR(255),
    contact_number VARCHAR(15),
    address TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    category VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);
    
INSERT INTO Courses (title, description, category)VALUES
('Mathematics Basics', 'An introduction to basic mathematics concepts.', 'Mathematics'),
('Advanced Physics', 'In-depth study of classical and modern physics.', 'Physics'),
('Chemistry Fundamentals', 'Fundamentals of chemical reactions and properties.', 'Chemistry'),
('Biology 101', 'Introduction to biology and life sciences.', 'Biology'),
('World History', 'A comprehensive overview of world history.', 'History'),
('English Literature', 'Study of classic and modern English literature.', 'Literature'),
('Introduction to Programming', 'Basics of programming and computer science.', 'Computer Science'),
('Data Structures and Algorithms', 'In-depth study of data structures and algorithms.', 'Computer Science'),
('Psychology', 'Introduction to psychology and human behavior.', 'Social Sciences'),
('Economics', 'Fundamentals of economics and market structures.', 'Economics'),
('Business Management', 'Principles and practices of business management.', 'Business'),
('Marketing Strategies', 'Effective marketing strategies and practices.', 'Business'),
('Graphic Design', 'Basics of graphic design and visual communication.', 'Design'),
('Web Development', 'Introduction to web development technologies.', 'Computer Science'),
('Music Theory', 'Fundamentals of music theory and composition.', 'Arts'),
('Photography Basics', 'Introduction to photography and camera techniques.', 'Arts'),
('Environmental Science', 'Study of environmental systems and issues.', 'Science'),
('Philosophy', 'Introduction to philosophical concepts and thinkers.', 'Humanities'),
('Political Science', 'Basics of political systems and theories.', 'Social Sciences'),
('Creative Writing', 'Techniques and practices of creative writing.', 'Literature');





CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    course_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATE NOT NULL,
    payment_method VARCHAR(50),
    status ENUM('completed', 'pending', 'failed') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Users (name, email, password_hash, role, date_of_birth)
VALUES
('Aarav Sharma', 'aarav.sharma@example.com', 'hash1', 'student', '2005-01-15'),
('Emily Johnson', 'emily.johnson@example.com', 'hash2', 'student', '2006-02-20'),
('Ravi Kumar', 'ravi.kumar@example.com', 'hash3', 'teacher', '1980-03-25'),
('Sophia Williams', 'sophia.williams@example.com', 'hash4', 'student', '2005-04-30'),
('Lakshmi Iyer', 'lakshmi.iyer@example.com', 'hash5', 'admin', '1975-05-10'),
('Olivia Brown', 'olivia.brown@example.com', 'hash6', 'student', '2006-06-15'),
('Amit Patel', 'amit.patel@example.com', 'hash7', 'teacher', '1978-07-20'),
('Isabella Jones', 'isabella.jones@example.com', 'hash8', 'student', '2005-08-25'),
('Rahul Singh', 'rahul.singh@example.com', 'hash9', 'teacher', '1982-09-30'),
('Mia Miller', 'mia.miller@example.com', 'hash10', 'student', '2006-10-05'),
('Neha Desai', 'neha.desai@example.com', 'hash11', 'admin', '1985-11-10'),
('Ella Davis', 'ella.davis@example.com', 'hash12', 'student', '2005-12-15'),
('Vikram Rao', 'vikram.rao@example.com', 'hash13', 'teacher', '1979-01-20'),
('Ava Wilson', 'ava.wilson@example.com', 'hash14', 'student', '2006-02-25'),
('Sanjay Gupta', 'sanjay.gupta@example.com', 'hash15', 'admin', '1983-03-05'),
('Charlotte Taylor', 'charlotte.taylor@example.com', 'hash16', 'student', '2005-04-10'),
('Anjali Mehta', 'anjali.mehta@example.com', 'hash17', 'teacher', '1981-05-15'),
('Amelia Anderson', 'amelia.anderson@example.com', 'hash18', 'student', '2006-06-20'),
('Arjun Reddy', 'arjun.reddy@example.com', 'hash19', 'teacher', '1984-07-25'),
('Grace Thomas', 'grace.thomas@example.com', 'hash20', 'student', '2005-08-30');



INSERT INTO UserProfiles (user_id, profile_picture, contact_number, address)
VALUES
(1, 'profile_pics/aarav_sharma.jpg', '9876543210', '123 MG Road, New Delhi, India'),
(2, 'profile_pics/emily_johnson.jpg', '8765432109', '456 Elm Street, London, UK'),
(3, 'profile_pics/ravi_kumar.jpg', '7654321098', '789 Kormangala, Bangalore, India'),
(4, 'profile_pics/sophia_williams.jpg', '6543210987', '321 Oak Avenue, Manchester, UK'),
(5, 'profile_pics/lakshmi_iyer.jpg', '5432109876', '987 Park Lane, Chennai, India'),
(6, 'profile_pics/olivia_brown.jpg', '4321098765', '654 Pine Street, Liverpool, UK'),
(7, 'profile_pics/amit_patel.jpg', '3210987654', '159 Juhu Road, Mumbai, India'),
(8, 'profile_pics/isabella_jones.jpg', '2109876543', '852 Maple Street, Birmingham, UK'),
(9, 'profile_pics/rahul_singh.jpg', '1098765432', '753 Sector 14, Gurgaon, India'),
(10, 'profile_pics/mia_miller.jpg', '9876543211', '963 Cedar Avenue, Bristol, UK'),
(11, 'profile_pics/neha_desai.jpg', '8765432110', '654 Marine Drive, Ahmedabad, India'),
(12, 'profile_pics/ella_davis.jpg', '7654321109', '258 Birch Street, Leeds, UK'),
(13, 'profile_pics/vikram_rao.jpg', '6543211098', '159 High Street, Hyderabad, India'),
(14, 'profile_pics/ava_wilson.jpg', '5432110987', '357 Spruce Street, Sheffield, UK'),
(15, 'profile_pics/sanjay_gupta.jpg', '4321109876', '753 Connaught Place, Pune, India'),
(16, 'profile_pics/charlotte_taylor.jpg', '3211098765', '951 Willow Lane, Newcastle, UK'),
(17, 'profile_pics/anjali_mehta.jpg', '2109876654', '456 Andheri West, Mumbai, India'),
(18, 'profile_pics/amelia_anderson.jpg', '1098765543', '789 Chestnut Street, Oxford, UK'),
(19, 'profile_pics/arjun_reddy.jpg', '9876654432', '159 Jubilee Hills, Hyderabad, India'),
(20, 'profile_pics/grace_thomas.jpg', '8765543321', '456 Fir Street, Cambridge, UK');

INSERT INTO Payments (user_id, course_id, amount, payment_date, payment_method, status)
VALUES
(1, 1, 199.99, '2023-01-15', 'Credit Card', 'completed'),
(2, 2, 289.75, '2023-02-20', 'PayPal', 'completed'),
(3, 3, 159.49, '2023-03-25', 'Debit Card', 'completed'),
(4, 4, 219.99, '2023-04-30', 'Credit Card', 'pending'),
(5, 5, 255.30, '2023-05-10', 'PayPal', 'completed'),
(6, 6, 184.70, '2023-06-15', 'Credit Card', 'failed'),
(7, 7, 310.15, '2023-07-20', 'Debit Card', 'completed'),
(8, 8, 143.99, '2023-08-25', 'Credit Card', 'completed'),
(9, 9, 194.99, '2023-09-30', 'PayPal', 'pending'),
(10, 10, 234.80, '2023-10-05', 'Credit Card', 'completed'),
(11, 11, 172.50, '2023-11-10', 'Debit Card', 'completed'),
(12, 12, 267.65, '2023-12-15', 'Credit Card', 'completed'),
(13, 13, 158.99, '2024-01-20', 'PayPal', 'completed'),
(14, 14, 199.99, '2024-02-25', 'Credit Card', 'pending'),
(15, 15, 245.00, '2024-03-05', 'Debit Card', 'failed'),
(16, 16, 193.50, '2024-04-10', 'Credit Card', 'completed'),
(17, 17, 289.99, '2024-05-15', 'PayPal', 'completed'),
(18, 18, 149.99, '2024-06-20', 'Credit Card', 'completed'),
(19, 19, 215.25, '2024-07-25', 'Debit Card', 'completed'),
(20, 20, 249.99, '2024-08-30', 'Credit Card', 'pending');
