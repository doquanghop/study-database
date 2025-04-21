SELECT CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
       c.Email
FROM Customer c
         LEFT JOIN `Order` o
              ON c.CustomerId = o.CustomerId
GROUP BY c.CustomerId, c.FirstName, c.LastName, c.Email
HAVING COUNT(o.OrderId) < 2;
