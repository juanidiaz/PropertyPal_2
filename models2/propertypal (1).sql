-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: propertydb
-- ------------------------------------------------------
-- Server version	8.0.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `seenbyId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seenbyId` (`seenbyId`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`seenbyId`) REFERENCES `seenbies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'tmedina','pass1','Tariq','Medina','tmedina@where.ca','1-095-024-7228','2019-03-14 18:54:58','2019-03-14 18:54:58',NULL),(2,'jdiaz','pass2','Juan','Diaz','jdiaz@that.ca','1-071-736-4467','2019-03-14 18:54:58','2019-03-14 18:54:58',NULL),(3,'tgreen','pass3','Tony','Green','tgreen@this.ca','1-239-723-5716 x450','2019-03-14 18:54:58','2019-03-14 18:54:58',NULL);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `clientId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientId` (`clientId`),
  CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners`
--

DROP TABLE IF EXISTS `owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `owners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT 'owner',
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners`
--

LOCK TABLES `owners` WRITE;
/*!40000 ALTER TABLE `owners` DISABLE KEYS */;
INSERT INTO `owners` VALUES (1,'ArmandoConn','owner','Armando','Conn','Constantin40@yahoo.com','(898) 329-7746 x14261','Suite 865','688 Armstrong Roads','Calgary','Alberta','Canada','2019-03-14 18:54:58','2019-03-14 18:54:58'),(2,'JaleelTreutel','owner','Jaleel','Treutel','Lola46@hotmail.com','(063) 826-9971','Apt. 604','2889 Elisha Curve','Calgary','Alberta','Canada','2019-03-14 18:54:58','2019-03-14 18:54:58'),(3,'HannaBode','owner','Hanna','Bode','Jaiden72@hotmail.com','(651) 481-2487 x2666','Apt. 332','99373 Nathanael Estates','London','Ontario','Canada','2019-03-14 18:54:58','2019-03-14 18:54:58'),(4,'QuintenHane','owner','Quinten','Hane','Flavie_Koss@gmail.com','818.010.5432 x30285','Apt. 978','99338 Bayer Unions','Toronto','Ontario','Canada','2019-03-14 18:54:58','2019-03-14 18:54:58'),(6,'CliffordPowlowski','owner','Clifford','Powlowski','Zakary92@hotmail.com','(407) 191-0652 x48169','Suite 365','53720 Davis Center','London','Ontario','Canada','2019-03-14 18:54:58','2019-03-14 18:54:58'),(7,'JanickAltenwerth','owner','Janick','Altenwerth','Aida.Carter9@hotmail.com','(431) 269-3671','Apt. 933','2097 Rice Keys','London','Ontario','Canada','2019-03-14 18:54:58','2019-03-14 18:54:58'),(8,'DahliaKessler','owner','Dahlia','Kessler','Guy_Barrows@hotmail.com','(533) 468-0570 x56496','Apt. 417','7867 Abernathy Meadows','Mississauga','Ontario','Canada','2019-03-14 18:54:58','2019-03-14 18:54:58');
/*!40000 ALTER TABLE `owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info` text NOT NULL,
  `address1` text NOT NULL,
  `address2` varchar(255) NOT NULL,
  `postalcode` varchar(255) NOT NULL,
  `propertype` varchar(255) DEFAULT '',
  `price_string` varchar(255) NOT NULL,
  `price_dec` decimal(10,2) NOT NULL,
  `bedrooms` varchar(255) DEFAULT NULL,
  `bathrooms` varchar(255) DEFAULT NULL,
  `ownershiptype` varchar(255) DEFAULT NULL,
  `ammenities` varchar(255) DEFAULT NULL,
  `ammenitiesnearby` varchar(255) DEFAULT NULL,
  `photo` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `favoriteId` int(11) DEFAULT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `seenbyId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `favoriteId` (`favoriteId`),
  KEY `ownerId` (`ownerId`),
  KEY `seenbyId` (`seenbyId`),
  CONSTRAINT `properties_ibfk_1` FOREIGN KEY (`favoriteId`) REFERENCES `favorites` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `properties_ibfk_2` FOREIGN KEY (`ownerId`) REFERENCES `owners` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `properties_ibfk_3` FOREIGN KEY (`seenbyId`) REFERENCES `seenbies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (1,'NO ACCESS TO THE PROPERTY PRIOR TO CLOSING UNDER ANY CIRCUMSTANCES.  Large two storey home in popular Old East Village on quiet street.  Duplex potential.  Fenced rear yard.  Private driveway.  Sold as is with no warranties.  No offers until 12pm Wednesday March 13th.','765 PRINCESS AVENUE','London, Ontario','N4G2W5','','$129,900',129900.00,'1','2','Freehold','Sauna, Exercise Centre, Recreation Centre','Hospital, Park, Public Transit, Schools','https://cdn.realtor.ca/listings/TS636877535526470000/reb13/highres/0/179710_1.jpg','2019-03-14 18:54:59','2019-03-14 18:54:59',NULL,6,NULL),(2,'Two bedroom house in the heart of So-Ho. Large fenced in back yard with deck. House is currently occupied by long-term tenants so minimum 24 hours notice required for showings. Can be purchased along with house to the east (459 Grey Street) and aTwo bedroom house in the heart of So-Ho. Large fenced in back yard with deck. House is currently occupied by long-term tenants so minimum 24 hours notice required for showings. Can be purchased along with house to the east (459 Grey Street) addn large double vacant lot to the west (449 Grey Street) for possible development site ($529,700). Two of the listing agents are related to the owner.','453 GREY STREET','London, Ontario','N6B1H1','','$179,900',179900.00,'0','0','Freehold','Sauna, Exercise Centre, Recreation Centre','Public Transit, Schools','https://cdn.realtor.ca/listings/TS636870516484530000/reb13/highres/4/179214_1.jpg','2019-03-14 18:54:59','2019-03-14 18:54:59',NULL,3,NULL),(3,'Great starter home. Very nice open concept on main floor, hardwood, ceramic floors, updated kitchen, most windows updated, main floor 4 piece bath, furnace updated. Deck on second floor, minimal rear yard. Very close to downtown core area. Excellent Condo alternative. Call and book a showing today.','529 HORTON STREET W','London, Ontario','N6B1M6','','$179,900',179900.00,'3','1','Freehold','Party Room, Exercise Centre','Hospital, Public Transit, Schools','https://cdn.realtor.ca/listings/TS636881697770370000/reb13/highres/5/181375_1.jpg','2019-03-14 18:54:59','2019-03-14 18:54:59',NULL,4,NULL),(4,'Premium location  on the west side of the building which overlooks downtown London! 1 bedroom condo on the 10th floor with balcony, in-suite laundry, furnace & A/C unit and a large in-suite storage room. One underground parking space (completely enclosed and security controlled underground parking). Amenities include: tennis court, indoor pool (with dedicated times for adult swim), hot tub, his/hers saunas, well equipped fitness room, party room, and common area BBQs. Guest suite and bike storage room are available through on-site management on first come first serve basis. Variety store at base of building. Approx 35 free visitor parking spaces on-site. Condo fee is $373/mth and includes water. Property tax is $1837/yr. Tenant moved in Nov 2011, currently renting month to month at $949.16/mth + utilities. Tenant would like to stay.','323 COLBORNE STREET #1002','London, Ontario','N6B3N8','','$189,900',189900.00,'1','1','Condominium','Guest Suite','Public Transit','https://cdn.realtor.ca/listings/TS636864360502070000/reb13/highres/4/176844_1.jpg','2019-03-14 18:54:59','2019-03-14 18:54:59',NULL,3,NULL),(6,'Spacious 3 Bedroom In Cooksville! Close To Transit, School, Shopping, Hospital, Go Train. Master Features W/I Closet With 2 Piece Ensuite. Sunny South East Exposure! Locker Room Inside Suite.**** EXTRAS **** Fridge, Stove, Electric Light Fixtures, Living Rm Window Covers, Air Conditioner.   *Quiet Building With Outdoor Pool, Gym, Visitor Parking & A Renovated Lobby*','#1108 -3120 KIRWIN AVE','Mississauga, Ontario','L5A3R2','','$309,000',309000.00,'3','2','Condominium/Strata','Exercise Centre','Hospital, Park, Public Transit, Schools','https://cdn.realtor.ca/listings/TS636845573292800000/reb82/highres/1/w4349311_1.jpg','2019-03-14 18:54:59','2019-03-14 18:54:59',NULL,8,NULL),(8,'Welcome To 4185 Shipp Dr Condo In The Heart Of Mississauga,Lrg 1 Bed Condo W/Approx 750Sq Ft,Renovated Kitchen Overlook Living Rm!High Ceiling&Oversized Bedrm!Unit Feature*s Quarts C-Top,Ss App,Brand New Laminate Flr, Dishwasher, Range Hood,Closet Mirror Drs&Bathrm Vanities!Freshly Painted And Ready To Move In!En-Suite Storage Rm,Inc 1 Parking!Amenities Incl Indoor Pool,Sauna,Party Rm,Gym!Great Location Steps To Square One Shopping,Supermarkets&Public Transit**** EXTRAS **** Condo Fees Include Hydro, 2 Min Drive From Hwy 403 & Hurontario St!! Extras: Ss Fridge, Stove, B/I Dishwasher Range Hood!! White Washer&Dryer !! All Elf & Window Covering','#213 -4185 SHIPP DR','Mississauga, Ontario','L4Z2Y8','','$319,000',319000.00,'1','1','Condominium/Strata','Sauna, Exercise Centre, Recreation Centre','Hospital, Park, Public Transit, Schools','https://cdn.realtor.ca/listings/TS636876301120170000/reb82/highres/9/w4377339_1.jpg','2019-03-14 18:54:59','2019-03-14 18:54:59',NULL,7,NULL),(9,'Approx. 750 Sqft. Highly Desired Area. Walk To Square One. Transportation Acces To 403 & 401. This Is A Terrific Floor Plan. Bright Spacious Unit. Excellent Value. Reasonable Maintenance Fees. **Please Be Courteous To Tenant**.**** EXTRAS **** Existing Fridge, Stove, Washer, Dryer, B/I Dishwasher, All Window Blinds, Exclusive Use 1 Parking Spot.','#1507 -4205 SHIPP DR','Mississauga, Ontario','L4Z2Y8','','$339,900',339900.00,'1','1','Condominium/Strata','Party Room','Public Transit','https://cdn.realtor.ca/listings/TS636873088915300000/reb82/highres/3/w4372643_1.jpg','2019-03-14 18:54:59','2019-03-14 18:54:59',NULL,8,NULL),(10,'Affordable Dream Home Is Waiting For The New Owners!  Unbelievable Location! Less Than 5 Minutes Walk To All Shops, Restaurants, Amenities And Major Hospital. The Excellent Building Is Located Across The Park. Spacious 3Bedroom Condo Apartment Is Very Conveniently Located On The Ground Floor. Very Private, Spacious And Immaculate Place. New, Professionally Done Painting. New Kitchen. New Installed Doors. New Washer. The Two Bathrooms Are Nicely Updated.**** EXTRAS **** New Window Ac. Huge, Modern, Open Concept Living Room. Laundry Room And En-Suite Storage Room. Stainless Steel Appliances, Fridge, Stove. Microwave, Washer And Dryer, New Window Ac. All Light Fixtures Are Included. Pet-Friendly Building.','#103 -2345 CONFEDERATION PKWY S','Mississauga, Ontario','L5B2H3','','$345,000',345000.00,'3','2','Condominium/Strata','Party Room, Exercise Centre','Hospital, Park, Public Transit, Schools','https://cdn.realtor.ca/listings/TS636874948905970000/reb82/highres/2/w4375712_1.jpg','2019-03-14 18:54:59','2019-03-14 18:54:59',NULL,1,NULL),(11,'First Time Home Buyer and Investor alert on the West End! Unique studio in the heart of downtown and just steps away from the sandy Sunset Beach. There is no wasted space in this floor plan! Imagine hardwood flooring, open concept kitchen space with breakfast bar, gorgeous West End neighborhood, steps away from the beach, shops, restaurants, park & transportation. We*re not done yet, amazing large rooftop pool & sundeck for that perfect summer tan while enjoying the panoramic views of Downtown & the waterfront. No pets , rentals are allowed. Parking & storage area available to rent. Own a piece of the dream and live now in this luxurious neighborhood without paying millions. Note: Maintenance already includes heat, hot water & TAXES. \"Own A Dream. Not Dream To Own.\"','204 1250 N BURNABY STREET','Vancouver, British Columbia','V6E1P5','','$270,000',270000.00,'0','1','Condominium','Shared Laundry','Marina, Recreation, Shopping','https://cdn.realtor.ca/listings/TS636833104921130000/reb89/highres/4/r2319344_1.jpg','2019-03-14 18:54:59','2019-03-14 18:54:59',NULL,4,NULL),(12,'Location, location, location! Welcome to the Rosemont Manor, perfectly located on a tree lined street in the hip and vibrant community only 1 block west of Main! Steps to transit, skytrain, coffee shops, restaurants, bars, groceries, bike paths, trendy shops, Mount Pleasant Community Center and just minutes from downtown. Large rooms fit your house sized furniture. Well cared for condition with updated bathroom. Recent building updates include: new roof, updated lobby and hallways and new balconies. Prepaid Lease until 2074. Maintenance fees include: annual property tax, cable, caretaker, heat and hot water. Investors welcome! No rental restrictions. 19+ adult oriented. Sorry no pets. Call today for your private showing!','217 36 E 14TH AVENUE','Vancouver, British Columbia','V5T4C9','','$275,000',275000.00,'1','1','Condominium/Strata','Shared Laundry','Recreation, Shopping','https://cdn.realtor.ca/listings/TS636843983532930000/reb89/highres/6/r2336546_1.jpg','2019-03-14 18:54:59','2019-03-14 18:54:59',NULL,2,NULL),(13,'Great mountain views and a lot of natural light and decent sized patio. Westsea Tower is a solid CONCRETE building just steps to the beach, Stanley Park and everything the West End offers. Bachelor unit 442 sqft located on a great tree lined street. Bring your ideas to this suite & owners or investors take advantage of this rental allowed investment opportunity in one of the best locations of the West End. Westsea Tower is a well run concrete building with tons of upgrades including new windows, doors and exterior work.  and features an outdoor pool.  This home comes with 1 parking and 1 locker. Maintenance fees incl. Heat, HW & Property taxes. Pre-paid leasehold (non-strata) property expires Dec 31, 2073. Rentals ALLOWED!','1403 1330 HARWOOD STREET','Vancouver, British Columbia','V6E1S8','','$284,000',284000.00,'0','1','Condominium','Shared Laundry','Highway, CEGEP, Hospital, Park, Schools, Public Transit, University','https://cdn.realtor.ca/listings/TS636874809225630000/reb89/highres/3/r2345763_1.jpg','2019-03-14 18:54:59','2019-03-14 18:54:59',NULL,6,NULL),(14,'Best buy in the West End and the largest suite in The Horizon. This is a spacious, bright and open one bedroom suite of approximately 600 sf. Lots of light from two exposures. Nicely updated with newer hardwood flooring, kitchen and bath redone, and great built-in storage units in the dining area. Move right in, immediate possession is possible. Monthly fees include heat, hot water, and taxes. Long term rentals allowed, sorry no pets. Parking and lockers may be rented when available, no insuite laundry but there*s a coin operated laundry right across the hall. Fabulous rooftop deck with pool and panoramic views of city and water. Prepaid leasehold non-strata property with lease expiring December 31,2073. Financing available up to 80%.  Don*t miss this!','106 1250 BURNABY STREET','Vancouver, British Columbia','V6E1P5','','$299,000',299000.00,'1','1','Condominium/Strata','Shared Laundry','Hospital, Park, Public Transit, Schools','https://cdn.realtor.ca/listings/TS636868752196330000/reb89/highres/7/r2343487_1.jpg','2019-03-14 18:54:59','2019-03-14 18:54:59',NULL,4,NULL),(15,'Located on a quiet & tree lined street in West End. This unit has beautiful English Bay views from this corner suite facing south west and in move in condition. Perfect for investor, student or lifestyle as the price includes all the furniture, plates & cutlery. The St. Pierre is well managed & maintained with live-in caretaker, updated balconies, lobby & new door fobs, lovely gardens, nicely painted outside. This Concrete leasehold property has been pre-paid until 2073. One Block to Sunset Beach, English Bay, Parks and Seawall. Maintenance Fee includes caretaker, property taxes, garbage pickup, heat & hot water. Parking can be rented for $100/month. Rentals allowed. Small pets allowed w/approval. 35% down payment required for financing. Call to view!','301 1534 HARWOOD STREET','Vancouver, British Columbia','V6G1X9','','$349,888',349888.00,'1','1','Condominium','Shared Laundry','Recreation, Shopping','https://cdn.realtor.ca/listings/TS636853817946230000/reb89/highres/7/r2339807_1.jpg','2019-03-14 18:54:59','2019-03-14 18:54:59',NULL,3,NULL),(16,'Great Value in the Rembrandt condominium complex, quietly tucked away in the heart of trendy Bankview steps to trendy shops and your morning Starbucks. This trendy one bedroom features a bright and open layout featuring a 4 pc bathroom that has been was updated with ceramic tile and a very entertaining kitchen overlooking living room perfect for friends and entertaining nights. You will have ample storage space and laundry is located in the building. The patio is large perfect for BBQ and enjoying some fresh air. Steps to 17th avenue and minutes to downtown. This your chance to get a great investment in a fabulous location. A must to see. Call today!','#2 2512 15 ST SW','Bankview, Calgary, Alberta','T2T3Z5','','$115,000',115000.00,'1 + 0','1','Condominium/Strata','Storage - In Suite','Shopping, Schools, Golf Course, Playground','https://cdn.realtor.ca/listings/TS636851233134930000/reb9/highres/5/c4225435_1.jpg','2019-03-14 18:54:59','2019-03-14 18:54:59',NULL,6,NULL),(17,'Welcome to your bachelor suite in The Sofia! This adorable little unit is located on 14th street near all the action of 17th Avenue right next to to the most posh neighbourhood in the city, Mount Royal! With low condo fees, a great location, easy access to transit this unit is easily rented out and is a great investment property or starter condo. Walking distance to Our Daily Brett, Starbucks, and many restaurants you will be in heaven in this concrete building. With the low condo fees and rentability this could be a great investment! Currently rented until April 2019 for $700/month. Call your Realtor today to hear more.','#103 2111 14 ST SW','Bankview, Calgary, Alberta','T2T3T2','','$115,000',115000.00,'1 + 0','1','Condominium/Strata','Sauna, Exercise Centre, Recreation Centre','Public Transit, Schools, Playground','https://cdn.realtor.ca/listings/TS636843610681270000/reb9/highres/5/c4224175_1.jpg','2019-03-14 18:54:59','2019-03-14 18:54:59',NULL,7,NULL),(18,'Fabulous location on the brow of the hill with fantastic downtown city and river views from the entrance of this quiet concrete building. This building is located in sought after Crescent Heights on a quiet cul-de-sac. Walk to Rotary Park, Prince*s Island, St. Patrick*s Island Parks and walk to downtown. This one-bedroom apartment features north facing balcony, large living room, galley kitchen and 4-piece bath.  Needs paint and flooring and is ready for your personal touches. . Also included is an assigned parking stall and secured storage unit. Perfect for the first-time buyer or investor.','#405 316 1 AV NE','Crescent Heights, Calgary, Alberta','T2E0B2','','$122,000',122000.00,'1 + 0','1','Condominium/Strata','Storage - Locker','Public Transit, Schools, Golf Course, Park, Playground','https://cdn.realtor.ca/listings/TS636826190678170000/reb9/highres/3/c4220893_1.jpg','2019-03-14 18:54:59','2019-03-14 18:54:59',NULL,3,NULL),(20,'Attention investors or first-time buyers! Newly renovated 1-bedroom condo (below grade) just one block from the Sunalta C-train Station. Across street from a park and playground, as well as Sunalta Elementary School, ranked one of the top schools in Alberta. Bright and spacious. Open floor plan. Move-in ready.  The kitchen offers new SS appliances, cabinets, countertop, sink, light fixtures, backsplash tile and new laminate flooring throughout. Freshly painted. Newly renovated bathroom is spacious. In-suite laundry & storage. Close to restaurants, coffee shops, stores, playgrounds, transportation ... Everything within reach when you live here. This building is impeccably managed by MCM Management and recent upgrades include a new roof, new vinyl windows and balcony doors. Vacant and immediate possession available. Call to book your viewing today.','#12 1613 11 AV SW','Sunalta, Calgary, Alberta','T3C0N3','','$122,500',122500.00,'1 + 0','1','Condominium/Strata','Laundry Facility, Storage - In Suite','Public Transit, Schools, Playground','https://cdn.realtor.ca/listings/TS636857279432270000/reb9/highres/2/c4226352_1.jpg','2019-03-14 18:54:59','2019-03-14 18:54:59',NULL,3,NULL),(21,'Great Price For This Location! Half A Block To Yonge & Church St. Steps To Subway, Parks, Shopping, U Of T. Maintenance Fees Include Property Taxes, Heat & Hydro. 20* South Facing Balcony. Parking Allocated As Required. Pet Friendly Building. Amenities Incl Outdoor Patio W/ Bbq*s. Exercise & Party Room. Coin-Op Laundry On Main Level.**** EXTRAS **** Same Tenant For 15 Years - Unit Needs Reno & Is Being Sold As Is.  More Info On The Bldg At Https://Gloucestergate.Ca/Resources.  La Has Status Certificate, Rules & Regs, Etc.','#306 -30 GLOUCESTER ST','Toronto, Ontario','M4Y1L6','','$339,900',339900.00,'1','1','Undivided Co-ownership','Storage - Locker, Party Room, Exercise Centre','Highway, CEGEP, Hospital, Park, Schools, Public Transit, University','https://cdn.realtor.ca/listings/TS636879268111830000/reb82/highres/6/c4379836_1.jpg','2019-03-14 18:54:59','2019-03-14 18:54:59',NULL,4,NULL),(22,'First Time Buyers & Investors...This Is For You! Live In The Heart Of Liberty Village Where You Are Steps Away Form  Everything! 24 Hour Grocery, Restaurants, Park Across The Street, And King Street Car, You Can Even Walk To The Lake! Desirable Battery Park Building With Great Amenities Including Indoor Pool,  Guest Suites, 24 Hour Concierge, Gym And More! Cosy Studio With Good Sized Balcony, Laminate Flooring And Granite Counters And Owned Storage Locker!**** EXTRAS **** Being Sold As Is, Where Is Condition, All Taxes, Fees, Measurements And Info Regarding This Property Must Be Verified By The Buyer Or Their Representative. As Per Seller No Electronic Signatures.','#714 -50 LYNN WILLIAMS ST','Toronto, Ontario','M6K3R7','','$340,000',340000.00,'0','1','Condominium/Strata','Storage - Locker, Exercise Centre','Hospital, Park, Public Transit, Schools','https://cdn.realtor.ca/listings/TS636868766777270000/reb82/highres/7/c4368957_1.jpg','2019-03-14 18:54:59','2019-03-14 18:54:59',NULL,3,NULL),(23,'Thought You Could Never Afford A Condo In The City? Think Again! Don*t Miss This Opportunity To Own In Toronto Below Entry Level Prices! This Cozy Bachelor Has Been Recently Updated With New Kitchen Cabinets/Ss Appliances/Granite Countertops And A Designed Washroom. Unit Has  Been Previously Rented For $1500/Mth And Comes With 2 Lockers! Located Just Steps To The Waterfront With Ttc Access Right Outside Your Door (10Min Ride To Union/Downtown).**** EXTRAS **** Ss Fridge, Stove, B/I Dishwasher/Microwave, Washer/Dryer, 2 Lockers. Includes All Amenities: Swimming Pool, Gym, Sauna, Party Room, Bbq Facilities, Outdoor Sun Deck, Games Room, Plus Unobstructed Views & Much More.','#1564 -209 FORT YORK BLVD','Toronto, Ontario','M5V4A2','','$369,900',369900.00,'1','1','Condominium/Strata','Storage - Locker, Party Room, Exercise Centre, Recreation Centre','Public Transit','https://cdn.realtor.ca/listings/TS636874084905000000/reb82/highres/6/c4374316_1.jpg','2019-03-14 18:54:59','2019-03-14 18:54:59',NULL,7,NULL),(24,'** Assignment Sale \"\" Axiom Condos \"\"  ** Luxury Meets Downtown East ** Model \"\" Frederick 1 \"\"  415 Sq.Ft. Studio Floor Plan ** Features 9Ft Ceiling Windows, Hardwood Floors Thru-Out ** Ultra Modern Open Concept Kitchen With Quartz Countertop, Glass Tile Backsplash, S.S. Appliances **  24 Hr Concierge/Security System ** Stunning Main Floor Lobby Lounge **  St. Lawrence Market, Ttc, George Brown, Ryerson, Parks, Shopping Eaton Centre, Sugar Beach ****** EXTRAS **** Stainless Steel: Energy Star Fridge, Oven, Energy Star Dishwasher, Microwave, Ceramic Glass Cooktop With Exhaust Fan, 1 Bike Locker, Building Amenities Under Construction.','#1703 -460 ADELAIDE ST E','Toronto, Ontario','M5A1N6','','$379,900',379900.00,'0','1','Condominium/Strata','Exercise Centre, Recreation Centre','Hospital, Park, Public Transit, Schools','https://cdn.realtor.ca/listings/TS636859879032930000/reb82/highres/7/c4361367_1.jpg','2019-03-14 18:54:59','2019-03-14 18:54:59',NULL,6,NULL),(25,'Location-Location-Location! Ultra-Functional, Very Bright And Quiet, Bright West-Facing Unit W/Amazing View. Most Unique Bachelor Layout In The Building!! Spa Bathroom, New Floors Throughout, Big Closet, Plenty Of Storage, Kitchen Separated From Bedroom, Nice-Sized Balcony. Immaculately Kept And Cared For. Perfect For Young Professionals Or Students. Right In The Heart Of Liberty Village**** EXTRAS **** Exisiting: Stove, Fridge, B/In Dishwasher, Microvent, Stacked Washer/Dryer. Elfs . Fab Amenities: Bbqs, Indoor Pool, Gym, Guest Suit 24 Hr-Concierge, Party Room, Visitor Parking. Metro Steps Away.','#1104 -100 WESTERN BATTERY RD','Toronto, Ontario','M6K3S2','','$399,900',399900.00,'0 + 1','1','Condominium/Strata','Storage - Locker, Exercise Centre, Recreation Centre','Public Transit','https://cdn.realtor.ca/listings/TS636880215799870000/reb82/highres/3/c4379253_1.jpg','2019-03-14 18:54:59','2019-03-14 18:54:59',NULL,1,NULL),(26,'Beautiful studio-loft open bedroom, bright, hardwood floors, large closets, spacious private terrace. - 10 minutes from metro Beaudry. - Near all services (restaurants, grocery stores, pharmacies, hospitals, public transport, etc.) .- Excellent location close to Lafontaine Park, Place Dupuis and all the activities of Downtown.','1925 Rue Alexandre-DeSève','Montreal, Quebec','H2L2W2','','$148,000',148000.00,'1','1','Condominium/Strata','Storage - Locker, Exercise Centre, Recreation Centre','Highway, CEGEP, Hospital, Park, Schools, Public Transit, University','https://cdn.realtor.ca/listings/TS636862995803800000/reb5/highres/4/9868794_1.jpg','2019-03-14 18:54:59','2019-03-14 18:54:59',NULL,1,NULL),(27,'Condo situé sur le Plateau Mont-Royal à coté du parc Lafontaine. Proche de toutes les commodités, des transports en commun et des grands axes majeurs de Montréal.Un espace privé dans cour arrière, pour des moments de partage entre amis. Un clé en main, tout y est bien pensé et chaque espace est optimisé avec des meubles encastrés.','3441 Av. De Lorimier','Montreal, Quebec','H2K3X5','','$149,900',149900.00,'1','1','Condominium/Strata','Exercise Centre, Recreation Centre','Hospital, Park, Schools, Public Transit','https://cdn.realtor.ca/listings/TS636869034395670000/reb5/highres/3/22213023_1.jpg','2019-03-14 18:54:59','2019-03-14 18:54:59',NULL,6,NULL),(28,'Superbe condo! Pourquoi louer! Devenez enfin propriétaire. Excellent rapport qualité/prix. Il vous offre une chambre, un salon avec foyer 2 faces au gaz, salle de bains avec douche séparée. Espace convivial à aire ouverte. Quartier très en demande, petite cour intérieure accessible. Stationnement facile sur la rue. Idéal pour 1er acheteur. À voir!','2224 Rue de Rouen','Montreal, Quebec','H2K1L5','','$169,000',169000.00,'1','1','Condominium/Strata','Storage - Locker, Exercise Centre, Recreation Centre','Highway, CEGEP, Hospital, Park, Schools, Public Transit, University','https://cdn.realtor.ca/listings/TS636869034532730000/reb5/highres/2/9451472_1.jpg','2019-03-14 18:54:59','2019-03-14 18:54:59',NULL,3,NULL),(29,'Nice Loft style condo in the heart of the Plateau located on the top floor. The condo can be rented very easily to students or anyone who is looking for a pied à terre. Presently rented until March 1 with RBND','4753 Rue Pontiac','Montreal, Quebec','H2J2T4','','$175,000',175000.00,'1','1','Condominium/Strata','Storage - Locker, Exercise Centre, Recreation Centre','Park, Schools, Public Transit','https://cdn.realtor.ca/listings/TS636832759525030000/reb5/highres/4/26427604_1.jpg','2019-03-14 18:54:59','2019-03-14 18:54:59',NULL,1,NULL),(30,'contruction 2010 cette  edifice de 12 unites offre une finition de qualite superieur.emplacement ideal a quelques pas du Parc Lafontaine,Hopital Notre Dame .PARFAIT POUR PROFESSIONNELS OU ETUDIANTS','2023 Av. Papineau','Montreal, Quebec','H2K4J5','','$185,000',185000.00,'1','1','Condominium/Strata','Storage - Locker, Exercise Centre, Recreation Centre','Hospital, Park, Public Transit, Schools','https://cdn.realtor.ca/listings/TS636836203664530000/reb5/highres/0/10683940_1.jpg','2019-03-14 18:54:59','2019-03-14 18:54:59',NULL,6,NULL);
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seenbies`
--

DROP TABLE IF EXISTS `seenbies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `seenbies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seenbies`
--

LOCK TABLES `seenbies` WRITE;
/*!40000 ALTER TABLE `seenbies` DISABLE KEYS */;
/*!40000 ALTER TABLE `seenbies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-14 17:19:24
