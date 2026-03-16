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

Bir neçə maraqlı sorğu yazdım ki, analitikanı göstərim:

1. Hər sərnişinin uçuş sayı  
2. Ən populyar təyinatlar  
3. Müəyyən sərnişinin uçuş tarixçəsi (məsələn, Kylian Mbappe)  
4. Ən bahalı 5 bilet  
5. Biznes sinfində olan sərnişinlər  



---

**Müəllif:** Amid Rahimov  
**Məqsəd:** SQL praktikasını göstərmək və portfolioda nümayiş
