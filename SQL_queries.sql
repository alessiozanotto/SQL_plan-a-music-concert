/*What genre sells the most in the US?*/
SELECT
  g.name AS genre_name,
  sum(il.quantity) AS quantity
FROM track t
JOIN invoiceline il
  ON il.trackid = t.trackid
JOIN invoice i
  ON i.invoiceid = il.invoiceid
JOIN genre g
  ON g.genreid = t.genreid
WHERE i.billingCountry = 'USA'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

/*In what city in the US does rock music sale the most?*/
SELECT
  c.city || ', ' || c.state AS cities,
  sum(il.quantity) AS quantity
FROM customer c
JOIN invoice i
  ON c.customerid=i.customerid
JOIN invoiceline il
  ON i.invoiceid=il.InvoiceId
JOIN track t
  ON il.trackid=t.TrackId
JOIN genre g
  ON t.genreid=g.genreid
WHERE
  c.country = 'USA'
  AND g.name = 'Rock'
GROUP BY 1
ORDER BY 2 DESC;

/*Who are the top 10 rock music artists in the US?*/
SELECT
  a.name AS artists,
  sum(il.quantity) AS quantity
FROM invoice i
JOIN invoiceline il
  ON i.invoiceid=il.InvoiceId
JOIN track t
  ON il.trackid=t.TrackId
JOIN genre g
  ON t.genreid=g.genreid
JOIN album al
  ON t.albumid=al.albumid
JOIN artist a
  ON al.artistid=a.artistid
WHERE
  i.billingcountry = 'USA'
  AND g.name = 'Rock'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

/*Who are the best rock music customers in the US?*/
SELECT
  c.firstname || ' ' || c.lastname AS customer_name,
  sum(il.quantity) AS quantity
FROM customer c
JOIN invoice i
  ON c.customerid=i.customerid
JOIN invoiceline il
  ON i.invoiceid=il.InvoiceId
JOIN track t
  ON il.trackid=t.TrackId
JOIN genre g
  ON t.genreid=g.genreid
WHERE
  c.country = 'USA'
  AND g.name = 'Rock'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;
