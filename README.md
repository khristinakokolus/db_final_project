# Sobering-up station

Welcome to Sobering-up station project!


## Description

Using sobering-up station you will be able to get the information about the alcoholics taken there by different officers and
their adventures at all. You will be aware of all the latest news!

## Prerequisites

If you want to work with this project you should firstly write in the command prompt:

```
git clone https://github.com/khristinakokolus/db_final_project.git
```

Also, you need to have installed:

- **Qt Creator**


## Project structure

- folder ```sql``` contains database and tables creation. Also, it contains queries to the database.
- folder ```gui_prototype``` contains prototype of the interface of our project. To view it go to ```index.html```.
- folder ```db_diagram``` contains a diagram of the database structure with all its tables and information about them.
- folder ```qt_code``` contains a code for desktop application, to start you need qt creator or anything that can build qmake.
- folder ``qt_executable`` contains desktop application and in folder ```installer``` setup for application. Requires our database.

## Usage 

1. You need to create a database ```sobering_up_station``` and all tables with data in ```pgAdmin``` running the ```database_creation.sql``` from the ```sql``` folder.
2. Then there are two possible ways to run the program:

      2.1 Install the application from ```qt_executable\installer``` folder and run it. (It is not completely possible that it will run OK, as there can be problems with the database visibility)
  
      2.2 Another way to run it is from the Qt Creator:
      
       - Open finalprog.pro file
       - Run it using Debug mode

## GUI

You can run all selects in tab ```search```
![image](https://user-images.githubusercontent.com/54356826/120109128-d04ae800-c170-11eb-80c3-acd9c96cd5c4.png)
You can overview all tables and add new values for them in tab ```tables```
![image](https://user-images.githubusercontent.com/54356826/120109298-7dbdfb80-c171-11eb-9454-1b28997611dc.png)
![image](https://user-images.githubusercontent.com/54356826/120109194-1011cf80-c171-11eb-92c9-ee0ee9d11fc5.png)
Additional: You can watch table of honors in tab ```honors```
![image](https://user-images.githubusercontent.com/54356826/120109178-038d7700-c171-11eb-96aa-9c020c815ff8.png)



## Contributors

- [Khrystyna Kokolus](https://github.com/khristinakokolus)
- [Diana Hromyak](https://github.com/Diana-Doe)
- [Andrii Bek](https://github.com/ReyBroncas)
- [Liia Dulher](https://github.com/LiiaDulher)
- [Roman Pavelko](https://github.com/romapavelko01)
- [Yarema Fylypchuk](https://github.com/yaremafylypchuk)
- [Vladislav Razoronov](https://github.com/VladislavRazoronov)





