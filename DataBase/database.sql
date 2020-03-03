DROP DATABASE IF EXISTS buyzone;

CREATE DATABASE buyzone;

CREATE TABLE IF NOT EXISTS buyzone.customer(
customer_id INT(10) NOT NULL AUTO_INCREMENT,
customer_name TEXT(50) NOT NULL,
customer_phone TEXT(15) NOT NULL,
customer_address TEXT(200) NULL,
customer_email  TEXT(100) NOT NULL,
customer_password  TEXT(100) NOT NULL,
PRIMARY KEY( customer_id )
);


CREATE TABLE IF NOT EXISTS buyzone.product(
product_id  INT(10) NOT NULL AUTO_INCREMENT,
product_name TEXT(300) NULL,
product_provider TEXT(100) NULL,
product_type TEXT(50) NULL,
product_price INT(10) NOT NULL,
product_link TEXT(500) NULL,
product_details TEXT(2500) NULL,
product_image_source TEXT(150) NULL,
product_image_name TEXT(50) NULL,
PRIMARY KEY(product_id)
);

CREATE TABLE IF NOT EXISTS buyzone.cart(
customer_id INT(10) NOT NULL,
product_id INT(10) NOT NULL,
ip_address VARCHAR(250) NOT NULL,
quantity int(10) NOT NULL,
PRIMARY KEY(ip_address,product_id,customer_id),
FOREIGN KEY (product_id) REFERENCES product (product_id)
ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS buyzone.order_info(
customer_id INT(10) NOT NULL,
product_id INT(10) NOT NULL,
quantity INT(10) NOT NULL,
transaction_id TEXT(15) NULL,
payment_status TEXT(25) NULL,
delivery_status TEXT(25) NULL,
PRIMARY KEY(customer_id,product_id),
FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
ON DELETE CASCADE,
FOREIGN KEY (product_id) REFERENCES product (product_id)
ON DELETE CASCADE
);





INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('The Fallen (Memory Man series) Kindle Edition','Amazon','Books','1650','https://www.amazon.com/gp/product/B074M62RVY/ref=s9_acsd_newrz_hd_bw_bH_c_x_1_w?pf_rd_m=ATVPDKIKX0DER&pf_rd_s=merchandised-search-11&pf_rd_r=NEKAS8FQRWATEBE0F1ST&pf_rd_t=101&pf_rd_p=9f84e61f-7055-5c1b-8419-f76c432c8486&pf_rd_i=17','
Print Length: 432 pages<br><br>
Publisher: Grand Central Publishing (April 17, 2018)<br><br>
Publication Date: April 17, 2018<br><br>
Sold by: Hachette Book Group<br><br>
Language: English<br><br>
ASIN: B074M62RVY<br><br>
Text-to-Speech: Enabled<br><br>
X-Ray: Enabled<br><br>
Word Wise: Enabled<br><br>
Lending: Not Enabled<br><br>
Screen Reader: Supported<br><br>
Enhanced Typesetting: Enabled<br><br>  ','image/amazon/book/','fiction1.jpg');

INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('The Russian Assassin: A Max Austin Thriller, Book #1 Kindle Edition','Amazon','Books','1105','https://www.amazon.com/dp/B01GZ60V8I/ref=sspa_dk_detail_1?psc=1','
Print Length: 368 pages<br><br>
Simultaneous Device Usage: Unlimited<br><br>
Publisher: High Caliber Books<br><br> 1 edition (June 11, 2016)<br><br>
Publication Date: June 11, 2016<br><br>
Language: English<br><br>
ASIN: B01GZ60V8I<br><br>
Text-to-Speech: Enabled <br><br>
X-Ray: Enabled<br><br>
Word Wise: Enabled<br><br>
Lending: Not Enabled<br><br>
Screen Reader: Supported<br><br>
Enhanced Typesetting: Enabled<br><br>  ','image/amazon/book/','fiction2.jpg');

INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Dark World (Undying Mercenaries Series) ','Amazon','Books','1099','https://www.amazon.com/gp/product/1980621047/ref=s9_acsd_topr_hd_bw_bP_c_x_1_w?pf_rd_m=ATVPDKIKX0DER&pf_rd_s=merchandised-search-12&pf_rd_r=VJRD22DZKVPDGYC9RGG8&pf_rd_t=101&pf_rd_p=3ec7f6b0-de0f-529b-be12-8640438c73ff&pf_rd_i=25','
Series: Undying Mercenaries Series (Book 9)<br><br>
Paperback: 410 pages<br><br>
Publisher: Independently published (March 21, 2018)<br><br>
Language: English<br><br>
ISBN-10: 1980621047<br><br>
ISBN-13: 978-1980621041<br><br>
Product Dimensions: 6 x 1 x 9 inches<br><br>
','image/amazon/book/','fiction3.jpg');





INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Harry Potter and the Sorcerers Stone Kindle Edition','Amazon','Books','595','https://www.amazon.com/gp/product/B0192CTMYG/ref=s9_acsd_top_hd_bw_bP_c_x_2_w?pf_rd_m=ATVPDKIKX0DER&pf_rd_s=merchandised-search-5&pf_rd_r=VJRD22DZKVPDGYC9RGG8&pf_rd_t=101&pf_rd_p=3ec7f6b0-de0f-529b-be12-8640438c73ff&pf_rd_i=25','
Print Length: 322 pages<br><br>
Page Numbers Source ISBN: 0439708184<br><br>
Publisher: Pottermore from J.K. Rowling (December 8, 2015)<br><br>
Publication Date: December 8, 2015<br><br>
Sold by: Pottermore<br><br>
Language: English<br><br>
ASIN: B0192CTMYG<br><br>
Text-to-Speech: Enabled<br><br>
X-Ray: Enabled <br><br>
Word Wise: Enabled<br><br>
Lending: Enabled<br><br>
Screen Reader: Supported<br><br>
Enhanced Typesetting: Enabled<br><br>
','image/amazon/book/','fiction4.jpg');




INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Bandwidth (An Analog Novel Book 1) Kindle Edition','Amazon','Books','850','https://www.amazon.com/gp/product/B075CLV95J/ref=s9_acsd_top_hd_bw_bP_c_x_3_w?pf_rd_m=ATVPDKIKX0DER&pf_rd_s=merchandised-search-5&pf_rd_r=VJRD22DZKVPDGYC9RGG8&pf_rd_t=101&pf_rd_p=3ec7f6b0-de0f-529b-be12-8640438c73ff&pf_rd_i=25','
Print Length: 266 pages<br><br>
Page Numbers Source ISBN: 1503954420<br><br>
Publisher: 47North (May 1, 2018)<br><br>
Publication Date: May 1, 2018<br><br>
Sold by: Amazon Digital Services LLC<br><br>
Language: English<br><br>
ASIN: B075CLV95J<br><br>
Text-to-Speech: Enabled<br><br>
X-Ray:  Enabled<br><br>
Word Wise: Enabled<br><br>
Lending: Not Enabled<br><br>
Screen Reader: Supported<br><br>
Enhanced Typesetting: Enabled
','image/amazon/book/','fiction5.jpg');






INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Diary of a Wimpy Kid Rodrick Rules Hardcover – February 1, 2008','Amazon','Books','850','https://www.amazon.com/gp/product/0810994739/ref=s9_acsd_simh_bw_c_x_3_w?pf_rd_m=ATVPDKIKX0DER&pf_rd_s=merchandised-search-6&pf_rd_r=797JKYXKS7BZ4VG8BXQR&pf_rd_r=797JKYXKS7BZ4VG8BXQR&pf_rd_t=101&pf_rd_p=3f46272b-46fc-4cb1-8775-ee558b21f9c9&pf_rd_p=3f46272b-46fc-4cb1-8775-ee558b21f9c9&pf_rd_i=4','
Age Range: 8 - 12 years<br><br>
Grade Level: 3 - 7<br><br>
Lexile Measure: 910L (What\'s this?)<br><br>
Series: Diary of a Wimpy Kid (Book 2)<br><br>
Hardcover: 224 pages<br><br>
Publisher: Amulet Books (February 1, 2008)<br><br>
Language: English<br><br>
ISBN-10: 0810994739<br><br>
ISBN-13: 978-0810994737<br><br>
Product Dimensions: 5.5 x 0.8 x 8 inches<br><br>
','image/amazon/book/','childrenbook1.jpg');



INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('The Very Hungry Caterpillar Board Books – March 23, 1994','Amazon','Books','930','https://www.amazon.com/gp/product/0399226907/ref=s9_acsd_simh_bw_c_x_3_w?pf_rd_m=ATVPDKIKX0DER&pf_rd_s=merchandised-search-10&pf_rd_r=797JKYXKS7BZ4VG8BXQR&pf_rd_r=797JKYXKS7BZ4VG8BXQR&pf_rd_t=101&pf_rd_p=d39e5c9f-9cda-4306-9a63-0cb64e3c8158&pf_rd_p=d39e5c9f-9cda-4306-9a63-0cb64e3c8158&pf_rd_i=4','
Age Range: 3 and up <br><br>
Lexile Measure: AD460L (What\'s this?)<br><br>
Board Books: 26 pages<br><br>
Publisher: Philomel Books<br><br> Brdbk edition (March 23, 1994)<br><br>
Language: English<br><br>
ISBN-10: 0399226907<br><br>
ISBN-13: 978-0399226908<br><br>
Product Dimensions: 5.1 x 0.6 x 7.1 inches<br><br>
','image/amazon/book/','childrenbook2.jpg');



INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Puppy Birthday to You! (Paw Patrol) (Little Golden Book) Hardcover – July 28, 2015','Amazon','Books','425','https://www.amazon.com/gp/product/0553522779/ref=s9_acsd_zgift_hd_bw_b4_c_x_3_w?pf_rd_m=ATVPDKIKX0DER&pf_rd_s=merchandised-search-12&pf_rd_r=797JKYXKS7BZ4VG8BXQR&pf_rd_t=101&pf_rd_p=25c6136f-1ad2-52e4-a418-8643b237c969&pf_rd_i=4','
Age Range: 2 - 5 years<br><br>
Grade Level: Preschool - Kindergarten<br><br>
Lexile Measure: AD590L (What\'s this?)<br><br>
Series: Little Golden Book<br><br>
Hardcover: 24 pages<br><br>
Publisher: Golden Books (July 28, 2015)<br><br>
Language: English<br><br>
ISBN-10: 0553522779<br><br>
ISBN-13: 978-0553522778<br><br>
Product Dimensions: 6.6 x 0.2 x 8 inches<br><br>
','image/amazon/book/','childrenbook3.jpg');



INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Chicka Chicka Boom Boom (Board Book) Board book – August 28, 2012
by Bill Martin Jr. (Author), John Archambault  (Author), Lois Ehlert (Illustrator)','Amazon','Books','510','https://www.amazon.com/gp/product/1442450703/ref=s9_acsd_simh_hd_bw_b4_c_x_1_w?pf_rd_m=ATVPDKIKX0DER&pf_rd_s=merchandised-search-11&pf_rd_r=797JKYXKS7BZ4VG8BXQR&pf_rd_t=101&pf_rd_p=25c6136f-1ad2-52e4-a418-8643b237c969&pf_rd_i=4','
Age Range: 1 - 4 years<br><br>
Grade Level: Preschool and up<br><br>
Board book: 36 pages<br><br>
Publisher: Little Simon (2012)<br><br>
Language: English<br><br>
ISBN-10: 1442450703<br><br>
ISBN-13: 978-1442450707<br><br>
Product Dimensions: 5.5 x 1 x 7.2 inches<br><br>
','image/amazon/book/','childrenbook4.jpg');



INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Introduction to Programming in Java: An Interdisciplinary Approach (2nd Edition) 2nd Edition
by Robert Sedgewick  (Author), Kevin Wayne (Author)','Amazon','Books','5100','https://www.amazon.com/dp/0672337843/ref=sxbs_sxwds-stvpv2_2?pf_rd_m=ATVPDKIKX0DER&pf_rd_p=3534659722&pd_rd_wg=q2sch&pf_rd_r=MVP0CQB0GHH2WGTKRD0M&pf_rd_s=desktop-sx-bottom-slot&pf_rd_t=301&pd_rd_i=0672337843&pd_rd_w=xL3fI&pf_rd_i=textbook+of+computer+science&pd_rd_r=1ff8d000-5c8f-40f9-b0d8-e545a5907744&ie=UTF8&qid=1523816463&sr=2','
Paperback: 784 pages<br><br>
Publisher: Addison-Wesley Professional 2 edition (April 9, 2017)<br><br>
Language: English<br><br>
ISBN-10: 0672337843<br><br>
ISBN-13: 978-0672337840<br><br>
Product Dimensions: 7.3 x 1.2 x 8.9 inches<br><br>
','image/amazon/book/','textbook1.jpg');





INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Python Programming: An Introduction to Computer Science 2nd Edition
by John Zelle (Author)','Amazon','Books','1700','https://www.amazon.com/Python-Programming-Introduction-Computer-Science/dp/1590282418/ref=sr_1_4?s=books&ie=UTF8&qid=1523816463&sr=1-4&keywords=textbook+of+computer+science&dpID=51g-BQf7y2L&preST=_SX218_BO1,204,203,200_QL40_&dpSrc=srch','
Paperback: 432 pages<br><br>
Publisher: Franklin, Beedle & Associates<br><br>
2nd edition (May 7, 2010)<br><br>
Language: English<br><br>
ISBN-10: 1590282418<br><br>
ISBN-13: 978-1590282410<br><br>
Product Dimensions: 7 x 1.2 x 10 inches<br><br>
','image/amazon/book/','textbook2.jpg');




INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Introduction to Algorithms, 3rd Edition (MIT Press) 3rd Edition
by Thomas H. Cormen  (Author), Charles E. Leiserson  (Author), Ronald L. Rivest  (Author)','Amazon','Books','3910','https://www.amazon.com/Introduction-Algorithms-3rd-MIT-Press/dp/0262033844/ref=sr_1_1?s=books&ie=UTF8&qid=1523817019&sr=1-1&keywords=algorithm+coreman','
Series: MIT Press<br><br>
Hardcover: 1312 pages<br><br>
Publisher: The MIT Press<br><br>
3rd edition (July 31, 2009)<br><br>
Language: English<br><br>
ISBN-10: 0262033844<br><br>
ISBN-13: 978-0262033848<br><br>
Product Dimensions: 8 x 1.8 x 9 inches<br><br>
','image/amazon/book/','textbook3.jpg');






INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Apple iMac MC309LL/A 21.5-Inch Desktop (Certified Refurbished)','Amazon','Electronics','30600','https://www.amazon.com/Apple-MC309LL-21-5-Inch-Certified-Refurbished/dp/B01N9Y87LS/ref=sr_1_18?s=pc&ie=UTF8&qid=1523817639&sr=1-18&keywords=computer','
Screen Size:	21.5 inches<br><br>
Processor:	2.5 GHz Core i5-2300<br><br>
RAM: 4 GB<br><br>
Hard Drive:	500 GB<br><br>
Graphics Coprocessor:	AMD Radeon HD 6750M graphics<br><br>
Card Description:	dedicated<br><br>
Brand Name	: Apple<br><br>
Series	: iMac<br><br>
Item model number:	MC309LL/A<br><br>
Hardware Platform:	Mac<br><br>
Operating System:	Mac OS X<br><br>
Item Weight	:    31.4 pounds<br><br>
Product Dimensions:	22.2 x 9.3 x 22.5 inches<br><br>
Item Dimensions :L x W x H	22.2 x 9.3 x 22.5 inches<br><br>
Processor Brand	:Apple<br><br>
Processor Count	:1<br><br>
Computer Memory Type: DDR3 SDRAM<br><br>
Hard Drive Interface : ATA<br><br>','image/amazon/electronics/','computer1.jpg');





INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('CYBERPOWERPC Gamer Xtreme GXIVR8020A4 Desktop Gaming PC (Intel i5-7400 3.0GHz, AMD RX 580 4GB, 8GB DDR4 RAM, 1TB 7200RPM HDD, WiFi, Win 10 Home), Black - VR Ready','Amazon','Electronics','66300','https://www.amazon.com/CYBERPOWERPC-GXIVR8020A4-Desktop-i5-7400-7200RPM/dp/B0747W15QL/ref=sr_1_14?s=pc&ie=UTF8&qid=1523817639&sr=1-14&keywords=computer','
Processor : 3 GHz<br><br>
RAM : 8 GB DIMM<br><br>
Hard Drive :1024 GB Mechanical Hard Drive<br><br>
Graphics Coprocessor:	RX 580<br><br>
Chipset Brand : AMD<br><br>
Card Description: Video Card: AMD RX 580 4GB<br><br>
Graphics Card Ram Size:	4 GB<br><br>
Number of USB 2.0 Ports: 2<br><br>
Number of USB 3.0 Ports: 5<br><br>
Brand Name : CyberpowerPC<br><br>
Item model number: GXiVR8020A4<br><br>
Hardware Platform: PC<br><br>
Operating System: Windows 10 Home<br><br>
Item Weight: 30.9 pounds<br><br>
Product Dimensions:	18.5 x 7.9 x 17.9 inches<br><br>
Item Dimensions: L x W x H	18.46 x 7.87 x 17.89 inches<br><br>
Color Video Card: AMD RX 580 4GB<br><br>
Processor Brand: CYBERPOWERPC Gamer Xtreme GXIVR8020A4 Desktop Gaming PC (Intel i5-7400 3.0GHz, AMD RX 580 4GB, 8GB DDR4 RAM, 1TB 7200RPM HDD, WiFi, Win 10 Home), Black<br><br>
Processor Count: 4<br><br>
Computer Memory Type: DDR4 SDRAM<br><br>
Hard Drive Interface Serial : ATA-600<br><br>
Hard Drive Rotational Speed : 7200 RPM<br><br>
Optical Drive Type:	None<br><br>','image/amazon/electronics/','computer2.jpg');





INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Acer Aspire Desktop, 7th Gen Intel Core i5-7400, 12GB DDR4, 2TB HDD, Windows 10 Home, TC-780-ACKI5','Amazon','Electronics','40800','https://www.amazon.com/Acer-Desktop-i5-7400-Windows-TC-780-ACKI5/dp/B073YHNPC6/ref=sr_1_9?s=pc&ie=UTF8&qid=1523817639&sr=1-9&keywords=computer','
Processor : 3 GHz Intel Core i5<br><br>
RAM	: 12 GB DDR4<br><br>
Hard Drive : 2000 GB Mechanical Hard Drive<br><br>
Graphics Coprocessor	: integrated_graphics<br><br>
Card Description :	Integrated<br><br>
Number of USB 2.0 Ports :	4<br><br>
Number of USB 3.0 Ports :	3<br><br>
Brand Name	: Acer<br><br>
Series	: Aspire<br><br>
Item model number :	TC-780-ACKI5<br><br>
Hardware Platform :	PC<br><br>
Operating System  :	Windows 10<br><br>
Item Weight	: 18.43 pounds<br><br>
Product Dimensions	:17.4 x 6.9 x 15.7 inches<br><br>
Item Dimensions :L x W x H	17.43 x 6.89 x 15.67 inches<br><br>
Color : Black<br><br>
Processor Brand	: Intel<br><br>
Processor Count	: 4<br><br>
Computer Memory Type : DDR3 SDRAM<br><br>
Hard Drive Interface : Serial ATA<br><br>
Hard Drive Rotational Speed : 7200 RPM<br><br>
Optical Drive Type : DVD-RW<br><br>','image/amazon/electronics/','computer3.jpg');









INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Sceptre E205BV-SMQC 20" 720p 60Hz Class LED HDTV','Amazon','Electronics','6800','https://www.amazon.com/Sceptre-E205BV-SMQC-720p-60Hz-Class/dp/B01F2AWQNQ/ref=sr_1_4?s=tv&ie=UTF8&qid=1523817862&sr=1-4&keywords=tv&dpID=514nRRteF5L&preST=_SX300_QL70_&dpSrc=srch','
Product Dimensions	: 18.5 x 3 x 13 inches<br><br>
Item Weight	: 3 pounds<br><br>
ASIN: B01F2AWQNQ<br><br>
Item model number :	E205BV-SMQC<br><br>
Date first available at Amazon.com : May 2, 2016<br><br>','image/amazon/electronics/','tv1.jpg');




INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Samsung Electronics UN43MU6300 43-Inch 4K Ultra HD Smart LED TV (2017 Model)','Amazon','Electronics','127000','https://www.amazon.com/Samsung-Electronics-UN43MU6300-43-Inch-Ultra/dp/B06XGJX3SF/ref=sr_1_6?s=tv&ie=UTF8&qid=1523817862&sr=1-6&keywords=tv','
Size:43-Inch  |  Style:TV<br><br>
Brand Name : Samsung<br><br>
Item Weight : 21.2 pounds<br><br>
Product Dimensions : 38.4 x 11.3 x 25.1 inches<br><br>
Item model number :	UN43MU6300FXZA<br><br>
Color Name : Black<br><br>','image/amazon/electronics/','tv2.jpg');




INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('LG Electronics 55UJ6300 49-Inch 4K Ultra HD Smart LED TV (2017 Model)','Amazon','Electronics','30000','https://www.amazon.com/LG-Electronics-55UJ6300-55-Inch-Ultra/dp/B01N16QDXQ/ref=sr_1_5?s=tv&ie=UTF8&qid=1523817862&sr=1-5&keywords=tv&dpID=513dLU4%252BHgL&preST=_SX300_QL70_&dpSrc=srch&th=1','
Size:49-Inch<br><br>
Brand Name : LG<br><br>
Item Weight	: 25.1 pounds<br><br>
Product Dimensions : 43.7 x 9.3 x 27.8 inches<br><br>
Item model number : 49UJ6300<br><br>
Batteries : 2 AA batteries required. (included)<br><br>
Color Name : Black<br><br>','image/amazon/electronics/','tv3.jpg');





INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Samsung Galaxy S9+ Unlocked Smartphone - Lilac Purple - US Warranty','Amazon','Electronics','62475','https://www.amazon.com/Samsung-Galaxy-S9-Unlocked-Smartphone/dp/B079JPRTKD/ref=sr_1_1_sspa?s=wireless&ie=UTF8&qid=1523820121&sr=1-1-spons&keywords=smartphone&psc=1','
Offer Type:Phone Only |  Color:Lilac Purple  |  Size:S9+<br><br>
Package Dimensions : 6.8 x 3.7 x 2.3 inches<br><br>
Item Weight: 14.4 ounces<br><br>
ASIN:B079JPRTKD<br><br>
IP68 rating: withstands splashes, spills, and rain so it can take a dip, worry-free<br><br>
Internal Memory : 64 GB. Expandable Storage up to 400GB<br><br>
Fast Wireless Charging: Avoid the wires and power up quickly by placing your phone on a Fast Wireless Charger<br><br>','image/amazon/electronics/','mobile1.jpg');




INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Huawei Mate SE Factory Unlocked 5.93” - 4GB/64GB Octa-core Processor| 16MP + 2MP Dual Camera| Grey (US Warranty)','Amazon','Electronics','19500','https://www.amazon.com/Huawei-Mate-Factory-Unlocked-5-93/dp/B0791VS3N9/ref=sr_1_6?s=wireless&ie=UTF8&qid=1523820121&sr=1-6&keywords=smartphone','
Color:Grey<br><br>
Product Dimensions : 6.2 x 0.3 x 3 inches<br><br>
Item Weight : 5.8 ounces<br><br>
ASIN : B0791VS3N9<br><br>
Item model number : 51092DRH<br><br>
Batteries : 1 Lithium Polymer batteries required. (included)<br><br>
Extra Feature : The dual-lens 16MP + 2MP rear camera offers an all new portrait mode, letting you capture professional and artistic photos in a single shot with an ultra-fast focus time
4GB RAM, 64 GB storage + Micro SD compatible up to 256GB (not included) + dual nano SIM card capability, 2.36GHz octa-core processor
Big 3340 mAh battery for tons of screen-time on a single charge and ultra power saving mode to extend your charge even longer, keeping you connected when you need it most
The sleek metal design of the mate SE is a delight to hold - the 2.5D glass face flows seamlessly into the aluminum chassis forming perfectly rounded edges<br><br>','image/amazon/electronics/','mobile2.jpg');





INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Xiaomi Mi Mix 2 64GB Black, Dual Sim, 5.99", 6GB RAM, GSM Unlocked Global Model, No Warranty','Amazon','Electronics','37060','https://www.amazon.com/Xiaomi-Black-Unlocked-Global-Warranty/dp/B079816Y5T/ref=sr_1_11?s=wireless&ie=UTF8&qid=1523820121&sr=1-11&keywords=smartphone','
Color : Black<br><br>
Product Dimensions : 6.3 x 4.3 x 0.8 inches<br><br>
Item Weight : 1.1 pounds<br><br>
ASIN : B079816Y5T<br><br>
Batteries : 1 Lithium ion batteries required. (included)<br><br>
Display : 15.2cm (5.99) large display, 18:9 aspect ratio<br><br>
Chip : Snapdragon 835 Flagship Qualcomm processor<br><br>
Memory: 64GB<br><br>
RAM : 6GB<br><br>
Sim :Dual<br><br>
Camera: 12MP rear camera, 5MP front camera<br><br>','image/amazon/electronics/','mobile3.jpg');





INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Sony Xperia L1 - Unlocked Smartphone - 16GB - Black (US Warranty)','Amazon','Electronics','12750','https://www.amazon.com/Sony-Xperia-L1-Unlocked-Smartphone/dp/B06XGYQWZN/ref=sr_1_9?s=wireless&ie=UTF8&qid=1523820121&sr=1-9&keywords=smartphone','
Color:Black<br><br>
Product Dimensions : 5.9 x 2.9 x 0.3 inches<br><br>
Item Weight : 6.6 ounces<br><br>
ASIN : B06XGYQWZN<br><br>
Item model number : G3313 (Black)<br><br>
Batteries : 1 Lithium ion batteries required. (included)<br><br>
Camera : 13MP main camera with autofocus and 3X clear zoom<br><br>
Front Camera : 5MP<br><br>
Processor : MT6737T 64-bit Quad-core 1.5GHz processor with Android 7.0 OS support<br><br>
Battery: Comes with 2620mAh battery with Qnovo Adaptive Charging & STAMINA Mode.<br><br>
Extra Feature :2GB RAM and 16GB internal memory storage Also supports external memory card for up to 256GB of additional storage
Unlocked and compatible with GSM/LTE carriers utilizing GSM network such as AT&T, T-Mobile, Straight Talk, MetroPCS, Cricket Wireless, Simple Mobile, Bright spot, and others<br><br>','image/amazon/electronics/','mobile4.jpg');





INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Amaxuan Women\'s Leather Loafers Moccasins Wild Driving Casual Flats Oxfords Breathable Shoes','Amazon','clothing-shoes-jewelry','1340','https://www.amazon.com/Womens-Leather-Loafers-Driving-Burgundy/dp/B07BC9JJDM/ref=sr_1_15?s=apparel&ie=UTF8&qid=1523822019&sr=1-15&nodeID=7147440011&psd=1&keywords=shoe&th=1','
CN35 : US4.5 fit for feet length 225mm<br><br>
CN36 : US5 fit for feet length 230mm<br><br>
CN37 : US6 fit for feet length 235mm<br><br>
CN38 : US7 fit for feet length 24cm<br><br>
CN39 : US8 fit for feet length 245mm<br><br>
CN40 : US8.5 fit for feet length 250mm<br><br>
CN41 : US9 fit for feet length 255mm<br><br>
CN42 : US10 fit for feet length 260mm<br><br>
CN43 : US10.5 fit for feet length 265mm<br><br>
CN44 : US11 fit for feet length 270mm<br><br>
Product Dimensions: 5.5 x 4.7 x 2.4 inches<br><br>
ASIN: B07BR1WN1L<br><br>
Date first available at Amazon.com: May 19, 2017<br><br>
','image/amazon/clothing-shoes-jewelry/','shoe3.jpg');





INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Polo Ralph Lauren Men\'s Faxon Low Sneaker','Amazon','clothing-shoes-jewelry','4000','https://www.amazon.com/Polo-Ralph-Lauren-Faxon-Low/dp/B0066BE3TG/ref=sr_1_13?s=apparel&ie=UTF8&qid=1523821850&sr=1-13&nodeID=7141123011&psd=1&keywords=shoes','
Product : A heavy toe and heel bumper distinguish this logoed offering from Polo Ralph Lauren.
Polo Ralph Lauren puts its distinctive stamp on a minimalist sneaker with the Faxon. The sleek canvas upper follows a classic retro shape, but the addition of rawhide laces and an embroidered logo detail lend fresh updates<br><br>
Package Dimensions: 12 x 8 x 4 inches<br><br>
ASIN: B0067TZ1D4<br><br>
Item model number: FAXON LOW<br><br>
Date first available at Amazon.com: October 4, 2005<br><br>
','image/amazon/clothing-shoes-jewelry/','shoe2.jpg');





INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Goodthreads Men\'s Standard-Fit Long-Sleeve Two-Color Gingham Shirt','Amazon','clothing-shoes-jewelry','2125','https://www.amazon.com/Goodthreads-Standard-Fit-Long-Sleeve-Two-Color-XX-Large/dp/B06VTDF5H8/ref=sr_1_1_sspa?s=apparel&ie=UTF8&qid=1523822778&sr=1-1-spons&nodeID=7147441011&psd=1&keywords=shirt&psc=1','Product :
An Amazon brand - This work- or weekend-perfect casual button-front shirt in a two-color gingham check features a special wash for a soft feel and maximum comfort
Goodthreads’ collection of men’s clothing crafted with care takes wear-everywhere apparel to the next level. Create can’t-miss pairings with long- and short-sleeve button-down shirts in standard and slim fits, plus chino pants and shorts made from wrinkle-free non-iron fabric. With these classics—and T-shirts, polo shirts, and outerwear to round out your look—Goodthreads is your go-to for wardrobe staples with the style you want<br><br>
ASIN: B06VTF3C5P<br><br>
Item model number: S17GT25028<br><br>
Date first available at Amazon.com: January 1, 2020<br><br>
','image/amazon/clothing-shoes-jewelry/','shirt1.jpg');




INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Goodthreads Men\'s Standard-Fit Long-Sleeve Chambray Shirt','Amazon','clothing-shoes-jewelry','2125','https://www.amazon.com/Goodthreads-Standard-Fit-Long-Sleeve-Chambray-Shirt/dp/B01KJTBCW6/ref=cts_ap_1_afe?dpID=51c-M5EyW4L&preST=_SX342_QL70_&dpSrc=detail','
Dimensions: 13.5 x 9 x 0.5 inches<br><br>
ASIN: B01KJTBCW6<br><br>
Item model number: F16GT25007<br><br>
Date first available at Amazon.com: January 17, 2017<br><br>
','image/amazon/clothing-shoes-jewelry/','shirt2.jpg');


INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Pepperidge Farm Goldfish Variety Pack Classic Mix, (Box of 30 bags)','Amazon','food-grocery','2275','https://www.amazon.com/gp/product/B01GQ5GQEG/ref=s9_acsd_top_hd_bw_b16UHh_c_x_3_w?pf_rd_m=ATVPDKIKX0DER&pf_rd_s=merchandised-search-5&pf_rd_r=93399MQXA72VRMJ7ZWJT&pf_rd_t=101&pf_rd_p=6cf30ad1-d8c2-569c-a34e-300b23f57a4a&pf_rd_i=16322721&th=1','
Product: 12 packs of Goldfish Cheddar (1oz each), baked with real cheese
10 packs of Goldfish Colors (0.9oz each), baked with real cheese and colors sourced from plants
8 packs of Goldfish Pretzel (1oz each)
No artificial flavors or preservatives
Save time and money with subscribe & save - know your pantry will always be stocked with your must-have snack<br><br>','image/amazon/food-grocery/','food-grocery1.jpg');







INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('KIND Bars, Dark Chocolate Nuts & Sea Salt, Gluten Free, Low Sugar, 1.4oz, 12 Count','Amazon','food-grocery','3440','https://www.amazon.com/gp/product/B007PE7ANY/ref=s9_acsd_top_hd_bw_b16UHh_c_x_2_w?pf_rd_m=ATVPDKIKX0DER&pf_rd_s=merchandised-search-5&pf_rd_r=93399MQXA72VRMJ7ZWJT&pf_rd_t=101&pf_rd_p=6cf30ad1-d8c2-569c-a34e-300b23f57a4a&pf_rd_i=16322721&th=1','
Product:
Contains 12 - 1.4oz KIND Bars
Our best-selling bar is a simple blend of Brazilian sea salt sprinkled over whole nuts and drizzled with dark chocolate.
With 5g of sugar, it\'s a satisfying, nutty snack that only seems indulgent.
Gluten free, Non GMO, 0g Trans Fat, Kosher
Low glycemic index, low sodium, good source of fiber
Sweet and salty blend of almonds, peanuts, and walnuts drizzled in chocolate with a touch of sea salt
Provides all natural protein, fiber and only 5g of sugar
Finely crafted from the highest quality whole nuts and nature\'s most delicious spices
KIND is a brand of delicious, natural, healthful foods made from wholesome ingredients you can see & pronounce<br><br>','image/amazon/food-grocery/','food-grocery2.jpg');




INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Orgain Organic Plant Based Protein Powder, Creamy Chocolate Fudge, 2.03 Pound, 1 Count, Vegan, Non-GMO, Gluten Free, Packaging May Vary','Amazon','food-grocery','1888','https://www.amazon.com/gp/product/B00J074W94/ref=s9_acsd_top_hd_bw_bGAC9zP_c_x_w?pf_rd_m=ATVPDKIKX0DER&pf_rd_s=merchandised-search-5&pf_rd_r=CYDKZF16KRB57JQYGPA8&pf_rd_t=101&pf_rd_p=18ea6a73-4ef4-505e-a8f7-75717314b226&pf_rd_i=14808787011','
Product:
Includes 1 (2.03lb) Organic Plant Based Creamy Chocolate Fudge<br><br> Protein Power:
Ideal for healthy, on-the-go nourishment for busy professionals, moms, athletes and students<br><br>
Quantity : 21g Organic Plant Based Protein, 5g Organic Fiber, 3g Net Carbs, 150 Calories per Serving<br><br>
Others : Gluten Free, Kosher, Vegan, Non-GMO, Soy Free
USDA Organic<br><br>','image/amazon/food-grocery/','food-grocery3.jpg');








INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Roland Sicilian Castelvetrano Olives, Whole, 52.9 oz Can','Amazon','food-grocery','2295','https://www.amazon.com/Roland-Sicilian-Castelvetrano-Olives-Whole/dp/B004XAPINM/ref=sr_1_12_s_it?s=grocery&ie=UTF8&qid=1524324044&sr=1-12&keywords=food','
Product:
Product weights : 3lbs 4.9 ounce equal to 52.9 Ounce<br><br>
Others: Whole castelvetrano olives are a unique specialty olive from Sicily with a mild flavor and non-bitter aftertaste
Appealing to both olive lovers as well as those who shy away from stronger, saltier olive varieties
These olives may be used directly out of the can as an appetizer or with a salad
Zero grams of trans fat
Product of Italy<br><br>','image/amazon/food-grocery/','food-grocery4.jpg');




INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Cadbury Caramel Mini Eggs, Milk Chocolate Easter Candy, Bulk Pack (Pack of 2 Pounds)','Amazon','food-grocery','1105','https://www.amazon.com/gp/product/B07B886PFQ/ref=s9_acsd_newrz_hd_bw_b16UDV_c_x_w?pf_rd_m=ATVPDKIKX0DER&pf_rd_s=merchandised-search-12&pf_rd_r=WSE6VZMR9KPEQ6V2J4R9&pf_rd_t=101&pf_rd_p=bfe769ee-b0df-568e-937a-3134641a3965&pf_rd_i=16322461','
Product: Cadbury Caramel Mini Eggs, Milk Chocolate Easter Candy, Bulk Pack (Pack of 2 Pounds)
Cadbury Caramel Mini Eggs, Milk Chocolate Easter Candy
Milk Chocolate Filled with Caramel Egg Shaped Easter Candy
Individually wrapped in gold foils
Comes in retail bulk pack, 2 pounds per order<br><br>','image/amazon/food-grocery/','food-grocery5.jpg');





INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Planters Nut 24 Count-Variety Pack, 2 Lb 8.5 Ounce','Amazon','food-grocery','765','https://www.amazon.com/gp/product/B008GVJ9S4/ref=s9_acsd_top_hd_bw_b16R25_c_x_2_w?pf_rd_m=ATVPDKIKX0DER&pf_rd_s=merchandised-search-5&pf_rd_r=K4NZ79JAZM200VTD7JB1&pf_rd_t=101&pf_rd_p=01abe2ca-ed82-5b19-8aaa-0ca9a49e4d81&pf_rd_i=16310221&th=1','
Product: Planters Nut 24 Count-Variety Pack, 2 Lb 8.5 Ounce
Convenient single-serving packs
Salted peanuts offer fresh-roasted taste
Honey-roasted peanuts for sweet and salty snacking
Salted cashews offer delicate sweetness and smooth texture
Good source of key nutrients such as fiber and protein<br><br>','image/amazon/food-grocery/','food-grocery6.jpg');




INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('PBfit All-Natural Peanut Butter Powder, 30 Ounce','Amazon','food-grocery','1350','https://www.amazon.com/dp/B01KKEECLS?aaxitk=9XgWCu0eE7cPxNsGz2ud0A&th=1','
Product:PBfit All-Natural Peanut Butter Powder, 30 Ounce
Do PB&J the leaner way — PBfit has 90% less fat and 1/3 of the calories compared to regular peanut butter (when prepared as directed), yet it\'s made from real roasted, pressed peanuts.
Deliciousness defined — For a delicious, low-fat peanut butter spread, combine 2 tbsp. PBfit with 1 ½ tbsp. water. Stir until smooth, and spread anywhere you would put normal peanut butter!
Protein power — With 6g of protein in one serving of PBfit, you can get a boost of protein right before your workout. Try adding it to the protein powder you already use<br><br>','image/amazon/food-grocery/','food-grocery7.jpg');




INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('REESE\'S Peanut Butter Cups, Chocolate Candy, Miniatures, 40 Ounce Bulk Candy','Amazon','food-grocery','8000','https://www.amazon.com/gp/product/B001UUEWIA/ref=s9_acsd_zgift_hd_bw_b16UDV_c_x_w?pf_rd_m=ATVPDKIKX0DER&pf_rd_s=merchandised-search-11&pf_rd_r=WSE6VZMR9KPEQ6V2J4R9&pf_rd_t=101&pf_rd_p=bfe769ee-b0df-568e-937a-3134641a3965&pf_rd_i=16322461',' Product:
The perfect combination of chocolate and peanut butter for snacking and sharing
This bulk bag ensures you\'ll have enough delicious peanut butter cups left over for baking
Individually wrapped in eye-catching gold foils
A kosher and gluten free candy
Includes one bag of Reese\'s Peanut Butter Cups Miniatures (40-Ounce bag)<br><br>','image/amazon/food-grocery/','food-grocery8.jpg');






INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Succulent Laser Cut Wood Journal (Notebook / Birthday Gift / Gratitude Journal / HandMade)','Amazon','Handmade','2465','https://www.amazon.com/dp/B01DTF0MLY/?ref=idea_lv_dp_vv_d','
Production Method	:We use a laser cutter to engrave the cover of this beautiful journal. We take great care to source the wood locally and our proud to say our wood is certified sustainable. We then hand bind each and every journal, taking great care to make sure every single one is perfect and ready to ship to you!<br><br>
Width :	5.25 inches<br><br>
Length : 7.25 inches<br><br>
Color : Sage<br><br>
Material : Wood, Alder Wood, Hardwood<br><br>','image/amazon/handmade/','handmade1.jpg');






INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Geometric wood succulent planter','Amazon','HandMade','2550','https://www.amazon.com/dp/B016E71UPG/?ref=idea_lv_dp_vv_d','
Production Method :	Handmade from reclaimed cedar, sanded and finished with a mineral oil and beeswax<br><br>
Width :3.50 inches<br><br>
Height : 3.50 inches<br><br>
Length : 3.50 inches<br><br>
Color : Light brown<br><br>
Material : Reclaimed cedar, mineral oil, beeswax.
Finish Type : Matte<br><br>','image/amazon/handmade/','handmade2.jpg');





INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Laser cut death star cuff links made from walnut wood','Amazon','HandMade','2125','https://www.amazon.com/Laser-death-star-links-walnut/dp/B01MCTX4BW?ref=hdn_dp_car_mba_3','
Production Method	:Death star cuff links are laser cut and adhered to metal backings<br><br>
Material : 	Wood, metal<br><br>
Width : 1.25 inches<br><br>
Length : 0.63 inches<br><br>
Resizable : No<br><br>','image/amazon/handmade/','handmade3.jpg');



INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Organic Shoulder Bag in Botanical Print','Amazon','HandMade','2125','https://www.amazon.com/dp/B071LTHK7G/?ref=idea_lv_dp_vv_d','
Production Method	: Each textile design begins with a sketch, which she then translates into a screen print design. Screens are burned in studio, using the power of the sun to expose the image. All fabric is screen printed by hand with non-toxic, water-based inks, and all fabric is heat set for longevity of use. Solid color fabrics are hand-dyed using natural dyes such as Indigo, Madder Root, and Logwood. She hand sews each item using her own sewing patterns and the completed textiles.
Featured Stores	Featured Artisans<br><br>
Material : Organic Cotton, Leather, Waxed Canvas<br><br>
Fabric Type : Organic Cotton<br><br>
Color : green, brown<br><br>
Width : 14 inches<br><br>
Height : 18<br><br> inches<br><br>','image/amazon/handmade/','handmade4.jpg');





INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Hand Stitched Leather Small Crossbody Bag in Birds','Amazon','HandMade','10030','https://www.amazon.com/Stitched-Leather-Small-Crossbody-Birds/dp/B071W61R1R?ref=hdn_dp_car_mba_1','
Production Method	:Each textile design begins with a sketch, which she then translates into a screen print design. Screens are burned in studio, using the power of the sun to expose the image. All fabric is screen printed by hand with non-toxic, water-based inks, and all fabric is heat set for longevity of use. Solid color fabrics are hand-dyed using natural dyes such as Indigo, Madder Root, and Logwood. She hand sews each item using her own sewing patterns and the completed textiles.
Featured Stores	Featured Artisans<br><br>
Material : Leather<br><br>
Color Blue','image/amazon/handmade/','handmade5.jpg');







INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Dont Succ | 11oz Ceramic Coffee Mug | Coffee Cup','Amazon','HandMade','850','https://www.amazon.com/dp/B071WXT8M5/?ref=idea_lv_dp_vv_d','
Production Method : We only source products we can be 100% proud of. Due to the high-quality mug and screen-printing technique used<br><br>
Our Quality Promise : These mugs can be washed over and over again and still come out looking fantastic. We do not use a vinyl application. These mugs are also made to withstand heat, so you can microwave with no fear of damaging the mug or design<br><br>
Size : 11 ounce<br><br>
Color :	Black<br><br>
Material : Ceramic<br><br>','image/amazon/handmade/','handmade6.jpg');





INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Custom Wooden "Secret Garden" Sign','Amazon','HandMade','1785','https://www.amazon.com/dp/B016QZNLB2/?ref=idea_lv_dp_vv_d','
Production Method :	Made from wood with a string attached<br><br>
Size : Approx. 12.5" by 5.5"<br><br>
Material : Wood<br><br>
Number Of Pieces : 1<br><br>','image/amazon/handmade/','handmade7.jpg');




INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Herb Markers Set of 6 GARDEN stakes Made From Vintage Spoon Handles ~ Oregano, Basil, Parsley, Rosemary, Thyme, Dill','Amazon','HandMade','2380','https://www.amazon.com/dp/B017VLLWVG/?ref=idea_lv_dp_vv_d','
Production Method : Spoons have been flattened and cut. I grind and stamp each handle with an Herb name. Polish slightly<br><br>
Size : Medium<br><br>
Color : Silver and Black<br><br>
Material : Silver-Plated<br><br>
Number Of Pieces : 6<br><br>
Surface Treatment Method : Hand Stamped<br><br>','image/amazon/handMade/','handmade8.jpg');



INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Turkish Towel Monogrammed | Monogrammed Linens | Kitchen Linens | Personalized Gifts | Farmhouse Towel','Amazon','HandMade','1275','https://www.amazon.com/Turkish-Monogrammed-Kitchen-Personalized-Farmhouse/dp/B07BGDGD47/ref=lp_11434973011_1_1?s=handmade&ie=UTF8&qid=1524410190&sr=1-1','
Width :18 inches<br><br>
Length : 38 inches<br><br>
Pattern : Striped<br><br>
Color : Gray w/ White Stripes<br><br>
Material : Cotton<br><br>','image/amazon/handmade/','handmade9.jpg');



INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Data Structures and Algorithm Analysis in Java (2nd Edition), Weiss, Mark A., Go','eBay','Books','595','https://www.ebay.com/itm/Data-Structures-and-Algorithm-Analysis-in-Java-2nd-Edition-Weiss-Mark-A-Go/292460936422?epid=46589575&hash=item441807bce6:g:VR4AAOSwbkJZdhlT','
Condition :	Good <br><br>
Edition Number : 2<br><br>
Language : English <br><br>
Publication Year : 2006<br><br>
Format:	Hardcover<br><br>
ISBN: 9780321370136<br><br>
EAN:9780321370136<br><br>','image/eBay/book/','textbook1.jpg');



INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Essential Statistics by D. G. Rees (1995, Paperback, New Edition)','eBay','Books','340','https://www.ebay.com/p/Essential-Statistics-by-D-G-Rees-1995-Paperback-New-Edition/1532722?iid=142742772531','
Condition:	Good <br><br>
Edition Number:	3 <br><br>
Author:	D. G. Rees<br><br>
Publication Year: 1995<br><br>
Publisher: CRC Press LLC<br><br>
Language: English <br><br>
Weight:	0.91 lbs<br><br>
Format:	Paperback<br><br>
Product Group: Book<br><br>
Binding: Paperback	<br><br>
IsTextBook:	Yes<br><br>
ISBN:9780412612800<br><br>
EAN:9780412612800<br><br>','image/eBay/book/','textbook2.jpg');


INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Physical Inorganic Chemistry: Reactions, Processes, and Applications, , New Book','eBay','Books','4505','https://www.ebay.com/itm/Physical-Inorganic-Chemistry-Reactions-Processes-and-Applications-New-Book/131841786018?epid=79680355&hash=item1eb26200a2:m:m1WAX7Dg00GBNMAdnEeHDPA','
Condition:Brand New<br><br>
Publication Year: 2010<br><br>
Format:	Hardcover<br><br>
Language: English<br><br>
ISBN:9780470224205<br><br>
EAN:9780470224205<br><br>','image/eBay/book/','textbook3.jpg');

INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('ENGLISH TEXT AND SKILLS BOOK 2 ** LAMING & PEARCE','eBay','Books','1785','https://www.ebay.com/itm/ENGLISH-TEXT-AND-SKILLS-BOOK-2-LAMING-PEARCE/172313568894?epid=95575084&hash=item281eb0667e:g:tuMAAOSwblZZFLbF','
Condition:	Good <br><br>
Format:	Paperback	<br><br>
Educational Level:	High School<br><br>
Language: English<br><br>
Publication Year: 2002<br><br>
Product Type: Textbook<br><br>
Special Attributes:	Illustrated<br><br>
Subject: English, Grammar<br><br>
ISBN:9780195515657<br><br>','image/eBay/book/','textbook4.jpg');



INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('The-Da-Vinci-Code-Dan-Brown-Athor-Of-Angels-amp-Demons','eBay','Books','1360','https://www.ebay.com/itm/The-Da-Vinci-Code-Dan-Brown-Athor-Of-Angels-Demons/252312468388?hash=item3abefebba4:g:ZioAAOSwv9hW3dVZ','
Condition:Good<br><br>
Language: English<br><br>
Format:	Paperback<br><br>','image/eBay/book/','fiction1.jpg');



INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('THE CONFESSOR BOOK NEW','eBay','Books','1190','https://www.ebay.com/itm/THE-CONFESSOR-BOOK-NEW/302426737642?epid=96106828&hash=item466a09cbea:g:NqEAAOSwhLJZnz3Z','
Condition:Brand New<br><br>
Format:	Paperback<br><br>
Language: English<br><br>
ISBN:9780141015873<br><br>
EAN:9780141015873<br><br>','image/eBay/book/','fiction2.jpg');

INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Agatha Christies And Then There Were None - 3 Episodes on 1 DVD','eBay','Books','1650','https://www.ebay.com/itm/Agatha-Christie-And-Then-There-Were-None-3-Episodes-on-1-DVD/2532416534
49?epid=1560545101&hash=item3af660f8c9:g:iCEAAOSw4DxaXkZ9','Condition:
Brand New<br><br>
Brand:RLJ/SPHE<br><br>
DVD: 1 (US, Canada)<br><br>
Format:	DVD<br><br>
Former Rental:	No<br><br>
Genre: Thriller & Mystery<br><br>
UPC:0054961246397<br><br>','image/eBay/book/','fiction3.jpg');




INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('THE GOD OF SMALL THINGS by ARUNDHATI ROY (ENGLISH) - BOOK','eBay','Books','1275','https://www.ebay.com/itm/THE-GOD-OF-SMALL-THINGS-by-ARUNDHATI-ROY-ENGLISH-BOOK/152729663453?epid=20006266837&hash=item238f65b7dd:g:hq4AAOSwnbZYFNLw','Condition:
Brand New<br><br>
Format:	Paperback<br><br>
Language: English	<br><br>
ISBN:Does not apply<br><br>','image/eBay/book/','fiction4.jpg');




INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Mothers by Maxim Gorky and Maksim Gorky Free Shipping','eBay','Books','1105','https://www.ebay.com/itm/Mothers-by-Maxim-Gorky-and-Maksim-Gorky-Free-Shipping/302281328212?epid=2845658&hash=item46615f0654:g:xUYAAOSwU8hY7llo','
Condition:Very Good <br><br>
Format:	paperback	<br><br>
Type: book<br><br>
Special Attributes:	Illustrated<br><br>
Country/Region of Manufacture:	United States<br><br>
ISBN:9785050005397<br><br>
EAN:9785050005397<br><br>','image/eBay/book/','fiction5.jpg');





INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('The Chalk Man by Tudor ~ New Thriller ~ Hardback, Read Once, Clean & Sanitary','eBay','Books','340','https://www.ebay.com/itm/The-Chalk-Man-by-Tudor-New-Thriller-Hardback-Read-Once-Clean-Sanitary/253547271666?epid=239705140&hash=item3b089855f2:g:TOwAAOSw3h1ZSevA','
Condition:Like New<br><br>
Publication Year: 2018<br><br>
Format:	Hardcover <br><br>
Language: English<br><br>
ISBN:9781524760984<br><br>','image/eBay/book/','fiction6.jpg');






INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Prophet: Shepherd Thriller Book 2','eBay','Books','770','https://www.ebay.com/itm/Prophet-Shepherd-Thriller-Book-2/302484274428?epid=143873746&hash=item466d77bcfc:g:tmAAAOSwQJlZ3fQ2','
Condition: Good <br><br>
Publication Year: 2012	<br><br>
Format:	Paperback<br><br>
Language: English<br><br>
ISBN:9781611880458<br><br>
EAN:9781611880458<br><br>','image/eBay/book/','fiction7.jpg');


INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Amazonia BOOK NEW','eBay','Books','1190','https://www.ebay.com/itm/Amazonia-BOOK-NEW/351987040355?epid=104181148&hash=item51f4100063:g:k5YAAOSwTuJYqz6U','
Condition:Brand New<br><br>
ISBN:9780752883847<br><br>
EAN:9780752883847<br><br>','image/eBay/book/','fiction8.jpg');


INSERT INTO buyzone.product (product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('NOTEBOOK HP G6 15.6"2CPU+2GPU RAM 4GB DDR4 /HD 500GB /VIDEO RADEON R2 WINDOWS 10','eBay','Electronics','18500','https://www.ebay.com/itm/NOTEBOOK-HP-G6-15-6-2CPU-2GPU-RAM-4GB-DDR4-HD-500GB-VIDEO-RADEON-R2-WINDOWS-10/302380505298?epid=25011369905&hash=item46674858d2:g:1Y0AAOSwvD5aR7Pl','Condition:New<br><br>
Marca: Hp<br><br>
Memoria (RAM): 4GB<br><br>
Modello processore:	AMD E-Series<br><br>
Tipo: Laptop<br><br>
Scheda grafica:	Integrata	Lettore e/o <br><br>
Masterizzatore:	DVD/ CD-RW Combo<br><br>
Sistema operativo: Windows 10 Dimensione <br><br>
Hard Disk:	500GB<br><br>
EAN:0191628128112<br><br>','image/eBay/electronics/','computer5.jpg');


INSERT INTO buyzone.product (product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('NEW! LENOVO 15.6” Laptop Intel 2.40GHz 4GB 1TB DVD+RW WebCam HDMI USB Windows 10','eBay','Electronics','28500','https://www.ebay.com/itm/NEW-LENOVO-15-6-Laptop-Intel-2-40GHz-4GB-1TB-DVD-RW-WebCam-HDMI-USB-Windows-10/122487854159?hash=item1c84d8544f:m:mvX0ccp48NzjIia4vN8JhNw','
Condition :New <br><br>
Type: Notebook/Laptop<br><br>
Processor Type:	Intel Celeron<br><br>
Screen Size: 15.6in<br><br>
Operating System: Windows 10 <br><br>
Memory:	4GB<br><br>
Hardware Connectivity:HDMI, USB 2.0, USB 3.0<br><br>
Hard Drive Capacity: 1TB<br><br>
Features: Built-in Webcam<br><br>
Processor Speed: 2.40GHz<br><br>
Storage Type: HDD (Hard Disk Drive)<br><br>
Release Year: 2017<br><br>
Optical Drive: DVD-RW<br><br>
Brand:Lenovo<br><br>','image/eBay/electronics/','computer6.jpg');


INSERT INTO buyzone.product (product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('DELL LAPTOP WINDOWS 10 PC Core i5 2.4Ghz 4GB RAM WiFi DVDRW NOTEBOOK 250GB HD','eBay','Electronics','17000','https://www.ebay.com/itm/DELL-LAPTOP-WINDOWS-10-PC-Core-i5-2-4Ghz-4GB-RAM-WiFi-DVDRW-NOTEBOOK-250GB-HD/332596511179?epid=1361660510&hash=item4d704c01cb:g:2TEAAOSwEHhatbgT','
Condition:	Manufacturer refurbished <br><br>
Type: Latitude Notebook<br><br>
Memory:	4GB<br><br>
Brand:Dell<br><br>
Hard Drive Capacity: 250GB<br><br>
Product Line: Latitude<br><br>
Optical Drive: DVD-RW<br><br>
Model: E Series with i5 Processor<br><br>
Options: USB, ESata, Display Port+VGA, Wifi, SD Card Reader<br><br>
Storage Type:	HDD (Hard Disk Drive)<br><br>
Processor Type:	Intel Core i5<br><br>
Hardware Connectivity:	VGA out, eSATA, Wireless WiFi, DisplayPort, USB 2.0, SD Card Slot<br><br>
Processor Speed: 2.4GHz	<br><br>
UPC:680596409014<br><br>','image/eBay/electronics/','computer7.jpg');




INSERT INTO buyzone.product (product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('USB 2.4GHZ Wireless Slim Keyboard For PC Laptop and Cordless Mouse Combo Kit Set','eBay','Electronics','2000','link:https://www.ebay.com/itm/USB-2-4GHZ-Wireless-Slim-Keyboard-For-PC-Laptop-and-Cordless-Mouse-Combo-Kit-Set/253095125127?hash=item3aeda52087:m:mCfuLbt30KqZljt73r7iOhg','
Condition:New <br><br>
MPN:Does not apply<br><br>
Brand:Unbranded<br><br>
Connectivity: Wireless<br><br>
Country/Region of Manufacture:China<br><br>','image/eBay/electronics/','computer8.jpg');




INSERT INTO buyzone.product (product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('HP Laptop Computer 15.6" LED Intel Pentium 2.66GHz 4GB 500GB DVD+RW WiFi WebCam','eBay','Electronics','22100','https://www.ebay.com/itm/HP-Laptop-Computer-15-6-LED-Intel-Pentium-2-66GHz-4GB-500GB-DVD-RW-WiFi-WebCam-/121771901698','
Condition: Manufacturer refurbished<br><br>
Type: Notebook<br><br>
Memory:	4GB<br><br>
Brand:HP<br><br>
Hard Drive Capacity: 500GB<br><br>
MPN:Does Not Apply<br><br>
Color:Red<br><br>
Operating System: Windows 10<br><br>
Product Line: Pavilion<br><br>
Screen Size: 15.6" <br><br>
Model:F<br><br>
Processor Type:	Intel Pentium<br><br>
Hardware Connectivity:	HDMI, USB 2.0, USB 3.0<br><br>
Processor Speed: 2.16GHz - 2.66GHz<br><br>
','image/eBay/electronics/','computer4.jpg');


INSERT INTO buyzone.product (product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('PC DESKTOP PC COMPUTER FISSO HD 1TB / RAM 16GB WINDOWS 10 CPU INTEL QUADCORE','eBay','Electronics','31450','https://www.ebay.com/itm/PC-DESKTOP-PC-COMPUTER-FISSO-HD-1TB-RAM-16GB-WINDOWS-10-CPU-INTEL-QUADCORE/281284000821?_trkparms=aid%3D111001%26algo%3DREC.SEED%26ao%3D1%26asc%3D20131017132637%26meid%3Dfb3a39e0b08c4aed9a34d7d8d26418c0%26pid%3D100033%26rk%3D2%26rkt%3D2%26mehot%3Dpp%26sd%3D322715834775%26itm%3D281284000821&_trksid=p2045573.c100033.m2042','
Condition:New<br><br>
Modello processore:	J1900 Dimensione <br><br>
Hard Disk: 1TB<br><br>
Velocità processore: 2.00GHz<br><br>
MPN:KEYDO-1000-16<br><br>
Scheda grafica:	Integrata <br><br>
Sistema operativo: Windows 10<br><br>
Colore principale: Rosso <br><br>
Versione sistema operativo:	Professional<br><br>
Lettore e/o Masterizzatore:	DVD-ROM/CD-RW <br><br>
Combo Memoria RAM: 16GB<br><br>
EAN:638097491267<br><br>','image/eBay/electronics/','computer3.jpg');


INSERT INTO buyzone.product (product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Apple iMac Core 2 Duo 2.26GHz 20-Inch A1224 Desktop All In One Computer','eBay','Electronics','15300','https://www.ebay.com/itm/Apple-iMac-Core-2-Duo-2-26GHz-20-Inch-A1224-Desktop-All-In-One-Computer/162961373998?epid=17012607960&hash=item25f1413b2e:g:OUYAAOSwY3RatVOC','
Condition:
Seller refurbished<br><br>
Brand:Apple<br><br>
MPN:A1224<br><br>
UPC:Does not apply<br><br>
CPU: Core 2 Duo 2.26GHz<br><br>
Memory: 1GB<br><br>
HDD: 160 GB HDD<br><br>
Video Card: NVIDIA GeForce GT 130 (256MB)<br><br>
Optical: DVD-R/CD-RW<br><br>
Operating System: MACOS EL CAPITAN 10.11.5<br><br>
Other: No Keyboard or Mouse
Best Offers Welcome<br><br>','image/eBay/electronics/','computer2.jpg');


INSERT INTO buyzone.product (product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('computer fisso all in one apple imac a1195 core2duo lion desktop pc ricondiziona','eBay','Electronics','15470','https://www.ebay.com/itm/computer-fisso-all-in-one-apple-imac-a1195-core2duo-lion-desktop-pc-ricondiziona/322715834775?epid=28006335785&hash=item4b235cd997:g:UyIAAOSwMEBaxc2v','Condition:
Seller refurbished<br><br>
Marca:	apple<br><br>
Memoria (RAM) : 2 GB<br><br>
Dimensione Hard Disk: 160 GB<br><br>
Modello processore:	Dual Core <br><br>
MPN:MA710LL<br><br>
Lettore e/o Masterizzatore: Combo DVD-ROM / CD-RW <br><br>
EAN:0683728221782<br><br>','image/eBay/electronics/','computer1.jpg');



INSERT INTO buyzone.product (product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Samsung Galaxy S7 Edge G935P c(Unlocked) GSM Smartphone Cell Phone T-Mobile AT&T','eBay','Electronics','15300','https://www.ebay.com/itm/Samsung-Galaxy-S7-Edge-G935P-c-Unlocked-GSM-Smartphone-Cell-Phone-T-Mobile-AT-T/401429417346?hash=item5d770ecd82:m:mlSqfTlMKQ6Giw-UnyQSkJg','
Condition:	Seller refurbished <br><br>
Brand:Samsung<br><br>
Style:	Bar<br><br>
Model:Galaxy S7 Edge G935<br><br>
Features: 3G Data Capable, 4G Data Capable, Bluetooth Enabled, Global Ready, GPS, Internet Browser, Music Player, Near Field Communication, Speakerphone, Touchscreen, TTY Compatible, Voice-Activated Dialing, Wi-Fi Capable<br><br>
MPN:SM-G935<br><br>
Camera Resolution: 12.8.MP<br><br>
Network: Unlocked <br><br>
Lock Status: unlocked<br><br>
Operating System: Android<br><br>
Cellular Band: unlocked<br><br>
Storage Capacity:32GB<br><br>','image/eBay/electronics/','mobile1.jpg');


INSERT INTO buyzone.product (product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('SERVO V9500 4SIM Cards Dual Camera 2.8 Inch Flashlight Mp3 GPRS FM Mobile Phone','eBay','Electronics','1699','https://www.ebay.com/itm/SERVO-V9500-4SIM-Cards-Dual-Camera-2-8-Inch-Flashlight-Mp3-GPRS-FM-Mobile-Phone/132390256346?hash=item1ed312feda:m:mL8KdvppD-qugeAJshEg2Tw','
Condition:New<br><br>
Contract: Without Contract<br><br>
MPN:Does Not Apply<br><br>
Fast Fulfillment: YES<br><br>
Model:V9500<br><br>
Lock Status: Factory Unlocked<br><br>
Features: Dual SIM, Global Ready<br><br>
Style: Bar<br><br>
Country/Region of Manufacture:	China<br><br>
Screen Size: 2.8"<br><br>
Colour:	White,Blue,Black,Gold	<br><br>
RAM: <128m<br><br>
Cellular Band:	GSM 850/900/1800/1900MHz	<br><br>
','image/eBay/electronics/','mobile2.jpg');


INSERT INTO buyzone.product (product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('LG V10 H900 64GB 5.7" GSM Unlocked AT&T T-Mobile 4G LTE Smartphone','eBay','Electronics','10199','https://www.ebay.com/itm/LG-V10-H900-64GB-5-7-GSM-Unlocked-AT-T-T-Mobile-4G-LTE-Smartphone/282839630351?hash=item41da8e420f:m:mZJLO3nhoJxipnEvHFSZ4zQ','
Condition: Seller refurbished <br><br>
Brand:LG<br><br>
Operating System: ANDROID<br><br>
Model:V10<br><br>
Storage Capacity: 64GB<br><br>
MPN:LGH900A<br><br>
Features: Wi-Fi Capable, Touchscreen, Speakerphone, Music Player, Internet Browser, Bluetooth Enabled, 4G Data Capable<br><br>
Network: UNLOCKED<br><br>
Screen Size: 5.7<br><br>
Contract: Without Contract<br><br>
RAM: 4GB<br><br>','image/eBay/electronics/','mobile3.jpg');



INSERT INTO buyzone.product (product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Samsung Galaxy S7 G930 32GB Verizon AT&T T-Mobile GSM Unlocked G930V Smartphone','eBay','Electronics','14875','https://www.ebay.com/itm/Samsung-Galaxy-S7-G930-32GB-Verizon-AT-T-T-Mobile-GSM-Unlocked-G930V-Smartphone/132054671038?hash=item1ebf125ebe:m:mRkgseDAw79NjyAfs6S3rSA','
Condition: Seller refurbished <br><br>
Brand:Samsung<br><br>
Features: 3G Data Capable, 4G Data Capable, Bluetooth Enabled, GPS, Internet Browser, Music Player, Speakerphone, Touchscreen, Wi-Fi Capable<br><br>
Model:Galaxy S7<br><br>
Bundled Items: Adaptor, Cable<br><br>
Network: Verizon Unlocked<br><br>
MPN:Does Not Apply<br><br>
Contract: Without Contract<br><br>
Camera Resolution: 12.0MP<br><br>
Operating System: Android<br><br>
Screen Size: 5.1"<br><br>
Storage Capacity: 32GB	<br><br>
Processor: Quad Core<br><br>','image/eBay/electronics/','mobile4.jpg');


INSERT INTO buyzone.product (product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Xiaomi Redmi Note 4 Snapdragon 625 4G Mobile Phone 32GB International Version','eBay','Electronics','17075','https://www.ebay.com/itm/Xiaomi-Redmi-Note-4-Snapdragon-625-4G-Mobile-Phone-32GB-International-Version/152459348681?hash=item237f490ac9:m:mJ21hWw5DwAjhysbV3PIeqA','
Condition:
New<br><br>
Brand:Xiaomi<br><br>
Storage Capacity:	32GB<br><br>
Model:Redmi note 4<br><br>
Battery Capacity (mAh):	4100mAh <br><br>
Features: 4G Data Capable, Accelerometer, Bluetooth Enabled, Camera, Dual SIM, Fingerprint Sensor, Wi-Fi Capable, 3G Data Capable, Gyroscope, Infrared, MP3, MP4, OTA	External Memory:	TF card up to 128GB (not included)
SIM Card Type:	Micro SIM Card + Nano<br><br>
Sensor:	Ambient Light/Gravity/Proximity Sensor<br><br>
Network type:	GSM+CDMA+WCDMA+TD-SCDMA+FDD-LTE+TD-LTE<br><br>
Operating System: Android 6.0 ( MIUI 8.1 )<br><br>
Camera Resolution: 13.0MP rear + 5.0MP front	<br><br>
RAM: 3GB<br><br>
Wireless Connectivity:	3G,4G,Bluetooth,GPS,GSM,LTE,WiFi<br><br>
Lock Status: Unlocked<br><br>
Country/Region of Manufacture:	CHINA<br><br>
','image/eBay/electronics/','mobile5.jpg');


INSERT INTO buyzone.product (product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('
Shockproof Hybrid Armor 360° Protective Case Cover For Xiaomi Redmi Mobiles','eBay','Electronics','150','https://www.ebay.com/itm/Shockproof-Hybrid-Armor-360-Protective-Case-Cover-For-Xiaomi-Redmi-Mobiles/112878095889?hash=item1a480f0e11:m:mRySo-Oyq1_1QJ4u3AE6vpw','Condition:New<br><br>
Brand:Unbranded/Generic<br><br>
Features:2 in1 Protection, Hybrid, Shockproof Compatible<br><br> Brand:	For XiaoMi<br><br>
Material:Silicone/Gel/Rubber+Hard PC<br><br>
Compatible Model: For Xiaomi Mi 5X, For Xiaomi Mi 6/6 Plus, For Xiaomi Mi A1, For Xiaomi Mi Max 2, For Xiaomi Red Note 5A, For Xiaomi Redmi 4/4A, For Xiaomi Redmi 4X, For Xiaomi Redmi 5, For Xiaomi Redmi 5 Plus, For Xiaomi Redmi 5A, For Xiaomi Redmi Note 4/4X, For Xiaomi Redmi Note 5 Pro<br><br>
Design/Finish: Hybrid, Matte, Plain, Protective<br><br>
Type: Fitted Case/Skin<br><br>','image/eBay/electronics/','mobile6.jpg');


INSERT INTO buyzone.product (product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('2A USB Wall Charger Universal Home Travel Power Adapter Fast Charging EU/US Plug','eBay','Electronics','100','https://www.ebay.com/itm/2A-USB-Wall-Charger-Universal-Home-Travel-Power-Adapter-Fast-Charging-EU-US-Plug/292441468436?hash=item4416deae14:m:mDhNMEpQoz77U4FomFBQqQw','
Condition:New<br><br>
Brand:Unbranded<br><br>
UPC:Does not apply<br><br>
MPN:Does not apply<br><br>
EAN:Does not apply<br><br>','image/eBay/electronics/','mobile7.jpg');


INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Mens blue denim jacket. Retro. Kam cloathing company. Never worn','eBay','clothing-shoes-jewelry','4245','https://www.ebay.com/itm/Mens-blue-denim-jacket-Retro-Kam-cloathing-company-Never-worn/252984369769?hash=item3ae70b2269:g:dG0AAOSwstJZPCZi','
Condition:New<br><br>
Note : New without tags: A brand-new, unused, and unworn item (including handmade items) that is not in original packaging or may be missing original packaging materials (such as the original box or bag). The original tags may not be attached<br><br>
Brand:Kam<br><br>
Material: Denim	Chest <br><br>
Size: 44<br><br>
Main Colour: Blue<br><br>','image/eBay/clothing-shoes-jewelry/','cloth1.jpg');



INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('AC/DC Back in Black 3/4 Length Sleeve Raglan Baseball Shirt - NEW & OFFICIAL!','eBay','clothing-shoes-jewelry','2125','https://www.ebay.com/itm/AC-DC-Back-in-Black-3-4-Length-Sleeve-Raglan-Baseball-Shirt-NEW-OFFICIAL/122915214621?hash=item1c9e51551d:m:m-6tKBjWfBHTX4BdIr1H9pQ','
Condition:
New with tags<br><br>
Brand:100% Official Merchandise<br><br>
Neckline: Crew Neck	<br><br>
Design:	Graphic<br><br>
Sleeve Type: Raglan 3/4 Length Sleeve<br><br>
Main Colour: Grey<br><br>
Garment Care: Machine Washable<br><br>
Material: Cotton<br><br>
Exact Colour: Black And Grey Garment<br><br>
Fit: Regular<br><br>','image/eBay/clothing-shoes-jewelry/','cloth2.jpg');



INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('New Super Absorbent Car Wash Microfiber Towel Car Cleaning Drying Cloth Hemming','eBay','clothing-shoes-jewelry','425','https://www.ebay.com/itm/New-Super-Absorbent-Car-Wash-Microfiber-Towel-Car-Cleaning-Drying-Cloth-Hemming/372253338812?hash=item56ac072cbc:m:mYsXDL2R55VbfZ2qtFBx8hA','
Brand:Unbranded<br><br>
Form:	Dry Cloth<br><br>
MPN:Does not apply<br><br>
Fragrance:	Fragrance Free<br><br>
Bundle Listing:	No<br><br>
Unit Quantity:	1PC<br><br>
Country/Region of Manufacture:	China<br><br>
Featured Refinements:	Microfiber Cloth<br><br>
Type of Cleaner: All-Purpose Cleaner<br><br>
Main Colour: Multi<br><br>','image/eBay/clothing-shoes-jewelry/','cloth3.jpg');



INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('
Indian-Panjabi-dress','eBay','clothing-shoes-jewelry','1275','https://www.ebay.com/itm/Indian-Panjabi-dress/122792571653?hash=item1c9701f305:g:ThAAAOSwO7hZ~ldu','Condition:
Pre-owned<br><br>
','image/eBay/clothing-shoes-jewelry/','cloth4.jpg');


INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('
New Collection panjabi suit patiyala party wear new salwar suit with Dupatta','eBay','clothing-shoes-jewelry','8755','https://www.ebay.com/itm/New-Collection-panjabi-suit-patiyala-party-wear-new-salwar-suit-with-Dupatta/263464853198?hash=item3d57ba9ece:g:6HsAAOSwL9pabtOs','Condition:
New with tags<br><br>
Gender:	Women<br><br>
Color:Beige<br><br>
Size: Unstitched<br><br>
Material: Santoon, Georgette, Chiffon, Khadi Silk<br><br>
Brand:Shoppingover<br><br>
Country/Region of Manufacture:	India<br><br>
Style: Salwar Kameez<br><br>
Pattern: Embroidered<br><br>
','image/eBay/clothing-shoes-jewelry/','cloth5.jpg');



INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('

Indian-Pakistan-Bangladesh-Eid-Special-Men-Kurt-Panjabi','eBay','clothing-shoes-jewelry','3400','https://www.ebay.com/itm/Indian-Pakistan-Bangladesh-Eid-Special-Men-Kurt-Panjabi/263471931123?hash=item3d58269ef3:g:vqgAAOSw~XpZPMeV','
Condition:New with tags<br><br>
Style: Kurtas/Kurti<br><br>
Size: 40 <br><br>
Color:White<br><br>
Gender:	Men<br><br>','image/eBay/clothing-shoes-jewelry/','cloth6.jpg');



INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('
Dhaka-Jamdani-half-silk-saree-sharee','eBay','clothing-shoes-jewelry','7225','https://www.ebay.com/itm/Dhaka-Jamdani-half-silk-saree-sharee/272983235576?hash=item3f8f119bf8:g:V-0AAOSwjyhaArgN','
Condition:New without tags<br><br>
Color:Multi-Color<br><br>
Gender: Women<br><br>
UPC:Does not apply<br><br>
Other: Made in Bangladesh, No blouse<br><br>','image/eBay/clothing-shoes-jewelry/','cloth7.jpg');


INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('
Dhaka Katan saree, sharee','eBay','clothing-shoes-jewelry','3825','https://www.ebay.com/itm/Dhaka-Katan-saree-sharee/272920388480?hash=item3f8b52a380:g:BMIAAOSwX3FaArrU','Condition:
New without tags<br><br>
Gender: Women<br><br>
Color:Purple<br><br>
UPC:Does not apply<br><br>
Other : Made in Bangladesh.No blouse<br><br>','image/eBay/clothing-shoes-jewelry/','cloth8.jpg');



INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('New VAN Classic OLD SKOOL Low / High Top Suede Casual Canvas sneakers SK8 Shoes','eBay','clothing-shoes-jewelry','550','https://www.ebay.com/itm/New-VAN-Classic-OLD-SKOOL-Low-High-Top-Suede-Casual-Canvas-sneakers-SK8-Shoes/282761512295?hash=item41d5e64567:m:m4jpEHaigvr2ipFoM6M3qiA','
Condition: New without box<br><br>
Shoe Size: EUR:36-EUR:44<br><br>
Style: Trainers<br><br>
Brand:VANS<br><br>
Upper Material:	Canvas<br><br>','image/eBay/clothing-shoes-jewelry/','shoe1.jpg');


INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('
Fashion-Men-039-s-Winter-Leather-Casual-Shoes-Breathable-Antiskid-Loafers-Moccasins','eBay','clothing-shoes-jewelry','1785','https://www.ebay.com/itm/Fashion-Mens-Winter-Leather-Casual-Shoes-Breathable-Antiskid-Loafers-Moccasins/352226953444?hash=item52025cc8e4:m:m8XX3JCA2iBdnVfckj0sAFA','
Condition:New without box<br><br>
MPN:HUI828824<br><br>
US Shoe Size (Mens):	6.5-13<br><br>
Pattern: Solid<br><br>
Style: Casual Shoes<br><br>
Euro Size: 39-48<br><br>
Brand:Unbranded<br><br>
Material: Microfiber Leather<br><br>','image/eBay/clothing-shoes-jewelry/','shoe2.jpg');


INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Nike MD Runner 2 Freizeit Sneaker Freizeitschuhe Lifestyleschuhe Schuhe Shoes','eBay','clothing-shoes-jewelry','4250','https://www.ebay.com/itm/Nike-MD-Runner-2-Freizeit-Sneaker-Freizeitschuhe-Lifestyleschuhe-Schuhe-Shoes/401496943532?hash=item5d7b152bac:m:moWj_Cwm9gWdjTNBFqKHrhg','
Condition:New with box<br><br>
Marke: Nike<br><br>
Schuhgröße:	Bitte wählen Sie oben<br><br>','image/eBay/clothing-shoes-jewelry/','shoe3.jpg');



INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Mens Business Dress Leather Shoes Slip On Work Dress Oxfords Casual Loafers','eBay','clothing-shoes-jewelry','1275','https://www.ebay.com/itm/Mens-Business-Dress-Leather-Shoes-Slip-On-Work-Dress-Oxfords-Casual-Loafers/401385301307?_trkparms=aid%3D222007%26algo%3DSIM.MBE%26ao%3D2%26asc%3D50999%26meid%3D3b86a4a4a85b4c2a8dc4f6df574d77c7%26pid%3D100005%26rk%3D6%26rkt%3D12%26mehot%3Dpp%26sd%3D262773097207%26itm%3D401385301307&_trksid=p2047675.c100005.m1851','
Condition:New without box<br><br>
Brand:Unbranded<br><br>
Style: Loafers & Slip Ons	<br><br>
MPN:REN196805<br><br>
Material: Leather <br><br>
US Shoe Size (Mens): 7.5-9<br><br>
Pattern: Solid<br><br>
Width: Medium (D, M)<br><br>','image/eBay/clothing-shoes-jewelry/','shoe4.jpg');



INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('
Womens-Marks-and-Spencer-Autogragh-Taupe-Shoe-Boot-size-6-wider-fit','eBay','clothing-shoes-jewelry','1275','https://www.ebay.com/itm/Womens-Marks-and-Spencer-Autogragh-Taupe-Shoe-Boot-size-6-wider-fit/263594532109?hash=item3d5f755d0d:g:fQUAAOSw9ZdXKc~4','
Condition:Pre-owned<br><br>
Brand:Marks and Spencer<br><br>
Style: Shoe Boot	Shoe <br><br>
Size: UK 6<br><br>
Pattern: Circles	<br><br>
Upper Material:	Faux Suede<br><br>
Heel Height: High Heel (3-4.5 in.)	<br><br>
Heel Type: Slim<br><br>
Exact Heel Height:	Approx. 4.5 inches	<br><br>
Main Colour: Taupe<br><br>
Sole: Synthetic<br><br>','image/eBay/clothing-shoes-jewelry/','shoe5.jpg');


INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('NEW Classified Womens Frank WEDDING Party Glitter Rhinestone Peep Toe Heels Shoe','eBay','clothing-shoes-jewelry','1700','https://www.ebay.com/itm/NEW-Classified-Womens-Frank-WEDDING-Party-Glitter-Rhinestone-Peep-Toe-Heels-Shoe/201566391312?hash=item2eee4b0c10:m:m9UYn_62q2M0hdrRNtHw2og','Item specifics
Condition:New without box<br><br>
Designer/Brand:	Classified<br><br>
Country/Region of Manufacture:	Unknown<br><br>
Material: Glitter Rhinestone<br><br>
Occasion: Wedding, Pageant, Party, Prom, Dress, Formal<br><br>','image/eBay/clothing-shoes-jewelry/','shoe6.jpg');




INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Fashion Charm Jewelry Pendant Chain Pearl Choker Chunky Statement Bib Necklace','eBay','clothing-shoes-jewelry','85','https://www.ebay.com/itm/Fashion-Charm-Jewelry-Pendant-Chain-Pearl-Choker-Chunky-Statement-Bib-Necklace/332183910210?epid=1052853354&hash=item4d57b43742:g:vcAAAOSw03lY8biS','
Length (inches): about 21"	<br><br>
Style: Charm Chain Necklace Pendant<br><br>
Material: Alloy + Pearl	<br><br>
Theme: Beauty & Fashion Gift<br><br>
Country/Region of Manufacture:	China	<br><br>
Metal:	Alloy<br><br>
Metal Purity:	Unknown<br><br>
Main Stone:	Pearl<br><br>
Pearl Diameter:	8mm<br><br>
Color:Silver<br><br>
UPC:Does not apply<br><br>','image/eBay/clothing-shoes-jewelry/','jewelry1.jpg');


INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('10MM 24" Men 18k Yellow Gold Plated Cuban Chain Necklace Mens Jewelry Hip-Hop','eBay','clothing-shoes-jewelry','535','https://www.ebay.com/itm/10MM-24-Men-18k-Yellow-Gold-Plated-Cuban-Chain-Necklace-Mens-Jewelry-Hip-Hop/152818336587?epid=21015723376&hash=item2394aec34b:g:L7QAAOSwywRaMI4i','
Condition:New with tags<br><br>
Locket Type: Snake Chain<br><br>
Main Stone Treatment: Does not apply	<br><br>
Length (inches): 24<br><br>
Type: Chain<br><br>
Color:Gold<br><br>
Jewelry Type: Necklace<br><br>
Material: 18k Gold Plated<br><br>
Chain Style:Snake<br><br>
Gender:	Female<br><br>
Style: Chain	<br><br>
Metal: Brass<br><br>
Theme: Beauty<br><br>
Country/Region of Manufacture: China<br><br>
','image/eBay/clothing-shoes-jewelry/','jewelry2.jpg');


INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('Comfort Fit Micro Pave Real.7ct Diamonds 10K White Gold Fine Jewelry Ring 6.5#','eBay','clothing-shoes-jewelry','50575','https://www.ebay.com/itm/Comfort-Fit-Micro-Pave-Real-7ct-Diamonds-10K-White-Gold-Fine-Jewelry-Ring-6-5/173268899087?hash=item2857a1950f:g:NJgAAOSw90xauSxj','Style:	Solitaire with Accents<br><br>
Total Carat Weight (TCW):	0.7ct<br><br>
Metal: White Gold<br><br>
Metal Purity: 10k<br><br>
Clarity: SI-SI3<br><br>
Main Stone Shape: Round Single Cut<br><br>
Cut: Very Good<br><br>
Natural/Lab-Created: Natural<br><br>
Ring Size: 6.5<br><br>
Country/Region of Manufacture: China<br><br>
Sizable: Yes<br><br>
Gender:	Mens<br><br>','image/eBay/clothing-shoes-jewelry/','jewelry3.jpg');





INSERT INTO
buyzone.product(product_name,product_provider,product_type,product_price,product_link,product_details,product_image_source,product_image_name)
VALUES('
Pave.32ct Diamond 10K White Gold Semi Mount 6mm Round Engagement Wedding Ring','eBay','clothing-shoes-jewelry','51000','https://www.ebay.ca/itm/183177071024','Condition:New without tags<br><br>
Style: Solitaire with Accents<br><br>
Diamond Color:	H<br><br>
Metal: White Gold<br><br>
Clarity: SI-SI3<br><br>
Metal Purity: 10k<br><br>
Cut: Good <br><br>
Main Stone Shape: Round<br><br>
Brand: Unbranded<br><br>
Ring Size: 6.5<br><br>
Country/Region of Manufacture:	China<br><br>
Sizable: Yes<br><br>
Main Stone Size: 6mm<br><br>
Stone Shape: Round<br><br>','image/eBay/clothing-shoes-jewelry/','jewelry4.jpg');
