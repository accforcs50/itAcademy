/*1. Quantitat de registres de la taula de vols:*/

SELECT COUNT(*) FROM flights;

/*2. Retard promig de sortida i arribada segons l’aeroport origen.*/

SELECT Origin,
    AVG(ArrDelay) as prom_arribades,
    AVG(DepDelay) as prom_sortides
FROM flights
GROUP BY Origin
ORDER BY Origin;

/*3. Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen. A més, volen que els
resultat es mostrin de la següent forma (fixa’t en l’ordre de les files):*/

SELECT Origin, 
    colYear as Year,
    colMonth as Month,
    AVG(ArrDelay) as prom_arribades
FROM flights
GROUP BY Origin, colYear, colMonth
ORDER BY Origin;

/*Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen (mateixa consulta que
abans i amb el mateix ordre). Però a més, ara volen que en comptes del codi de l’aeroport es mostri
el nom de la ciutat.*/

SELECT u.City, 
    f.colYear as Year,
    f.colMonth as Month,
    AVG(f.ArrDelay) as prom_arribades
FROM flights  as f 
INNER JOIN usairports  as u ON f.Origin = u.IATA 
GROUP BY Origin, colYear, colMonth
ORDER BY City, Year, Month;

/*5. Les companyies amb més vols cancelats, per mesos i any. A més, han d’estar ordenades de forma
que les companyies amb més cancel·lacions apareguin les primeres.*/

SELECT UniqueCarrier as Carrier,
    colYear as Year,
    ColMonth as Month,
    COUNT(Cancelled) as Total_Cancelled
FROM flights
GROUP BY Carrier
ORDER BY COUNT(Cancelled) DESC;

/*6. L’identificador dels 10 avions que més distància han recorregut fent vols.*/
SELECT TailNum as Airplane,
    SUM(Distance) as Total_Distance
FROM flights
GROUP BY TailNum
ORDER BY Total_Distance DESC;

/* 7. Companyies amb el seu retard promig només d’aquelles les quals els seus vols arriben al seu destí
amb un retràs promig major de 10 minuts. */

SELECT 
    UniqueCarrier as Carrier,
    AVG(arrDelay) as Avg_Delay
FROM  flights
GROUP BY Carrier
HAVING Avg_Delay > 10
ORDER BY Avg_Delay DESC;
