# Uçuşlar Verilənlər Bazası Layihəsi

Bu layihə kiçik bir verilənlər bazasını göstərir və mən onu **hava yolu sistemi** kimi modelləşdirmişəm.  
Bazada **sərnişinlər, uçuşlar və uçuş qeydləri** var.  

Bu layihəni **SQL praktikasına** və portfoliomda bacarıqlarımı göstərmək üçün yaratdım.  

---

## Verilənlər Bazası Strukturu

Baza **üç əsas cədvəldən** ibarətdir:

1. **Passenger (Sərnişinlər)**  
   - `id` — unikal sərnişin nömrəsi  
   - `name` — ad  
   - `age` — yaş  
   - `country` — ölkə  
   - `passport_number` — pasport nömrəsi  
   - `email` — elektron poçt  

2. **Trip (Uçuşlar)**  
   - `id` — unikal uçuş nömrəsi  
   - `town_from` — çıxış şəhəri  
   - `town_to` — təyinat şəhəri  
   - `flight_number` — uçuş nömrəsi  
   - `airline` — hava yolu şirkəti  
   - `departure_time` — uçuş vaxtı  
   - `arrival_time` — çatma vaxtı  

3. **Pass_in_trip (Sərnişinlər Uçuşlarda)**  
   - `passenger` — sərnişinə istinad  
   - `trip` — uçuşa istinad  
   - `date` — uçuş tarixi  
   - `seat_number` — yer nömrəsi  
   - `ticket_class` — bilet sinfi  
   - `price` — bilet qiyməti  

Birləşdirilmiş açar `(passenger, trip, date)` eyni sərnişinin bir gün içində eyni uçuşa təkrar daxil olmasının qarşısını alır.  

---

## ER-Diaqram

Cədvəllərin bir-biri ilə əlaqəsi belədir:  

![ER-Diagram](https://github.com/amid8ragimov/sql-airline-analysis/blob/main/imagesER-diagram.png)

- Hər sərnişin bir neçə uçuşa sahib ola bilər  
- Hər uçuş bir neçə sərnişinə malik ola bilər  

---

## Sorğuların Nümunələri
Biznes sinif sərnişinləri
![Biznes-sinif-sərnişinləri](https://github.com/amid8ragimov/sql-airline-analysis/blob/main/Biznes%20sinif%20s%C9%99rni%C5%9Finl%C9%99ri.png)
Hər sərnişinin uçuş sayı
![Hər sərnişinin uçuş sayı](https://github.com/amid8ragimov/sql-airline-analysis/blob/main/H%C9%99r%20s%C9%99rni%C5%9Finin%20u%C3%A7u%C5%9F%20say%C4%B1.png)
Kylian Mbappe-nin uçuş tarixçəsi
![Kylian Mbappe-nin uçuş tarixçəsi](https://github.com/amid8ragimov/sql-airline-analysis/blob/main/Kylian%20Mbappe-nin%20u%C3%A7u%C5%9F%20tarix%C3%A7%C9%99si.png)
Ən bahalı 5 bilet
![Ən bahalı 5 bilet](https://github.com/amid8ragimov/sql-airline-analysis/blob/main/%C6%8Fn%20bahal%C4%B1%205%20bilet.png)
Ən populyar istiqamətlər
![Ən populyar istiqamətlər](https://github.com/amid8ragimov/sql-airline-analysis/blob/main/%C6%8Fn%20populyar%20istiqam%C9%99tl%C9%99r.png)




---

**Müəllif:** Amid Rahimov  
**Məqsəd:** SQL praktikasını göstərmək və portfolioda nümayiş
