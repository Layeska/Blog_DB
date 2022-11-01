CREATE TABLE "user" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL,
  "lastname" varchar NOT NULL,
  "age" int NOT NULL,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL,
  "status" boolean NOT NULL,
  "created" date
);

CREATE TABLE "posts" (
  "id" SERIAL PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" varchar NOT NULL,
  "author" varchar NOT NULL,
  "content" text NOT NULL,
  "created" date NOT NULL,
  "status" boolean NOT NULL,
  "user" int
);

CREATE TABLE "rel_posts" (
  "id" SERIAL PRIMARY KEY,
  "id_comment" int,
  "id_post" int
);

CREATE TABLE "tags" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "rel_tags" (
  "id" SERIAL PRIMARY KEY,
  "id_post" int,
  "id_tags" int
);

CREATE TABLE "comment" (
  "id" SERIAL PRIMARY KEY,
  "comment" varchar NOT NULL,
  "created" date NOT NULL,
  "status" boolean NOT NULL,
  "post" int
);

ALTER TABLE "posts" ADD FOREIGN KEY ("user") REFERENCES "user" ("id");

ALTER TABLE "rel_tags" ADD FOREIGN KEY ("id_post") REFERENCES "posts" ("id");

ALTER TABLE "rel_tags" ADD FOREIGN KEY ("id_tags") REFERENCES "tags" ("id");

ALTER TABLE "rel_posts" ADD FOREIGN KEY ("id_post") REFERENCES "posts" ("id");

ALTER TABLE "rel_posts" ADD FOREIGN KEY ("id_comment") REFERENCES "comment" ("id");


insert into "user" ("name", "lastname", "age", "email", "password", "status", "created") values ('Ana', 'Marenco', 23, 'anajuarez@outlook.com', 'ana1235', true, '2022/05/15');
insert into "user" ("name", "lastname", "age", "email", "password", "status", "created") values ('Kevin', 'Gutiérrez', 23, 'kevin60@gmail.com', '856kevin', true, '2022/10/08');
insert into "user" ("name", "lastname", "age", "email", "password", "status", "created") values ('Rafaela', 'Suárez', 46, 'rafaelamarenco@gmail.com', 'rafaela555', true, '2022/01/28');
insert into "user" ("name", "lastname", "age", "email", "password", "status", "created") values ('Jefferson', 'Valera', 25, 'jeff85valera@gmail.com', '148963', true, '2022/04/13');
insert into "user" ("name", "lastname", "age", "email", "password", "status", "created") values ('José', 'Cruz', 30, 'josecruz@gmail.com', 'jose7744', true, '2022/10/03');


select * from "user" u ;

insert into "tags" ("name") values ('Food');
insert into "tags" ("name") values ('Sports');
insert into "tags" ("name") values ('Culture');
insert into "tags" ("name") values ('Politics');
insert into "tags" ("name") values ('Social');

select * from tags t ;


insert into "posts" ("title", "description", "author", "content", "created", "status", "user") values ('The Biggest Hamburger in Managua', 'A giant hamburger was created for the second anniversary of the "first of May" bar', 'Pepe lopez', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget eros sed erat placerat dapibus.', '2022/05/18', true, 1);
insert into "posts" ("title", "description", "author", "content", "created", "status", "user")values ('Luis Suárez says goodbye to Nacional as a hero', 'The 35-year-old Uruguayan striker','Rosa Lopez', 'The 35-year-old Uruguayan striker reaffirmed the football, physical and emotional success of returning to his country to prepare for the World Cup', '2022/10/09',true, 3);
insert into "posts" ("title", "description", "author", "content", "created", "status", "user") values ('The new terrors: nothing scares us as much as reality','They talk about the horror genre what is fashionable','Maria Mercedes', 'We have never been closer to the end, therefore, the terrors that work have to come hand in hand with an identifiable reality.', '2022/01/30', true, 5);

select * from posts p ;

insert into "rel_posts" ("id_comment", "id_post") values (1, 1);
insert into "rel_posts" ("id_comment", "id_post") values (2, 3);
insert into "rel_posts" ("id_comment", "id_post") values (3, 3);
insert into "rel_posts" ("id_comment", "id_post") values (3, 2);

select * from rel_posts;

insert into "comment" ("comment", "created", "status", "post") values ('Excellent review, I crave a hamburger', '2022/10/31', true, 1);
insert into "comment" ("comment", "created", "status", "post") values ('Excellent review', '2020/11/01', true, 3);
insert into "comment" ("comment", "created", "status", "post") values ('That is great!', '2020/06/17', true, 2);

select * from "comment" c ;


insert into "rel_tags" ("id_post", "id_tags") values (1,1);
insert into "rel_tags" ("id_post", "id_tags") values (2,2);
insert into "rel_tags" ("id_post", "id_tags") values (3,5);
insert into "rel_tags" ("id_post", "id_tags") values (3,3);

select * from rel_tags rt ;