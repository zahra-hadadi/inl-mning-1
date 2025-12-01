# inlämning-1   Databaser
Zahra Hadadi – YH25

 Databas beskrivning
 
Databasen skapas för en liten bokhandel som har fyra tabeller.  
Tabeller om kunder, böcker, beställningar och orderrader.

  ER-diagram
  
Diagrammet visar entiteter, primärnycklar, främmande nycklar och relationer.

  Entiteter

 Kunder
 KundID (PK)  
 Namn  
 Email  
 Telefon  
 Adress  

 Böcker
 ISBN (PK)  
 Titel  
 Författare  
 Pris  
 Lagerstatus  

 Beställningar
 OrderID (PK)  
 KundID (FK)  
 Datum  
 Totalbelopp  

 Orderrader
 OrderradID (PK)  
 OrderID (FK)  
 ISBN (FK)  
 Antal  
 Pris  

  Relationer

 En kund kan göra flera beställningar. (1 → N)  
 En beställning innehåller en eller flera böcker. (1 → N)  
 En bok kan förekomma i många orderrader.(1 → N)

 SQL-fil
 All SQL-kod finns i filen (inlamning1.sql).  
 

