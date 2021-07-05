select 
   Cohort
 , sum(m0) m0
 , sum(m1) m1 
 , sum(m2) m2  
 , sum(m3) m3  
 , sum(m4) m4  
 , sum(m5) m5  
 , sum(m6) m6  
 , sum(m7) m7  
 , sum(m8) m8  
 , sum(m9) m9  
 , sum(m10) m10 
 , sum(m11) m11 
from 
(SELECT
    Clients.CreatedAt Cohort
--   , Clients.PhoneNumber AS PhoneNumber
  ,(SELECT IIF(COUNT(O.DateAdded) = 0 , 0, 1) FROM Orders O WHERE O.DateAdded = DATEADD(MONTH, 0, Clients.CreatedAt) AND O.PhoneNumber = Clients.PhoneNumber) AS  m0
  ,(SELECT IIF(COUNT(O.DateAdded) = 0 , 0, 1) FROM Orders O WHERE O.DateAdded = DATEADD(MONTH, 1, Clients.CreatedAt) AND O.PhoneNumber = Clients.PhoneNumber) AS  m1
  ,(SELECT IIF(COUNT(O.DateAdded) = 0 , 0, 1) FROM Orders O WHERE O.DateAdded = DATEADD(MONTH, 2, Clients.CreatedAt) AND O.PhoneNumber = Clients.PhoneNumber) AS  m2
  ,(SELECT IIF(COUNT(O.DateAdded) = 0 , 0, 1) FROM Orders O WHERE O.DateAdded = DATEADD(MONTH, 3, Clients.CreatedAt) AND O.PhoneNumber = Clients.PhoneNumber) AS  m3
  ,(SELECT IIF(COUNT(O.DateAdded) = 0 , 0, 1) FROM Orders O WHERE O.DateAdded = DATEADD(MONTH, 4, Clients.CreatedAt) AND O.PhoneNumber = Clients.PhoneNumber) AS  m4
  ,(SELECT IIF(COUNT(O.DateAdded) = 0 , 0, 1) FROM Orders O WHERE O.DateAdded = DATEADD(MONTH, 5, Clients.CreatedAt) AND O.PhoneNumber = Clients.PhoneNumber) AS  m5
  ,(SELECT IIF(COUNT(O.DateAdded) = 0 , 0, 1) FROM Orders O WHERE O.DateAdded = DATEADD(MONTH, 6, Clients.CreatedAt) AND O.PhoneNumber = Clients.PhoneNumber) AS  m6
  ,(SELECT IIF(COUNT(O.DateAdded) = 0 , 0, 1) FROM Orders O WHERE O.DateAdded = DATEADD(MONTH, 7, Clients.CreatedAt) AND O.PhoneNumber = Clients.PhoneNumber) AS  m7
  ,(SELECT IIF(COUNT(O.DateAdded) = 0 , 0, 1) FROM Orders O WHERE O.DateAdded = DATEADD(MONTH, 8, Clients.CreatedAt) AND O.PhoneNumber = Clients.PhoneNumber) AS  m8
  ,(SELECT IIF(COUNT(O.DateAdded) = 0 , 0, 1) FROM Orders O WHERE O.DateAdded = DATEADD(MONTH, 9, Clients.CreatedAt) AND O.PhoneNumber = Clients.PhoneNumber) AS  m9
  ,(SELECT IIF(COUNT(O.DateAdded) = 0 , 0, 1) FROM Orders O WHERE O.DateAdded = DATEADD(MONTH, 10, Clients.CreatedAt) AND O.PhoneNumber = Clients.PhoneNumber) AS m10
  ,(SELECT IIF(COUNT(O.DateAdded) = 0 , 0, 1) FROM Orders O WHERE O.DateAdded = DATEADD(MONTH, 11, Clients.CreatedAt) AND O.PhoneNumber = Clients.PhoneNumber) AS m11
FROM (select                                                                                                                                                       12
          PhoneNumber, 
          min(DateAdded) CreatedAt
    from Orders
    group by PhoneNumber
    ) Clients
 ) UserActivityFlow
-- check continuity order by month (optional)
where m0 = 1 or m1 = 0 and m2 = 0 and m3 = 0 and m4 = 0 and m5 = 0 and m6 = 0 and m7 = 0 and m8 = 0 and m9 = 0 and m10 = 0 and m11 = 0
   or m0 = 1 or m1 = 1 and m2 = 0 and m3 = 0 and m4 = 0 and m5 = 0 and m6 = 0 and m7 = 0 and m8 = 0 and m9 = 0 and m10 = 0 and m11 = 0
   or m0 = 1 or m1 = 1 and m2 = 1 and m3 = 0 and m4 = 0 and m5 = 0 and m6 = 0 and m7 = 0 and m8 = 0 and m9 = 0 and m10 = 0 and m11 = 0
   or m0 = 1 or m1 = 1 and m2 = 1 and m3 = 1 and m4 = 0 and m5 = 0 and m6 = 0 and m7 = 0 and m8 = 0 and m9 = 0 and m10 = 0 and m11 = 0
   or m0 = 1 or m1 = 1 and m2 = 1 and m3 = 1 and m4 = 1 and m5 = 0 and m6 = 0 and m7 = 0 and m8 = 0 and m9 = 0 and m10 = 0 and m11 = 0
   or m0 = 1 or m1 = 1 and m2 = 1 and m3 = 1 and m4 = 1 and m5 = 1 and m6 = 0 and m7 = 0 and m8 = 0 and m9 = 0 and m10 = 0 and m11 = 0
   or m0 = 1 or m1 = 1 and m2 = 1 and m3 = 1 and m4 = 1 and m5 = 1 and m6 = 1 and m7 = 0 and m8 = 0 and m9 = 0 and m10 = 0 and m11 = 0
   or m0 = 1 or m1 = 1 and m2 = 1 and m3 = 1 and m4 = 1 and m5 = 1 and m6 = 1 and m7 = 1 and m8 = 0 and m9 = 0 and m10 = 0 and m11 = 0
   or m0 = 1 or m1 = 1 and m2 = 1 and m3 = 1 and m4 = 1 and m5 = 1 and m6 = 1 and m7 = 1 and m8 = 1 and m9 = 0 and m10 = 0 and m11 = 0
   or m0 = 1 or m1 = 1 and m2 = 1 and m3 = 1 and m4 = 1 and m5 = 1 and m6 = 1 and m7 = 1 and m8 = 1 and m9 = 1 and m10 = 0 and m11 = 0
   or m0 = 1 or m1 = 1 and m2 = 1 and m3 = 1 and m4 = 1 and m5 = 1 and m6 = 1 and m7 = 1 and m8 = 1 and m9 = 1 and m10 = 1 and m11 = 0
   or m0 = 1 or m1 = 1 and m2 = 1 and m3 = 1 and m4 = 1 and m5 = 1 and m6 = 1 and m7 = 1 and m8 = 1 and m9 = 1 and m10 = 1 and m11 = 1
group by Cohort
