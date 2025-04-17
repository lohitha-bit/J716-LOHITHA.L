CREATE DATABASE VirtualArtGallery;
USE VirtualArtGallery;

CREATE TABLE Artist (
    ArtistID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Biography TEXT,
    BirthDate DATE,
    Nationality VARCHAR(100),
    Website VARCHAR(255),
    ContactInfo VARCHAR(255)
);

CREATE TABLE Artwork (
    ArtworkID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Description TEXT,
    CreationDate DATE,
    Medium VARCHAR(100),
    ImageURL VARCHAR(255),
    ArtistID INT,
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID) ON DELETE SET NULL
);

CREATE TABLE User (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    DateOfBirth DATE,
    ProfilePicture VARCHAR(255)
);

CREATE TABLE Gallery (
    GalleryID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Location VARCHAR(255),
    Curator INT, -- Reference to ArtistID
    OpeningHours VARCHAR(255),
    FOREIGN KEY (Curator) REFERENCES Artist(ArtistID) ON DELETE SET NULL
);

CREATE TABLE User_Favorite_Artwork (
    UserID INT,
    ArtworkID INT,
    PRIMARY KEY (UserID, ArtworkID),
    FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE CASCADE,
    FOREIGN KEY (ArtworkID) REFERENCES Artwork(ArtworkID) ON DELETE CASCADE
);

CREATE TABLE Artwork_Gallery (
    ArtworkID INT,
    GalleryID INT,
    PRIMARY KEY (ArtworkID, GalleryID),
    FOREIGN KEY (ArtworkID) REFERENCES Artwork(ArtworkID) ON DELETE CASCADE,
    FOREIGN KEY (GalleryID) REFERENCES Gallery(GalleryID) ON DELETE CASCADE
);
SELECT * FROM User_Favorite_Artwork;
SELECT * FROM User WHERE UserID = 3;

SELECT * FROM Artwork WHERE ArtworkID = 3;


select * from artwork ;
INSERT INTO Artist (Name, Biography, BirthDate, Nationality, Website, ContactInfo)
VALUES 
('Vincent van Gogh', 'Dutch post-impressionist painter.', '1853-03-30', 'Dutch', 'https://vangogh.com', 'vincent@example.com'),
('Pablo Picasso', 'Spanish painter, sculptor, printmaker.', '1881-10-25', 'Spanish', 'https://picasso.com', 'picasso@example.com'),
('Frida Kahlo', 'Mexican painter known for self-portraits.', '1907-07-06', 'Mexican', 'https://frida.com', 'frida@example.com'),
('Claude Monet', 'Founder of French Impressionist painting.', '1840-11-14', 'French', 'https://monet.com', 'monet@example.com'),
('Leonardo da Vinci', 'Italian polymath of Renaissance.', '1452-04-15', 'Italian', 'https://davinci.com', 'leo@example.com'),
('Andy Warhol', 'American pop art artist.', '1928-08-06', 'American', 'https://warhol.com', 'andy@example.com'),
('Georgia O’Keeffe', 'American modernist artist.', '1887-11-15', 'American', 'https://okeeffe.com', 'georgia@example.com'),
('Salvador Dali', 'Spanish surrealist artist.', '1904-05-11', 'Spanish', 'https://dali.com', 'dali@example.com'),
('Jackson Pollock', 'Abstract expressionist painter.', '1912-01-28', 'American', 'https://pollock.com', 'jackson@example.com'),
('Rembrandt', 'Dutch Golden Age painter.', '1606-07-15', 'Dutch', 'https://rembrandt.com', 'rembrandt@example.com');

-- Artwork
INSERT INTO Artwork (Title, Description, CreationDate, Medium, ImageURL, ArtistID)
VALUES 
('Starry Night', 'Swirling night sky.', '1889-06-01', 'Oil', 'url1.jpg', 1),
('Guernica', 'Spanish Civil War painting.', '1937-06-01', 'Oil', 'url2.jpg', 2),
('Self Portrait', 'Frida’s emotional painting.', '1940-03-15', 'Oil', 'url3.jpg', 3),
('Water Lilies', 'Monet’s lily pond.', '1916-05-01', 'Oil', 'url4.jpg', 4),
('Mona Lisa', 'Famous portrait.', '1503-10-15', 'Oil', 'url5.jpg', 5),
('Campbell Soup Cans', 'Iconic pop art.', '1962-07-09', 'Acrylic', 'url6.jpg', 6),
('Black Iris', 'Flower close-up.', '1926-04-14', 'Oil', 'url7.jpg', 7),
('Persistence of Memory', 'Melting clocks.', '1931-04-01', 'Oil', 'url8.jpg', 8),
('No.5, 1948', 'Pollock’s splatter painting.', '1948-11-01', 'Oil', 'url9.jpg', 9),
('The Night Watch', 'Militia group portrait.', '1642-07-13', 'Oil', 'url10.jpg', 10);

-- User
INSERT INTO User (Username, Password, Email, FirstName, LastName, DateOfBirth, ProfilePicture)
VALUES 
('artlover01', 'pass1', 'user1@mail.com', 'Alice', 'Smith', '1990-05-10', 'img1.jpg'),
('galleryguru', 'pass2', 'user2@mail.com', 'Bob', 'Jones', '1985-11-20', 'img2.jpg'),
('painterfan', 'pass3', 'user3@mail.com', 'Cathy', 'Brown', '1993-08-15', 'img3.jpg'),
('artaddict', 'pass4', 'user4@mail.com', 'David', 'Clark', '1988-01-25', 'img4.jpg'),
('canvasqueen', 'pass5', 'user5@mail.com', 'Eva', 'Wilson', '1995-06-12', 'img5.jpg'),
('historybuff', 'pass6', 'user6@mail.com', 'Frank', 'Lee', '1982-09-10', 'img6.jpg'),
('vintageart', 'pass7', 'user7@mail.com', 'Grace', 'Miller', '1996-02-27', 'img7.jpg'),
('modernfan', 'pass8', 'user8@mail.com', 'Henry', 'Moore', '1990-12-05', 'img8.jpg'),
('artnerd', 'pass9', 'user9@mail.com', 'Irene', 'Taylor', '1987-03-17', 'img9.jpg'),
('cultureclub', 'pass10', 'user10@mail.com', 'Jack', 'Hall', '1992-11-30', 'img10.jpg');

-- Gallery
INSERT INTO Gallery (Name, Description, Location, Curator, OpeningHours)
VALUES 
('Impressionism Hub', 'Focuses on Impressionism.', 'Paris', 4, '10 AM - 6 PM'),
('Surreal Space', 'Surrealist gallery.', 'Madrid', 8, '11 AM - 7 PM'),
('Modern Mania', 'Pop and abstract art.', 'New York', 6, '9 AM - 5 PM'),
('Classic Vault', 'Renaissance & Baroque.', 'Florence', 5, '10 AM - 6 PM'),
('Dream Gallery', 'Surreal & dream-like works.', 'Barcelona', 8, '12 PM - 8 PM'),
('Floral Works', 'Nature and floral art.', 'Santa Fe', 7, '9 AM - 6 PM'),
('Color Blast', 'Bright and vivid pieces.', 'LA', 9, '11 AM - 7 PM'),
('Portrait Palace', 'Famous portraits.', 'Amsterdam', 10, '10 AM - 5 PM'),
('Historical Touch', 'History through art.', 'Rome', 5, '9 AM - 4 PM'),
('Night Visions', 'Night-themed artworks.', 'Tokyo', 1, '1 PM - 9 PM');

-- User_Favorite_Artwork
INSERT INTO User_Favorite_Artwork (UserID, ArtworkID)
VALUES 
(1, 1),
(1, 5),
(2, 2),
(3, 3),
(4, 4),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10);

-- Artwork_Gallery
INSERT INTO Artwork_Gallery (ArtworkID, GalleryID)
VALUES 
(1, 10),
(2, 2),
(3, 5),
(4, 1),
(5, 4),
(6, 3),
(7, 6),
(8, 5),
(9, 7),
(10, 8);
select * from User_Favorite_Artwork;
select * from artwork;
set @@foreign_key_checks=0;