drop database if exists chiendemo;
create database chiendemo;
use chiendemo;
create table product
(
    ProductID       varchar(20)   not null primary key unique,
    CategoryID      varchar(20)   not null,
    ProductName     varchar(255) not null,
    ProductPrice    float         not null,
    QuantityInStock int           not null,
    Image           varchar(255)  not null,
    Status          bit           not null,
    Description     text          not null
);

create table category
(
    CategoryID   varchar(20)   not null primary key unique,
    CategoryName varchar(255) not null
);

alter table product
    add foreign key (CategoryID) references category (CategoryID)
        on update cascade;
        
	create table roll(
    rollId varchar(20) not null primary key unique,
    AccountAccess bit not null
);
insert into roll (rollId, AccountAccess) values (1,1),
                                                (2,0);

create table account
(
    AccountID     varchar(20)   not null primary key unique,
    AccountName   nvarchar(255) not null,
    LoginName     varchar(50)   not null,
    Password      varchar(50)   not null,
    AccountAccess varchar(10)   not null,
    Address       varchar(255)  not null,
    PhoneNumber   varchar(255)  not null,
    Gender        bit null,
    Status        bit null
);

alter table account add foreign key (AccountAccess) references roll(AccountAccess);

create table orders
(
    OrderID     varchar(20) not null primary key unique,
    AccountID   varchar(20) not null,
    OrderDate   datetime        not null default now(),
    Receiver    varchar(255),
    Address     varchar(255),
    Email       varchar(50),
    PhoneNumber varchar(20),
    Status      bit default 1
);

alter table orders
    add foreign key (AccountID) references account (AccountID)
        on update cascade;

create table order_product
(
    OrderID   varchar(20) not null ,
    ProductID varchar(20) not null,
    Quantity  int         not null,
    PriceEach float,
    primary key (OrderID, ProductID)
);

alter table order_product
    add foreign key (OrderID) references orders (OrderID) on update cascade,
    add foreign key (ProductID) references product (ProductID) on update cascade;

insert into category values ('1', 'Hoa ????m C?????i'),
                            ('2', 'Hoa S??? Ki???n'),
                            ('3', 'Hoa Sinh Nh???t');

insert into product (ProductID, CategoryID, ProductName, ProductPrice, QuantityInStock, Image, Status, Description)
values ('1', '1', 'B??nh hoa l?? h???ng', 3690000, 50, 'https://bizweb.dktcdn.net/thumb/large/100/074/919/products/z3122054453975-ed54217fc782527d1801643d7a4fff2c.jpg?v=1642578620000', 1,
        '<p>B??nh hoa l??m v???i ch???t li???u t??? g???m b??t tr??ng k???t h???p v???i ph???i m??u tinh t???<br>'),
         ('2', '1', 'B??nh hoa l?? h???ng', 3690000, 50, 'https://bizweb.dktcdn.net/thumb/large/100/074/919/products/z3122054453975-ed54217fc782527d1801643d7a4fff2c.jpg?v=1642578620000', 1,
        '<p>B??nh hoa l??m v???i ch???t li???u t??? g???m b??t tr??ng k???t h???p v???i ph???i m??u tinh t???<br>'),
        ('3', '1', 'B??nh hoa l?? h???ng', 3690000, 50, 'https://bizweb.dktcdn.net/thumb/large/100/074/919/products/z3122054453975-ed54217fc782527d1801643d7a4fff2c.jpg?v=1642578620000', 1,
        '<p>B??nh hoa l??m v???i ch???t li???u t??? g???m b??t tr??ng k???t h???p v???i ph???i m??u tinh t???<br>'),
        ('4', '1', 'B??nh hoa l?? h???ng', 3690000, 50, 'https://bizweb.dktcdn.net/thumb/large/100/074/919/products/z3122054453975-ed54217fc782527d1801643d7a4fff2c.jpg?v=1642578620000', 1,
        '<p>B??nh hoa l??m v???i ch???t li???u t??? g???m b??t tr??ng k???t h???p v???i ph???i m??u tinh t???<br>'),
        ('5', '1', 'B??nh hoa l?? h???ng', 3690000, 50, 'https://bizweb.dktcdn.net/thumb/large/100/074/919/products/z3122054453975-ed54217fc782527d1801643d7a4fff2c.jpg?v=1642578620000', 1,
        '<p>B??nh hoa l??m v???i ch???t li???u t??? g???m b??t tr??ng k???t h???p v???i ph???i m??u tinh t???<br>'),
        ('6', '1', 'B??nh hoa l?? h???ng', 3690000, 50, 'https://bizweb.dktcdn.net/thumb/large/100/074/919/products/z3122054453975-ed54217fc782527d1801643d7a4fff2c.jpg?v=1642578620000', 1,
        '<p>B??nh hoa l??m v???i ch???t li???u t??? g???m b??t tr??ng k???t h???p v???i ph???i m??u tinh t???<br>'),
        ('7', '3', 'Gi??? hoa h???ng cam', 40000000, 50, 'https://bizweb.dktcdn.net/thumb/large/100/074/919/products/891-6369.jpg?v=1642389527000', 1,
        '<p>Gi??? hoa v???i s??? k???t h???p c???a nh???ng lo???i hoa h???ng v???i m??u s???c kh??c nhau t???o n??n s??? ph???i h???p tuy???t v???i<br>'),
         ('8', '3', 'Gi??? hoa h???ng cam', 40000000, 50, 'https://bizweb.dktcdn.net/thumb/large/100/074/919/products/891-6369.jpg?v=1642389527000', 1,
        '<p>Gi??? hoa v???i s??? k???t h???p c???a nh???ng lo???i hoa h???ng v???i m??u s???c kh??c nhau t???o n??n s??? ph???i h???p tuy???t v???i<br>'),
         ('9', '3', 'Gi??? hoa h???ng cam', 40000000, 50, 'https://bizweb.dktcdn.net/thumb/large/100/074/919/products/891-6369.jpg?v=1642389527000', 1,
        '<p>Gi??? hoa v???i s??? k???t h???p c???a nh???ng lo???i hoa h???ng v???i m??u s???c kh??c nhau t???o n??n s??? ph???i h???p tuy???t v???i<br>'),
         ('10', '3', 'Gi??? hoa h???ng cam', 40000000, 50, 'https://bizweb.dktcdn.net/thumb/large/100/074/919/products/891-6369.jpg?v=1642389527000', 1,
        '<p>Gi??? hoa v???i s??? k???t h???p c???a nh???ng lo???i hoa h???ng v???i m??u s???c kh??c nhau t???o n??n s??? ph???i h???p tuy???t v???i<br>'),
         ('11', '3', 'Gi??? hoa h???ng cam', 40000000, 50, 'https://bizweb.dktcdn.net/thumb/large/100/074/919/products/891-6369.jpg?v=1642389527000', 1,
        '<p>Gi??? hoa v???i s??? k???t h???p c???a nh???ng lo???i hoa h???ng v???i m??u s???c kh??c nhau t???o n??n s??? ph???i h???p tuy???t v???i<br>');
    
insert into account (AccountID, AccountName, LoginName, Password, AccountAccess, Address, PhoneNumber, Gender, Status)
values ('AD1', 'admin', 'admin', 'admin', 1, '111 Van Cao', '0913026630', 0, 1),
       ('KH1', 'chien', 'chien1821994', '1821994ch', 0, 'DA', '0966351299', 0, 1 );
insert into orders (OrderID, AccountID, OrderDate)
values ('1', 'AD1', '2022-03-04'),
       ('2', 'KH1', '2022-03-05');


insert into order_product (OrderID, ProductID, Quantity, PriceEach, AccountID)
values ('1', '2', 1, 50000000,'KH1'),
       ( '2', '3', 3, 12990000,'KH1');
      



