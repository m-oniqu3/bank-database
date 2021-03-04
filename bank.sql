/* 620122735 

DROP DATABASE IF EXISTS bank;
CREATE DATABASE bank;
USE bank;

CREATE table customer (
    customer_id varchar(11),
    customer_name varchar(50),
    customer_street varchar(30),
    customer_city varchar(30),
    primary key (customer_id)

);

CREATE table loan (
    loan_number varchar (10),
    amount decimal (10,2),
    primary key (loan_number)
);

CREATE table employee (
    employee_id varchar (5),
    employee_name varchar (50),
    telephone_number varchar (12),
    start_date date,
    primary key (employee_id)
);


CREATE table branch (
    branch_name varchar(50),
    branch_city varchar(30),
    assets decimal (10,2),
    primary key (branch_name)
);

CREATE table account (
    account_number varchar(9),
    balance decimal (10,2),
    primary key (account_number)
);

CREATE table payment (
    loan_number varchar (10),
    payment_number varchar (10),
    payment_date date,
    payment_amount decimal (10,2),

    primary key (loan_number, payment_number),
    foreign key (loan_number) references loan(loan_number) on delete cascade
);

CREATE table dependent_name (
    employee_id varchar (5),
    d_name varchar(50),

    primary key (employee_id, d_name),
    foreign key (employee_id) references employee(employee_id) on delete cascade 
);

CREATE table account_branch (
    account_number varchar(9),
    branch_name varchar(50),

    primary key (account_number),
    foreign key (account_number) references account(account_number) on delete cascade on update cascade,
    foreign key (branch_name) references branch(branch_name) on delete cascade on update cascade
);

CREATE table loan_branch (
    loan_number varchar (10),
    branch_name varchar(50),

    primary key (loan_number),
    foreign key (loan_number) references loan(loan_number) on delete cascade,
    foreign key (branch_name) references branch(branch_name) on delete cascade on update cascade
);

CREATE table borrower (
    customer_id varchar(11),
    loan_number varchar (10),

    primary key (customer_id, loan_number),
    foreign key (customer_id) references customer(customer_id) on delete cascade,
    foreign key (loan_number) references loan(loan_number) on delete cascade
);

CREATE table depositor (
    customer_id varchar(11),
    account_number varchar(9),

    foreign key (customer_id) references customer(customer_id) on delete cascade,
    foreign key (account_number) references account(account_number) on delete cascade on update cascade
);


CREATE table cust_banker(
    customer_id varchar(11),
    employee_id varchar (5),
    type varchar(20),

    primary key (customer_id, employee_id),
    foreign key (customer_id) references customer(customer_id) on delete cascade,
    foreign key (employee_id) references employee(employee_id) on delete cascade
);

CREATE table works_for (
    worker_employee_id varchar(5),
    manage_employee_id varchar(5),
    primary key (worker_employee_id)
);

CREATE table savings_account (
    account_number varchar(9),
    interest_rate decimal (5,2),

    primary key (account_number),
    foreign key (account_number) references account(account_number) on delete cascade on update cascade
);

CREATE table checking_account (
    account_number varchar(9),
    overdraft_amount decimal (8,2),

    primary key (account_number),
    foreign key (account_number) references account(account_number) on delete cascade on update cascade
);



insert into branch values ('Rock Ridge Branch', 'Charlotte', 2000000.00);
insert into branch values ('Downtown Branch', 'Laconia', 2900000.00);
insert into branch values ('Fairview Branch', 'Yukioville', 6000000.00);
insert into branch values ('Brooklyn Branch', 'Brooklyn', 4000000.00);
insert into branch values ('Portland Branch', 'Custer', 1700000.00);

insert into customer values ('569-124-789', 'Kija Sensei', 'Evergreen', 'Charlotte');
insert into customer values ('532-896-102', 'Maki San', 'Rose Street', 'Laconia');
insert into customer values ('789-120-569', 'Itadori Yuuji', 'Sukuna Lane','Charlotte' );
insert into customer values ('200-453-896', 'Rin Okumara', 'Spawn Street', 'Yukioville');
insert into customer values ('230-965-125', 'Shiemi Morn', 'Roosevelt', 'Brooklyn');
insert into customer values ('159-630-750', 'Crissy Brown', 'Oak Street', 'Laconia');
insert into customer values ('285-153-002', 'Nanami Nue', 'Colonial Drive', 'Custer');

insert into loan values ('L1', 50000.00);
insert into loan values ('L2', 100000.00);
insert into loan values ('L3', 200000.00);
insert into loan values ('L4', 2000000.00);

insert into payment values ('L1', 'P1', '2021-03-31', 5000.00);
insert into payment values ('L2', 'P2', '2021-04-30', 10000.00);
insert into payment values ('L3', 'P3', '2021-05-31', 20000.00);
insert into payment values ('L4', 'P4', '2021-03-31', 40000.00);

insert into dependent_name values ('E1', 'Ann Walker');
insert into dependent_name values ('E2', 'Gojou Sato');
insert into dependent_name values ('E3', 'Todou Rou');
insert into dependent_name values ('E4', 'Kassan Brown');
insert into dependent_name values ('E5', 'Layla Hart');
insert into dependent_name values ('E6', 'Dale Black');
insert into dependent_name values ('E7', 'Winter Blue');

insert into account values ('1000-1001', 4500.02);
insert into account values ('1000-1002', 120565.23);
insert into account values ('1000-1003', 45000.50);
insert into account values ('1000-1004', 1500400.00);
insert into account values ('1000-1005', 200600.00);
insert into account values ('1000-1006', 7900000.00);
insert into account values ('1000-1007', 75.50);

insert into employee values ('E1', 'Lisa Dane', '876-450-1758', '2015-05-20' );
insert into employee values ('E2', 'Diane Adams', '876-470-0028', '2018-07-10' );
insert into employee values ('E3', 'Paul Blart', '876-886-8025', '2019-10-04' );
insert into employee values ('E4', 'Melisa Carth', '876-450-1258', '2010-09-25' );
insert into employee values ('E5', 'Henry Cavill', '876-569-0010', '2002-12-14' );
insert into employee values ('E6', 'Jamie Foxx', '876-710-5310', '2021-01-08' );
insert into employee values ('E7', 'Anne Hathaway', '876-962-1591', '2017-04-18' );

insert into account_branch values ('1000-1001','Rock Ridge Branch');
insert into account_branch values ('1000-1002','Rock Ridge Branch');
insert into account_branch values ('1000-1003', 'Downtown Branch');
insert into account_branch values ('1000-1004', 'Fairview Branch');
insert into account_branch values ('1000-1005', 'Portland Branch');
insert into account_branch values ('1000-1006', 'Brooklyn Branch');
insert into account_branch values ('1000-1007', 'Downtown Branch');

insert into loan_branch values ('L1', 'Rock Ridge Branch');
insert into loan_branch values ('L2', 'Downtown Branch');
insert into loan_branch values ('L3', 'Fairview Branch');
insert into loan_branch values ('L4', 'Brooklyn Branch');

insert into borrower values ('569-124-789', 'L1');
insert into borrower values ('532-896-102', 'L2');
insert into borrower values ('200-453-896', 'L3');
insert into borrower values ('230-965-125', 'L4');

insert into depositor values ('569-124-789', '1000-1001');
insert into depositor values ('532-896-102', '1000-1002');
insert into depositor values ('789-120-569', '1000-1003');
insert into depositor values ('200-453-896', '1000-1004');
insert into depositor values ('230-965-125', '1000-1005');
insert into depositor values ('159-630-750', '1000-1006');
insert into depositor values ('285-153-002', '1000-1007');

insert into cust_banker values ('569-124-789', 'E1', 'Loan Officer');
insert into cust_banker values ('532-896-102', 'E1', 'Loan Officer');
insert into cust_banker values ('789-120-569', 'E2', 'Personal Banker');
insert into cust_banker values ('200-453-896', 'E3', 'Loan Officer');
insert into cust_banker values ('230-965-125', 'E4', 'Loan Officer');
insert into cust_banker values ('159-630-750', 'E5', 'Personal Banker');
insert into cust_banker values ('285-153-002', 'E5', 'Personal Banker' );

insert into works_for values ('E1', 'E2');
insert into works_for values ('E3', 'E2');
insert into works_for values ('E4', 'E6');
insert into works_for values ('E5', 'E6');
insert into works_for values ('E7', 'E6');

insert into savings_account values ('569-124-789', 0.05);
insert into savings_account values ('532-896-102', 0.05);
insert into savings_account values ('200-453-896', 0.05);
insert into savings_account values ('230-965-125', 0.05);

insert into checking_account values ('789-120-569', 2000.00);
insert into checking_account values ('159-630-750',10000.00);
insert into checking_account values ('285-153-002', 500.00);

*/

/*Question 1*/
/*
SELECT customer.customer_name, customer.customer_street, customer.customer_city 
FROM customer LEFT JOIN borrower
ON customer.customer_id=borrower.customer_id
WHERE borrower.customer_id IS NULL;
*/

/*Question 2*/
/*
SELECT customer.customer_name, AVG(balance) 
FROM customer JOIN account JOIN account_branch JOIN depositor 
ON customer.customer_id = depositor.customer_id 
AND account.account_number = account_branch.account_number 
AND depositor.account_number = account.account_number 
AND account_branch.branch_name = "Rock Ridge Branch" 
GROUP BY customer.customer_name;
*/

/*Question 3*/
/*
UPDATE loan
SET amount=amount-(amount * 0.1);
*/

/*Question 4*
Create a view listing account numbers, balances and customer names of all depositors at the Downtown branch.
*/
/*
CREATE VIEW downtown_view
AS
SELECT account.account_number, account.balance, customer.customer_name
FROM customer JOIN account JOIN depositor join account_branch
ON customer.customer_id = depositor.customer_id 
AND account.account_number = account_branch.account_number
AND depositor.account_number = account.account_number 
WHERE account_branch.branch_name = "Downtown Branch" 
GROUP BY customer.customer_name;
*/

/*Question 5*/
/*
ALTER table account add column status varchar(10);
*/

/*Question 6*/
/*
UPDATE account
SET status = case
                    WHEN account.balance <100 THEN 'inactive'
                    ELSE 'active'
            END;
*/

/*Question 7*/
/*
SELECT account_branch.branch_name, SUM(balance)  
FROM account_branch JOIN account 
ON  account_branch.account_number = account.account_number 
GROUP BY account_branch.branch_name 
    HAVING SUM(balance) < (SELECT avg (balance) FROM account);
*/

/*Question 8*/

/*Question 9*/
/*
SELECT branch_name, SUM(assets) FROM branch 
WHERE branch_city NOT LIKE '%Brooklyn%' 
GROUP BY branch_city HAVING SUM(assets) > 
            all(SELECT sum(assets) 
            FROM branch 
            WHERE branch_city = "Brooklyn" 
            GROUP BY branch_city);
*/

/*Question 10*/
SELECT b.branch_name, ROUND(avg(a.balance),2) as "Average Balance" from account AS a
    LEFT JOIN account_branch AS b ON a.account_number = b.account_number 
    group by a.account_number having avg (balance) > 1500;
/*
SELECT DISTINCT b.branch_name, ROUND(avg(a.balance),2) as "Average Balance" from account AS a LEFT JOIN account_branch AS b ON a.account_number = b.account_number group by b.branch_name having avg (balance) > 0;
#10^
*/
