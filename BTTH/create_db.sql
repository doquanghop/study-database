CREATE TABLE Customer
(
    CustomerId  INT AUTO_INCREMENT PRIMARY KEY,
    FirstName   VARCHAR(50)        NOT NULL,
    LastName    VARCHAR(50)        NOT NULL,
    PhoneNumber VARCHAR(20) UNIQUE NOT NULL,
    Email       VARCHAR(255),
    BirthDate   DATE
);

CREATE TABLE CustomerAddress
(
    AddressId   INT AUTO_INCREMENT PRIMARY KEY,
    CustomerId  INT          NOT NULL,
    Address     VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(20)  NOT NULL,
    FOREIGN KEY (CustomerId) REFERENCES Customer (CustomerId) ON DELETE RESTRICT
);

CREATE TABLE Product
(
    ProductId   INT AUTO_INCREMENT PRIMARY KEY,
    Name        VARCHAR(255) NOT NULL,
    Description TEXT,
    Price       INT          NOT NULL
);

CREATE TABLE `Order`
(
    OrderId    INT AUTO_INCREMENT PRIMARY KEY,
    CustomerId INT  NOT NULL,
    AddressId  INT  NOT NULL,
    OrderDate  DATE NOT NULL,
    FOREIGN KEY (CustomerId) REFERENCES Customer (CustomerId) ON DELETE RESTRICT,
    FOREIGN KEY (AddressId) REFERENCES CustomerAddress (AddressId) ON DELETE RESTRICT
);

CREATE TABLE OrderItem
(
    OrderId   INT,
    ProductId INT,
    Amount    INT NOT NULL,
    PRIMARY KEY (OrderId, ProductId),
    FOREIGN KEY (OrderId) REFERENCES `Order` (OrderId) ON DELETE RESTRICT,
    FOREIGN KEY (ProductId) REFERENCES Product (ProductId) ON DELETE RESTRICT
);


DELIMITER //

-- Tạo trigger mới kiểm tra khi thêm đơn hàng
CREATE TRIGGER ensure_customer_has_address
    BEFORE INSERT
    ON `Order`
    FOR EACH ROW
BEGIN
    IF NOT EXISTS (SELECT 1
                   FROM CustomerAddress
                   WHERE CustomerId = NEW.CustomerId) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Khách hàng phải có ít nhất một địa chỉ trước khi đặt hàng.';
    END IF;
END //

DELIMITER ;