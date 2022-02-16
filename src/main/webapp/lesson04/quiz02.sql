create table `bookmark` (
	`id` int not null auto_increment primary key
    , `name` varchar(16) not null
    , `url` varchar(512) not null
    , `createdAt` timestamp default current_timestamp
	, `updatedAt` timestamp default current_timestamp
)ENGINE=InnoDB default charset=utf8mb4;

insert into `bookmark` (`name`, `url`)
values
('마론달', 'http://marondal.com'),
('구글', 'https://google.com'),
('네이버', 'https://naver.com'),
('다음', 'https://daum.net');

select * from `bookmark` order by `id` desc;

insert into `bookmark` (`name`, `url`)values('네이트', 'http://nate.com')