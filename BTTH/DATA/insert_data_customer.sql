-- Khách hàng 1
INSERT INTO Customer (FirstName, LastName, PhoneNumber, Email, BirthDate)
VALUES ('Nguyễn', 'Văn A', '0912345678', 'vana@email.com', '1990-05-10');
INSERT INTO CustomerAddress (CustomerId, Address, PhoneNumber)
VALUES (LAST_INSERT_ID(), '123 Đường ABC, Quận 1, TP.HCM', '0912345678'),
       (LAST_INSERT_ID(), '456 Đường XYZ, Quận 3, TP.HCM', '0912345678');

-- Khách hàng 2
INSERT INTO Customer (FirstName, LastName, PhoneNumber, Email, BirthDate)
VALUES ('Trần', 'Thị B', '0987654321', 'thib@email.com', '1995-12-20');
INSERT INTO CustomerAddress (CustomerId, Address, PhoneNumber)
VALUES (LAST_INSERT_ID(), '789 Đường DEF, Hà Nội', '0987654321');

-- Khách hàng 3
INSERT INTO Customer (FirstName, LastName, PhoneNumber, Email, BirthDate)
VALUES ('Lê', 'Văn C', '0901234567', 'vanc@email.com', '1988-08-15');
INSERT INTO CustomerAddress (CustomerId, Address, PhoneNumber)
VALUES (LAST_INSERT_ID(), '101 Đường GHI, Đà Nẵng', '0901234567');

-- Khách hàng 4
INSERT INTO Customer (FirstName, LastName, PhoneNumber, Email, BirthDate)
VALUES ('Phạm', 'Thị D', '0933333333', 'thid@email.com', '1992-03-01');
INSERT INTO CustomerAddress (CustomerId, Address, PhoneNumber)
VALUES (LAST_INSERT_ID(), '222 Đường JKL, Cần Thơ', '0933333333');

-- Khách hàng 5
INSERT INTO Customer (FirstName, LastName, PhoneNumber, Email, BirthDate)
VALUES ('Đỗ', 'Văn E', '0977777777', 'vane@email.com', '1998-07-12');
INSERT INTO CustomerAddress (CustomerId, Address, PhoneNumber)
VALUES (LAST_INSERT_ID(), '333 Đường PQR, Hải Phòng', '0977777777'); -- Thêm địa chỉ cho khách hàng 5
