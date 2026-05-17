# System Zarządzania Biblioteką 

Kompleksowy system zarządzania zasobami bibliotecznymi (czytelnie, książki, czasopisma, pracownicy) oraz operacjami związanymi z rezerwacją, wypożyczaniem i naliczaniem kar. Projekt składa się z relacyjnej bazy danych oraz interfejsu webowego użytkownika.

##  Technologie i Narzędzia

* **PHP** – logika backendowa aplikacji, obsługa formularzy i komunikacja z bazą danych
* **SQL (Oracle)** – relacyjna baza danych, wykorzystanie sekwencji (`SEQUENCE`) oraz zaawansowanych relacji między tabelami
* **HTML5 / CSS3** – warstwa wizualna interfejsu użytkownika

##  Struktura Bazy Danych

Baza danych odwzorowuje pełną strukturę operacyjną biblioteki i zawiera następujące tabele:
* `CZYTELNICY` oraz `RANGI` – rejestr użytkowników z limitami wypożyczeń zależnymi od stażu.
* `KSIAZKI`, `CZASOPISMA` oraz `ARTYKULY` – pełny katalog zasobów bibliotecznych.
* `ZAMOWIENIA` i `WYPOZYCZENIA` – rejestracja procesu rezerwacji i wypożyczeń.
* `KARY` – system opłat za przetrzymanie książek nakładany przez tabelę `PRACOWNICY`.
* `CZYTELNIA` – spis fizycznych placówek bibliotecznych.

##  Instrukcja Uruchomienia

### 1. Przygotowanie Bazy Danych
1. Otwórz swój program do obsługi baz danych (np. *Oracle SQL Developer*).
2. Wykonaj skrypt zawarty w pliku `db.sql`, aby automatycznie utworzyć sekwencje, tabele oraz zaimportować testowe dane.

### 2. Uruchomienie Aplikacji PHP
1. Skopiuj pliki z kodem aplikacji (pliki `.php` i foldery towarzyszące) do katalogu lokalnego serwera (np. `htdocs` w programie **XAMPP** lub `www` w **WampServer**).
2. Upewnij się, że w pliku konfiguracyjnym aplikacji (np. `config.php` / `db.php`) wprowadziłeś poprawne dane logowania do swojej bazy danych.
3. Uruchom serwer Apache w panelu XAMPP.
4. Otwórz przeglądarkę i przejdź pod adres `http://localhost/twoj_folder_z_projektym`.
