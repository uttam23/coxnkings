coxnkings
=========

Code base for cox and kings social app


Installation:

Fork the repository

Create a database 'coxnkings' or any other name
browse to the folder <root>/<source folder>/protected/data

There are two sql files
1. cnk-schema.sql
2. base-insert.sql

run these files in the same sequence on the newly created database

Update the following files

<root>/<source folder>/protected/config/main.php
update the line 
$db => array(
      'connectionString' => 'mysql:host=localhost;dbname=<database name>',
			'emulatePrepare' => true,
			'username' => '<db username>',
			'password' => '<db password>',
			'charset' => 'utf8',
);


Login:

Use the following to login as admin

Username: admin
password: admin123

