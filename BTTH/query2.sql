SELECT DISTINCT ca.Address
FROM `Order` o
         JOIN OrderItem oi
              ON o.OrderId = oi.OrderId
         JOIN Product p
              ON oi.ProductId = p.ProductId
         JOIN CustomerAddress ca
              ON o.AddressId = ca.AddressId
GROUP BY o.OrderId, ca.Address
HAVING SUM(oi.Amount * p.Price) < 2000000;
