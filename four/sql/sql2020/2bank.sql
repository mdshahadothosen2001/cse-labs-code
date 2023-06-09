a. find all customers who have account but not loan:
   SELECT d.customer_name
   FROM depositor d inner join account a 
   ON d.account_number = a.account_number
   WHERE d.customer_name not in (
    SELECT customer_name from borrower b inner join
    loan l ON b.loan_number = l.loan_number
   );