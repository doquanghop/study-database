INSERT INTO `Order` (CustomerId, AddressId, OrderDate)
VALUES (1, 1, '2023-11-01'),
       (2, 3, '2023-11-02'),
       (3, 4, '2023-11-03'),
       (4, 5, '2023-11-04'),
       (1, 1, '2023-11-05'),
       (2, 3, '2023-11-06'),
       (3, 4, '2023-11-07'),
       (4, 5, '2023-11-08'),
       (1, 2, '2023-11-09'),
       (2, 3, '2023-11-10'),
       (3, 4, '2023-11-11'),
       (4, 5, '2023-11-12'),
       (1, 1, '2023-11-13'),
       (2, 3, '2023-11-14'),
       (3, 4, '2023-11-15'),
       (4, 5, '2023-11-16'),
       (1, 2, '2023-11-17'),
       (2, 3, '2023-11-18'),
       (3, 4, '2023-11-19'),
       (4, 5, '2023-11-20');

INSERT INTO OrderItem (OrderId, ProductId, Amount)
VALUES (1, 1, 2),  -- OrderId 1:  2 Áo thun (300000)
       (1, 2, 1),  --             1 Quần jean (350000)
       (2, 6, 1),  -- OrderId 2:  1 Sách lập trình (250000)
       (2, 7, 1),  --  1 Áo sơ mi (200000)
       (3, 3, 1),  -- OrderId 3:  1 Giày thể thao (800000)
       (4, 1, 1),  -- OrderId 4: 1 Áo thun
       (5, 4, 1),  -- OrderId 5: 1 Bàn phím
       (5, 5, 1),  --             1 Chuột
       (6, 10, 1), -- OrderId 6: 1 Áo khoác
       (7, 8, 1),  -- OrderId 7: 1 Quần tây
       (8, 9, 1),  -- OrderId 8: 1 Váy hoa
       (9, 5, 2),  -- OrderId 9: 2 Chuột
       (10, 6, 1), -- OrderId 10: 1 Sách
       (11, 2, 3), -- OrderId 11: 3 Quần jean
       (12, 3, 2), -- OrderId 12: 2 Giày
       (13, 4, 1),
       (14, 7, 1),
       (15, 8, 1),
       (16, 9, 1),
       (17, 10, 1),
       (18, 11, 1),
       (19, 12, 1),
       (20, 1, 1);
