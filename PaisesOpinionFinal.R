#Lapop 2019 - Peru

#eliminando las columnas que no necesito
#columna que necesito: 129
DataPeru2019 <- Peru_LAPOP_AmericasBarometer_2019_v1_0_W



DataPeru2019[3,129]
names(DataPeru2019)[names(DataPeru2019)=='vb50']='Peru2019'
DataPeru2019[,c(1:128)] = NULL
DataPeru2019[,c(2:101)] = NULL



#para DataPeru12 LAPOP

DataPeru12 <- X1347834535Peru_LAPOP_AmericasBarometer_2012_Rev1_W
# fila , columna 
#ver columna que necesito
DataPeru12[3,195]
names(DataPeru12)[names(DataPeru12)=='vb50']='Peru2012'
#eliminando 
DataPeru12[,c(1:194)] = NULL
DataPeru12[,c(2:107)] = NULL



#DataPeru2019
id19 <- rownames(DataPeru2019)
Per19 <- cbind(id=id19, DataPeru2019)


#DataPeru12
id12 <- rownames(DataPeru12)
Per12 <- cbind(id=id12, DataPeru12)


Per1219=merge(Per12,Per19, by.x = 'id', by.y = 'id', all = T)




#Trayendo la Data Peru 2008 LAPOP
DataPeru08 <- X341893243peru_lapop_dims_2008_final_data_set_v10

DataPeru08$vb50
names(DataPeru08)[names(DataPeru08)=='vb50']='Peru2008'
DataPeru08[3,183]
DataPeru08[,c(1:182)] = NULL
DataPeru08[,c(2:72)] = NULL

#DataPeru08
id08 <- rownames(DataPeru08)
Per08 <- cbind(id=id08, DataPeru08)


#merge tres años
Per081219=merge(Per08,Per1219, by.x = 'id', by.y = 'id', all = T)





#Peru 2001 EMV

DataPeru2001 <- WV4_Data_Peru_2001_Spss_v20180912

DataPeru2001$Peru2001
names(DataPeru2001)[names(DataPeru2001)=='V118']='Peru2001'

DataPeru2001[3,146]
DataPeru2001[,c(1:145)] = NULL
DataPeru2001[,c(2:293)] = NULL


id01 <- rownames(DataPeru2001)
Per01 <- cbind(id=id01, DataPeru2001)


#merge 4 años
Per01081219=merge(Per01,Per081219, by.x = 'id', by.y = 'id', all = T)


##Dicotomizar 1y2(de acuerdo) sera 1
#3y4(en desacuerdo) sera 0

library(rio)

Per01081219[,c(2:5)]= replace(Per01081219[,c(2:5)], 
                              Per01081219[,c(2:5)] == 2,1)

Per01081219[,c(2:5)]= replace(Per01081219[,c(2:5)], 
                              Per01081219[,c(2:5)] == 3,0)

Per01081219[,c(2:5)]= replace(Per01081219[,c(2:5)], 
                              Per01081219[,c(2:5)] == 4,0)


library(haven)
library(labelled)
library(dplyr)



#Data Chile
#2019 lapop
DataChile2019 <- Chile_LAPOP_AmericasBarometer_2019_v1_0_W


names(DataChile2019)[names(DataChile2019)=='vb50']='Chile2019'

DataChile2019$Chile2019
DataChile2019[,c(120)]

DataChile2019[,c(1:119)] = NULL
DataChile2019[,c(2:129)] = NULL

#DataChile2019
idchi19 <- rownames(DataChile2019)
Chi19 <- cbind(id=idchi19, DataChile2019)


#DataChile2014
DataChile2014 <- X553131127Chile_LAPOP_AmericasBarometer_2014_v3_0_W 


names(DataChile2014)[names(DataChile2014)=='vb50']='Chile2014'
DataChile2014[,c(168)]


DataChile2014[,c(1:167)] = NULL
DataChile2014[,c(2:71)] = NULL

#2014 lapop
idchi14 <- rownames(DataChile2014)
Chi14 <- cbind(id=idchi14, DataChile2014)




Chi1419=merge(Chi14,Chi19, by.x = 'id', by.y = 'id', all = T)



#2000
DataChile2000 <- WV4_Data_Chile_2000_Stata_v20180912



names(DataChile2000)[names(DataChile2000)=='V118']='Chile2000'
DataChile2000$Chile2000


DataChile2000[59,146]
DataChile2000[,c(1:145)] = NULL
DataChile2000[,c(2:293)] = NULL


idchi00 <- rownames(DataChile2000)
Chi00 <- cbind(id=idchi00, DataChile2000)




#cambio el -1 por NA
Chi00[,c(2)]= replace(Chi00[,c(2)], 
                      Chi00[,c(2)] == -1,NA)

#Merge de 3 datas
Chi001419=merge(Chi00,Chi1419, by.x = 'id', by.y = 'id', all = T)




#2006

DataChile2006 <- WV5_Data_Chile_2006_Stata_v20180912




names(DataChile2006)[names(DataChile2006)=='V61']='Chile2006'
DataChile2006$Chile2006


DataChile2006[2,100]
DataChile2006[,c(1:99)] = NULL
DataChile2006[,c(2:315)] = NULL

idchi06 <- rownames(DataChile2006)
Chi06 <- cbind(id=idchi06, DataChile2006)




#cambio el -1 y -2 por NA
Chi06[,c(2)]= replace(Chi06[,c(2)], 
                      Chi06[,c(2)] == -1,NA)

Chi06[,c(2)]= replace(Chi06[,c(2)], 
                      Chi06[,c(2)] == -2,NA)


#Merge de 4 datas
Chi00061419=merge(Chi06,Chi001419, by.x = 'id', by.y = 'id', all = T)



##Dicotomizar 1y2(de acuerdo) sera 1
#3y4(en desacuerdo) sera 0

library(rio)

Chi00061419[,c(2:5)]= replace(Chi00061419[,c(2:5)], 
                              Chi00061419[,c(2:5)] == 2,1)

Chi00061419[,c(2:5)]= replace(Chi00061419[,c(2:5)], 
                              Chi00061419[,c(2:5)] == 3,0)

Chi00061419[,c(2:5)]= replace(Chi00061419[,c(2:5)], 
                              Chi00061419[,c(2:5)] == 4,0)


library(haven)
library(labelled)
library(dplyr)




##ARGENTINA

#DataArgentina2019
DataArgentina2019 <- Argentina_LAPOP_AmericasBarometer_2019_v1_0_W


names(DataArgentina2019)[names(DataArgentina2019)=='vb50']='Argentina2019'

DataArgentina2019$Argentina2019
DataArgentina2019[,c(119)]

DataArgentina2019[,c(1:118)] = NULL
DataArgentina2019[,c(2:97)] = NULL




idarg19 <- rownames(DataArgentina2019)
Arg19 <- cbind(id=idarg19, DataArgentina2019)


table(Arg19$Argentina2019)

##DataArgentina2012
DataArgentina2012 <- X1240357522Argentina_LAPOP_AmericasBarometer_2012_Rev1_W


names(DataArgentina2012)[names(DataArgentina2012)=='vb50']='Argentina2012'

DataArgentina2012$Argentina2012
str(DataArgentina2012$Argentina2012)

DataArgentina2012[2,206]
DataArgentina2012[,c(1:205)] = NULL
DataArgentina2012[,c(2:107)] = NULL




idarg12 <- rownames(DataArgentina2012)
Arg12 <- cbind(id=idarg12, DataArgentina2012)


table(Arg12$Argentina2012)


Arg1219=merge(Arg12,Arg19, by.x = 'id', by.y = 'id', all = T)



#Argentina2006

DataArgentina2006 <- WV5_Data_Argentina_2006_Spss_v20180912


DataArgentina2006$Argentina2006
names(DataArgentina2006)[names(DataArgentina2006)=='V61']='Argentina2006'
DataArgentina2006[3,100]
DataArgentina2006[,c(1:99)] = NULL
DataArgentina2006[,c(2:315)] = NULL


idarg06 <- rownames(DataArgentina2006)
Arg06 <- cbind(id=idarg06, DataArgentina2006)



Arg061219=merge(Arg06,Arg1219, by.x = 'id', by.y = 'id', all = T)




###BOLIVIA 
#Bolivia2019
DataBolivia2019 <- Bolivia_LAPOP_AmericasBarometer_2019_v1_0_W


DataBolivia2019$vb50
names(DataBolivia2019)[names(DataBolivia2019)=='vb50']='Bolivia2019'

DataBolivia2019[3,129]
DataBolivia2019[,c(1:128)] = NULL
DataBolivia2019[,c(2:135)] = NULL

idbol19 <- rownames(DataBolivia2019)
Bol19 <- cbind(id=idbol19, DataBolivia2019)



#Bolivia12
DataBolivia2012 <- X1852710534Bolivia_LAPOP_AmericasBarometer_2012_Rev1_W


DataBolivia2012$vb50
names(DataBolivia2012)[names(DataBolivia2012)=='vb50']='Bolivia2012'

DataBolivia2012[3,208]
DataBolivia2012[,c(1:207)] = NULL
DataBolivia2012[,c(2:95)] = NULL

idbol12 <- rownames(DataBolivia2012)
Bol12 <- cbind(id=idbol12, DataBolivia2012)



#merge 2 datas bolivia
Bol1219=merge(Bol12,Bol19, by.x = 'id', by.y = 'id', all = T)



#Bolivia 2008

DataBolivia2008 <-X714146726bolivia_lapop_dims_2008_v11


DataBolivia2008$vb50
names(DataBolivia2008)[names(DataBolivia2008)=='vb50']='Bolivia2008'

DataBolivia2008[3,176]
DataBolivia2008[,c(1:175)] = NULL
DataBolivia2008[,c(2:92)] = NULL

idbol08 <- rownames(DataBolivia2008)
Bol08 <- cbind(id=idbol08, DataBolivia2008)



#merge tres datas
Bol081219=merge(Bol08,Bol1219, by.x = 'id', by.y = 'id', all = T)



##Bolivia 

##COLOMBIA
#Colombia2019

DataColombia2018 <- Colombia_LAPOP_AmericasBarometer_2018_v1_0_W

DataColombia2018$vb50
names(DataColombia2018)[names(DataColombia2018)=='vb50']='Colombia2018'

DataColombia2018[3,244]
DataColombia2018[,c(1:243)] = NULL
DataColombia2018[,c(2:108)] = NULL

idcol18 <- rownames(DataColombia2018)
Col18 <- cbind(id=idcol18, DataColombia2018)



#Colombia2012
DataColombia2012 <- X1553850479Colombia_LAPOP_AmericasBarometer_2012_Rev1_W


DataColombia2012$vb50
names(DataColombia2012)[names(DataColombia2012)=='vb50']='Colombia2012'

DataColombia2012[3,284]
DataColombia2012[,c(1:283)] = NULL
DataColombia2012[,c(2:146)] = NULL

idcol12 <- rownames(DataColombia2012)
Col12 <- cbind(id=idcol12, DataColombia2012)


#merge 2 datas colombia
Col1218=merge(Col12,Col18, by.x = 'id', by.y = 'id', all = T)



#Colombia 

DataColombia2008 <-X1747696808Colombia2008_Rev1_W

names(DataColombia2008)[names(DataColombia2008)=='vb50']='Colombia2008'

DataColombia2008$Colombia2008

DataColombia2008[,c(279)]

DataColombia2008[,c(1:278)] = NULL
DataColombia2008[,c(2:67)] = NULL


idcol08 <- rownames(DataColombia2008)
Col08 <- cbind(id=idcol08, DataColombia2008)



#merge tres datas
Col081218=merge(Col08,Col1218, by.x = 'id', by.y = 'id', all = T)



#Colombia 



#COSTA RICA
#2018
DataCostaRica2018 <- CostaRica_LAPOP_AmericasBarometer_2018_v1_0_W



names(DataCostaRica2018)[names(DataCostaRica2018)=='vb50']='CostaRica2018'

DataCostaRica2018$CostaRica2018
DataCostaRica2018[,c(141)]

DataCostaRica2018[,c(1:140)] = NULL
DataCostaRica2018[,c(2:104)] = NULL


idcr18 <- rownames(DataCostaRica2018)
Cr18 <- cbind(id=idcr18, DataCostaRica2018)


#Costa Rica 2012

DataCostaRica2012 <- X2054788361CostaRica_LAPOP_AmericasBarometer_2012_Rev1_W



names(DataCostaRica2012)[names(DataCostaRica2012)=='vb50']='CostaRica2012'

DataCostaRica2012$CostaRica2012
DataCostaRica2012[,c(205)]

DataCostaRica2012[,c(1:204)] = NULL
DataCostaRica2012[,c(2:112)] = NULL


idcr12 <- rownames(DataCostaRica2012)
Cr12 <- cbind(id=idcr12, DataCostaRica2012)


#merge 2 datas costarica
Cr1218=merge(Cr12,Cr18, by.x = 'id', by.y = 'id', all = T)



##Costa Rica 2008

DataCostaRica2008 <- X182993535costa_rica_lapop_dims_2008_final_data_set_v10

names(DataCostaRica2008)[names(DataCostaRica2008)=='vb50']='CostaRica2008'

DataCostaRica2008$CostaRica2008
DataCostaRica2008[,c(205)]

DataCostaRica2008[,c(1:204)] = NULL
DataCostaRica2008[,c(2:103)] = NULL





idcr08 <- rownames(DataCostaRica2008)
Cr08 <- cbind(id=idcr08, DataCostaRica2008)


#merge tres datas Costa Rica
Cr081218=merge(Cr08,Cr1218, by.x = 'id', by.y = 'id', all = T)



#Costa Rica 




##Ecuador
#Ecuador2018

DataEcuador2018 <- Ecuador_LAPOP_AmericasBarometer_2019_v1_0_W

names(DataEcuador2018)[names(DataEcuador2018)=='vb50']='Ecuador2018'

DataEcuador2018$Ecuador2018
DataEcuador2018[,c(122)]

DataEcuador2018[,c(1:121)] = NULL
DataEcuador2018[,c(2:132)] = NULL


idecu18 <- rownames(DataEcuador2018)
Ecu18 <- cbind(id=idecu18, DataEcuador2018)



#Ecuador2012
DataEcuador2012 <- X1782383684Ecuador_LAPOP_AmericasBarometer_2012_Rev1_W
names(DataEcuador2012)[names(DataEcuador2012)=='vb50']='Ecuador2012'

DataEcuador2012$Ecuador2012
DataEcuador2012[,c(196)]

DataEcuador2012[,c(1:195)] = NULL
DataEcuador2012[,c(2:92)] = NULL


idecu12 <- rownames(DataEcuador2012)
Ecu12 <- cbind(id=idecu12, DataEcuador2012)


#merge 2 datas ecuador
Ecu1218=merge(Ecu12,Ecu18, by.x = 'id', by.y = 'id', all = T)



##Ecuador2008
DataEcuador2008 <- X600372706ecuador_lapop_dims_2008_final_data_set_v10

names(DataEcuador2008)[names(DataEcuador2008)=='vb50']='Ecuador2008'

DataEcuador2008$Ecuador2008
DataEcuador2008[,c(209)]

DataEcuador2008[,c(1:208)] = NULL
DataEcuador2008[,c(2:75)] = NULL


idecu08 <- rownames(DataEcuador2008)
Ecu08 <- cbind(id=idecu08, DataEcuador2008)



#merge tres datas Ecuador
Ecu081218=merge(Ecu08,Ecu1218, by.x = 'id', by.y = 'id', all = T)


#Ecuador 



#BRASIL
#Brasil2018
DataBrasil2018 <- Brazil_LAPOP_AmericasBarometer_2019_v1_0_W

names(DataBrasil2018)[names(DataBrasil2018)=='vb50']='Brasil2018'

DataBrasil2018$Brasil2018
DataBrasil2018[,c(139)]

DataBrasil2018[,c(1:138)] = NULL
DataBrasil2018[,c(2:130)] = NULL


idbra18 <- rownames(DataBrasil2018)
Bra18 <- cbind(id=idbra18, DataBrasil2018)

library(DescTools)

#Brasil2012

DataBrasil2012 <- X54861031Brazil_LAPOP_AmericasBarometer_2012_Rev1_W
names(DataBrasil2012)[names(DataBrasil2012)=='vb50']='Brasil2012'

DataBrasil2012$Brasil2012
DataBrasil2012[,c(191)]

DataBrasil2012[,c(1:190)] = NULL
DataBrasil2012[,c(2:150)] = NULL


idbra12 <- rownames(DataBrasil2012)
Bra12 <- cbind(id=idbra12, DataBrasil2012)



#merge 2 datas brasil
Bra1218=merge(Bra12,Bra18, by.x = 'id', by.y = 'id', all = T)



#BRasil2008

DataBrasil2008 <- X30541815brazil_lapop_dims_2008_final_data_set_v10
names(DataBrasil2008)[names(DataBrasil2008)=='vb50']='Brasil2008'

DataBrasil2008$Brasil2008
DataBrasil2008[,c(202)]

DataBrasil2008[,c(1:201)] = NULL
DataBrasil2008[,c(2:104)] = NULL


idbra08 <- rownames(DataBrasil2008)
Bra08 <- cbind(id=idbra08, DataBrasil2008)


#merge tres datas BRASIL
Bra081218=merge(Bra08,Bra1218, by.x = 'id', by.y = 'id', all = T)


#EL SALVADOR
#El Salvador 2018

DataElSalvador2018 <- ElSalvador_LAPOP_AmericasBarometer_2018_v1_0_W
names(DataElSalvador2018)[names(DataElSalvador2018)=='vb50']='ElSalvador2018'

DataElSalvador2018$ElSalvador2018
DataElSalvador2018[,c(131)]
DataElSalvador2018[,c(1:130)] = NULL
DataElSalvador2018[,c(2:108)] = NULL


idels18 <- rownames(DataElSalvador2018)
Els18 <- cbind(id=idels18, DataElSalvador2018)



#El Salvador 2012
DataElSalvador2012 <- X1126250629ElSalvador_LAPOP_AmericasBarometer_2012_Rev1_W
names(DataElSalvador2012)[names(DataElSalvador2012)=='vb50']='ElSalvador2012'

DataElSalvador2012$ElSalvador2012
DataElSalvador2012[,c(225)]
DataElSalvador2012[,c(1:224)] = NULL
DataElSalvador2012[,c(2:121)] = NULL


idels12 <- rownames(DataElSalvador2012)
Els12 <- cbind(id=idels12, DataElSalvador2012)


#merge 2 datas el salvador
Els1218=merge(Els12,Els18, by.x = 'id', by.y = 'id', all = T)



##El Salvador 2008

DataElSalvador2008 <- X1698154699el_salvador_lapop_dims_2008_final_lapop08_v10
names(DataElSalvador2008)[names(DataElSalvador2008)=='vb50']='ElSalvador2008'

DataElSalvador2008$ElSalvador2008
DataElSalvador2008[,c(223)]

DataElSalvador2008[,c(1:222)] = NULL
DataElSalvador2008[,c(2:83)] = NULL


idels08 <- rownames(DataElSalvador2008)
Els08 <- cbind(id=idels08, DataElSalvador2008)


#merge tres datas EL SALVADOR
Els081218=merge(Els08,Els1218, by.x = 'id', by.y = 'id', all = T)



#GUATEMALA

DataGuatemala2019 <- Guatemala_LAPOP_AmericasBarometer_2019_v1_0_W

names(DataGuatemala2019)[names(DataGuatemala2019)=='vb50']='Guatemala2019'

DataGuatemala2019$Guatemala2019
DataGuatemala2019[,c(130)]

DataGuatemala2019[,c(1:129)] = NULL
DataGuatemala2019[,c(2:119)] = NULL


idgua19 <- rownames(DataGuatemala2019)
Gua19 <- cbind(id=idgua19, DataGuatemala2019)



#Guatemala2012

DataGuatemala2012 <- X2041873797Guatemala_LAPOP_AmericasBarometer_2012_Rev1_W
names(DataGuatemala2012)[names(DataGuatemala2012)=='vb50']='Guatemala2012'

DataGuatemala2012$Guatemala2012
DataGuatemala2012[,c(199)]

DataGuatemala2012[,c(1:198)] = NULL
DataGuatemala2012[,c(2:130)] = NULL


idgua12 <- rownames(DataGuatemala2012)
Gua12 <- cbind(id=idgua12, DataGuatemala2012)



Gua1219=merge(Gua12,Gua19, by.x = 'id', by.y = 'id', all = T)



#Guatemala 2008
DataGuatemala2008 <- X130872853guatemala_lapop_dims_2008_final_data_set_v10

names(DataGuatemala2008)[names(DataGuatemala2008)=='vb50']='Guatemala2008'

DataGuatemala2008$Guatemala2008
DataGuatemala2008[,c(217)]
DataGuatemala2008[,c(1:216)] = NULL
DataGuatemala2008[,c(2:73)] = NULL


idgua08 <- rownames(DataGuatemala2008)
Gua08 <- cbind(id=idgua08, DataGuatemala2008)


#merge tres datas GUATEMALA
Gua081219=merge(Gua08,Gua1219, by.x = 'id', by.y = 'id', all = T)

###HONDURAS
#Honduras 2018

DataHonduras2018 <- Honduras_LAPOP_AmericasBarometer_2018_v1_0_W


names(DataHonduras2018)[names(DataHonduras2018)=='vb50']='Honduras2018'

DataHonduras2018$Honduras2018
DataHonduras2018[,c(123)]
DataHonduras2018[,c(1:122)] = NULL
DataHonduras2018[,c(2:104)] = NULL


idhon18 <- rownames(DataHonduras2018)
Hon18 <- cbind(id=idhon18, DataHonduras2018)



#Honduras 2012

DataHonduras2012 <- X42768395Honduras_LAPOP_AmericasBarometer_2012_Rev1_W
names(DataHonduras2012)[names(DataHonduras2012)=='vb50']='Honduras2012'

DataHonduras2012$Honduras2012
DataHonduras2012[,c(222)]
DataHonduras2012[,c(1:221)] = NULL
DataHonduras2012[,c(2:116)] = NULL


idhon12 <- rownames(DataHonduras2012)
Hon12 <- cbind(id=idhon12, DataHonduras2012)


Hon1218=merge(Hon12,Hon18, by.x = 'id', by.y = 'id', all = T)



#Honduras 2008

DataHonduras2008 <- X1645121539honduras_lapop_dims_2008_final_data_set_v10

names(DataHonduras2008)[names(DataHonduras2008)=='vb50']='Honduras2008'

DataHonduras2008$Honduras2008

DataHonduras2008[,c(231)]
DataHonduras2008[,c(1:230)] = NULL
DataHonduras2008[,c(2:66)] = NULL


idhon08 <- rownames(DataHonduras2008)
Hon08 <- cbind(id=idhon08, DataHonduras2008)


#merge tres datas HONDURAS
Hon081218=merge(Hon08,Hon1218, by.x = 'id', by.y = 'id', all = T)



##MEXICO
#Mexico 2018
DataMexico2018 <- Mexico_LAPOP_AmericasBarometer_2019_v1_0_W

names(DataMexico2018)[names(DataMexico2018)=='vb50']='Mexico2018'

DataMexico2018$Mexico2018

DataMexico2018[,c(117)]
DataMexico2018[,c(1:116)] = NULL
DataMexico2018[,c(2:105)] = NULL


idmex18 <- rownames(DataMexico2018)
Mex18 <- cbind(id=idmex18, DataMexico2018)



#Mexico 2012
DataMexico2012 <- X641926122Mexico_LAPOP_AmericasBarometer_2012_Rev1_W


names(DataMexico2012)[names(DataMexico2012)=='vb50']='Mexico2012'

DataMexico2012$Mexico2012

DataMexico2012[,c(201)]
DataMexico2012[,c(1:200)] = NULL
DataMexico2012[,c(2:120)] = NULL


idmex12 <- rownames(DataMexico2012)
Mex12 <- cbind(id=idmex12, DataMexico2012)


#merge dos datas MEX

Mex1218=merge(Mex12,Mex18, by.x = 'id', by.y = 'id', all = T)


#Mexico2008

DataMexico2008 <- X886309252Mexico_2008_LAPOP_DIMS_final_data_set_v10


names(DataMexico2008)[names(DataMexico2008)=='vb50']='Mexico2008'

DataMexico2008$Mexico2008

DataMexico2008[,c(182)]
DataMexico2008[,c(1:181)] = NULL
DataMexico2008[,c(2:91)] = NULL


idmex08 <- rownames(DataMexico2008)
Mex08 <- cbind(id=idmex08, DataMexico2008)


#merge tres datas Mexico
Mex081218=merge(Mex08,Mex1218, by.x = 'id', by.y = 'id', all = T)



#mexico 2000

DataMexico2000 <- WV4_Data_Mexico_2000_Spss_v20180912


DataMexico2000$Mexico2000
names(DataMexico2000)[names(DataMexico2000)=='V118']='Mexico2000'

DataMexico2000[,c(146)]
DataMexico2000[,c(1:145)] = NULL
DataMexico2000[,c(2:293)] = NULL


idmex00 <- rownames(DataMexico2000)
Mex00 <- cbind(id=idmex00, DataMexico2000)


table(Mex00$Mexico2000)

##MERGE 4 DATAS MEXICO

Mex00081218=merge(Mex00,Mex081218, by.x = 'id', by.y = 'id', all = T)

str(Mex00081218)


###PANAMA
#2018

DataPanama2018 <- Panama_LAPOP_AmericasBarometer_2018_v1_0_W

names(DataPanama2018)[names(DataPanama2018)=='vb50']='Panama2018'

DataPanama2018$Panama2018

DataPanama2018[,c(107)]
DataPanama2018[,c(1:106)] = NULL
DataPanama2018[,c(2:111)] = NULL


idpan18 <- rownames(DataPanama2018)
Pan18 <- cbind(id=idpan18, DataPanama2018)



#Panama 2012
DataPanama2012 <- X1012668426Panama_LAPOP_AmericasBarometer_2012_Rev1_W

names(DataPanama2012)[names(DataPanama2012)=='vb50']='Panama2012'

DataPanama2012$Panama2012

DataPanama2012[,c(206)]
DataPanama2012[,c(1:205)] = NULL
DataPanama2012[,c(2:103)] = NULL


idpan12 <- rownames(DataPanama2012)
Pan12 <- cbind(id=idpan12, DataPanama2012)


#merge dos datas panama
Pan1218=merge(Pan12,Pan18, by.x = 'id', by.y = 'id', all = T)



#Panama 2008

DataPanama2008 <- X1964581143panama_lapop_dims_2008_final_data_set_v10

names(DataPanama2008)[names(DataPanama2008)=='vb50']='Panama2008'

DataPanama2008$Panama2008

DataPanama2008[,c(203)]
DataPanama2008[,c(1:202)] = NULL
DataPanama2008[,c(2:86)] = NULL


idpan08 <- rownames(DataPanama2008)
Pan08 <- cbind(id=idpan08, DataPanama2008)


#merge 3 datas panama
Pan081218=merge(Pan08,Pan1218, by.x = 'id', by.y = 'id', all = T)




##PARAGUAY
#2019

DataParaguay2019 <-Paraguay_LAPOP_AmericasBarometer_2019_v1_0_W

names(DataParaguay2019)[names(DataParaguay2019)=='vb50']='Paraguay2019'

DataParaguay2019$Paraguay2019

DataParaguay2019[,c(135)]
DataParaguay2019[,c(1:134)] = NULL
DataParaguay2019[,c(2:99)] = NULL


idpar19 <- rownames(DataParaguay2019)
Par19 <- cbind(id=idpar19, DataParaguay2019)



##2012

DataParaguay2012 <- X1346923279Paraguay_LAPOP_AmericasBarometer_2012_Rev1_W

names(DataParaguay2012)[names(DataParaguay2012)=='vb50']='Paraguay2012'

DataParaguay2012$Paraguay2012

DataParaguay2012[,c(194)]
DataParaguay2012[,c(1:193)] = NULL
DataParaguay2012[,c(2:94)] = NULL


idpar12 <- rownames(DataParaguay2012)
Par12 <- cbind(id=idpar12, DataParaguay2012)

#merge dos datas
Par1219=merge(Par12,Par19, by.x = 'id', by.y = 'id', all = T)



#paraguay 2008

DataParaguay2008 <- X1810845452paraguay_lapop_dims_2008_final_datas_set_v10

names(DataParaguay2008)[names(DataParaguay2008)=='vb50']='Paraguay2008'

DataParaguay2008$Paraguay2008

DataParaguay2008[,c(169)]
DataParaguay2008[,c(1:168)] = NULL
DataParaguay2008[,c(2:73)] = NULL


idpar08 <- rownames(DataParaguay2008)
Par08 <- cbind(id=idpar08, DataParaguay2008)


#merge 3 datas
Par081219=merge(Par08,Par1219, by.x = 'id', by.y = 'id', all = T)




#REPUBLICA DOMINICANA
#2019

DataRepDomini2019 <- DominicanRepublic_LAPOP_AmericasBarometer_2019_v1_0_W


names(DataRepDomini2019)[names(DataRepDomini2019)=='vb50']='RepublicaDominicana2019'

DataRepDomini2019$RepublicaDominicana2019

DataRepDomini2019[,c(149)]
DataRepDomini2019[,c(1:148)] = NULL
DataRepDomini2019[,c(2:150)] = NULL


idrdo19 <- rownames(DataRepDomini2019)
Rdo19 <- cbind(id=idrdo19, DataRepDomini2019)


#2012

DataRepDomini2012 <- X1076064826DomRep_LAPOP_AmericasBarometer_2012_Rev1_W
names(DataRepDomini2012)[names(DataRepDomini2012)=='vb50']='RepublicaDominicana2012'

DataRepDomini2012$RepublicaDominicana2012

DataRepDomini2012[,c(223)]
DataRepDomini2012[,c(1:222)] = NULL
DataRepDomini2012[,c(2:109)] = NULL


idrdo12 <- rownames(DataRepDomini2012)
Rdo12 <- cbind(id=idrdo12, DataRepDomini2012)


#merge dos datas
Rdo1219=merge(Rdo12,Rdo19, by.x = 'id', by.y = 'id', all = T)



###2008

DataRepDomini2008 <- X574037720republica_dominicana_lapop_dims_2008_v11

names(DataRepDomini2008)[names(DataRepDomini2008)=='vb50']='RepublicaDominicana2008'

DataRepDomini2008$RepublicaDominicana2008

DataRepDomini2008[,c(200)]
DataRepDomini2008[,c(1:199)] = NULL
DataRepDomini2008[,c(2:82)] = NULL


idrdo08 <- rownames(DataRepDomini2008)
Rdo08 <- cbind(id=idrdo08, DataRepDomini2008)



#merge 3 datas
Rdo081219=merge(Rdo08,Rdo1219, by.x = 'id', by.y = 'id', all = T)



##URUGUAY
#2019

DataUruguay2019 <- Uruguay_LAPOP_AmericasBarometer_2019_v1_0_W

names(DataUruguay2019)[names(DataUruguay2019)=='vb50']='Uruguay2019'

DataUruguay2019$Uruguay2019

DataUruguay2019[,c(103)]
DataUruguay2019[,c(1:102)] = NULL
DataUruguay2019[,c(2:131)] = NULL


iduru19 <- rownames(DataUruguay2019)
Uru19 <- cbind(id=iduru19, DataUruguay2019)



##uruguay 2012

DataUruguay2012 <- X878322670Uruguay_LAPOP_AmericasBarometer_2012_Rev1_W

names(DataUruguay2012)[names(DataUruguay2012)=='vb50']='Uruguay2012'

DataUruguay2012$Uruguay2012

DataUruguay2012[,c(206)]
DataUruguay2012[,c(1:205)] = NULL
DataUruguay2012[,c(2:119)] = NULL


iduru12 <- rownames(DataUruguay2012)
Uru12 <- cbind(id=iduru12, DataUruguay2012)


#merge dos datas
Uru1219=merge(Uru12,Uru19, by.x = 'id', by.y = 'id', all = T)



##2008

DataUruguay2008 <- X164821281uruguay_lapop_dims_2008_final_data_set_v10

names(DataUruguay2008)[names(DataUruguay2008)=='vb50']='Uruguay2008'

DataUruguay2008$Uruguay2008

DataUruguay2008[,c(171)]
DataUruguay2008[,c(1:170)] = NULL
DataUruguay2008[,c(2:71)] = NULL


iduru08 <- rownames(DataUruguay2008)
Uru08 <- cbind(id=iduru08, DataUruguay2008)


#merge 3 datas
Uru081219=merge(Uru08,Uru1219, by.x = 'id', by.y = 'id', all = T)




#Unir Chile y Peru (ya dicotomizado)


ChiPer=merge(Chi00061419,Per01081219, by.x = 'id', by.y = 'id', all = T)


#Unir el resto de paises (por dicotomizar)



ArgBol=merge(Arg061219,Bol081219, by.x = 'id', by.y = 'id', all = T)




ArBoCo=merge(ArgBol,Col081218, by.x = 'id', by.y = 'id', all = T)





ArBoCoCr=merge(ArBoCo,Cr081218, by.x = 'id', by.y = 'id', all = T)




ArBoCoCrEc=merge(ArBoCoCr,Ecu081218, by.x = 'id', by.y = 'id', all = T)



ArBoCoCrEcBr=merge(ArBoCoCrEc,Bra081218, by.x = 'id', by.y = 'id', all = T)



ArBoCoCrEcBrEl=merge(ArBoCoCrEcBr,Els081218, by.x = 'id', by.y = 'id', all = T)




ArBoCoCrEcBrElGu=merge(ArBoCoCrEcBrEl,Gua081219, by.x = 'id', by.y = 'id', all = T)




ArBoCoCrEcBrElGuHo=merge(ArBoCoCrEcBrElGu,Hon081218, by.x = 'id', by.y = 'id', all = T)




ArBoCoCrEcBrElGuHoMe=merge(ArBoCoCrEcBrElGuHo,Mex00081218, by.x = 'id', by.y = 'id', all = T)




ArBoCoCrEcBrElGuHoMePan=merge(ArBoCoCrEcBrElGuHoMe,Pan081218, by.x = 'id', by.y = 'id', all = T)




ArBoCoCrEcBrElGuHoMePanPar=merge(ArBoCoCrEcBrElGuHoMePan,Par081219, by.x = 'id', by.y = 'id', all = T)




ArBoCoCrEcBrElGuHoMePanParRd=merge(ArBoCoCrEcBrElGuHoMePanPar,Rdo081219, by.x = 'id', by.y = 'id', all = T)



#casi todos los paises

Paises1=merge(ArBoCoCrEcBrElGuHoMePanParRd,Uru081219, by.x = 'id', by.y = 'id', all = T)



#dicotomizar esto
##Dicotomizar 1y2(de acuerdo) sera 1
#3y4(en desacuerdo) sera 0

library(rio)

Paises1[,c(2:44)]= replace(Paises1[,c(2:44)], 
                           Paises1[,c(2:44)] == 2,1)

Paises1[,c(2:44)]= replace(Paises1[,c(2:44)], 
                           Paises1[,c(2:44)] == 3,0)

Paises1[,c(2:44)]= replace(Paises1[,c(2:44)], 
                           Paises1[,c(2:44)] == 4,0)

str(Paises1)
table(Paises1$Bolivia2012)

##MERGE FINAL
PaisesOpinion=merge(Paises1,ChiPer, by.x = 'id', by.y = 'id', all = T)
View(PaisesOpinion)
