# System Zarządzania Biblioteką

Kompleksowy system webowy służący do zarządzania strukturą biblioteczną (czytelnie, książki, czasopisma, pracownicy) oraz operacjami związanymi z rezerwacją, wypożyczaniem i naliczaniem opłat (kar). Projekt łączy w sobie relacyjną bazę danych oraz rozbudowany interfejs użytkownika.

## Technologie i Narzędzia

* **PHP** – logika biznesowa aplikacji, dynamiczne generowanie stron oraz komunikacja z bazą danych za pomocą rozszerzenia OCI (Oracle Call Interface).
* **SQL (Oracle)** – relacyjna baza danych oparta na zaawansowanych relacjach, sekwencjach (`SEQUENCE`) oraz dedykowanych pakietach i procedurach (np. `zamowienia_pkg`).
* **Bootstrap 5** – framework CSS zapewniający nowoczesny, czytelny i responsywny wygląd interfejsu.

## Struktura Projektu i Bazy Danych

Aplikacja została podzielona na moduły odpowiadające poszczególnym obszarom działalności biblioteki. Każdy moduł umożliwia przeglądanie, dodawanie (`insert`) oraz edycję/aktualizację (`update`) danych:

* **Zasoby:** `ksiazki.php`, `czasopisma.php`, `artykuly.php` (katalogowanie literatury, prasy oraz powiązanych artykułów).
* **Użytkownicy i Kadra:** `czytelnicy.php`, `pracownicy.php` (rejestr czytelników z przypisanymi rangami/uprawnieniami oraz baza pracowników biblioteki).
* **Operacje:** `zamowienia.php`, `wypozyczenia.php`, `pokazZamowienie.php` (pełna obsługa procesu rezerwacji książek/czasopism oraz rejestracja fizycznych wypożyczeń i zwrotów).
* **Finanse:** `kary.php` (rejestr i zarządzanie opłatami za nieterminowe zwroty zasobów).
* **Konfiguracja połączenia:** `connection.php`, `db.php`.

## Interfejs użytkownika (Zrzuty ekranu)

Poniżej przedstawiono główne ekrany systemu zarządzania biblioteką wraz z formularzami operacyjnymi:

### 1.Przeglądanie danych (Read & Delete)
Ekran z czytelnym interfejsem i górnym menu kafelkowym do nawigacji po systemie. Tabela dynamicznie pobiera dane z bazy Oracle i wyświetla kluczowe informacje, oferując także akcje usuwania lub przejścia do edycji każdego rekordu.
![Rejestr czytelników w systemie](screenshots/czytelnicy.png)
*Rysunek 1: Widok zarządzania rejestrem czytelników.*

### 2. Formularz dodawania nowego czytelnika (Create / Insert)
Intuicyjny interfejs pozwalający na wprowadzanie nowych danych. Formularz uwzględnia walidację pól tekstowych oraz kalendarz dla dat.
![Formularz dodawania czytelnika](screenshots/dodajczytelnika.png)
*Rysunek 2: Formularz rejestracji nowego czytelnika w systemie.*

### 3. Moduł edycji i aktualizacji danych (Update)
Ekran edycji automatycznie uzupełnia pola formularza aktualnymi danymi wybranego rekordu pobranymi z bazy danych. Umożliwia modyfikację parametrów (np. adresu zamieszkania czy rangi) i bezpieczne nadpisanie rekordu za pomocą operacji `UPDATE`.
![Formularz edycji czytelnika](screenshots/edytujczytelnika.png)
*Rysunek 3: Panel modyfikacji danych istniejącego czytelnika.*

## Instrukcja Uruchomienia i Wdrożenia

### 1. Przygotowanie i konfiguracja Bazy Danych
1. Zaloguj się do swojego klienta bazy danych (np. *Oracle SQL Developer*).
2. Wykonaj skrypt `.sql` dołączony do projektu. Skrypt utworzy niezbędne struktury tabel, sekwencje generujące klucze główne oraz pakiety procedur, a także wypełni bazę danymi testowymi.

### 2. Uruchomienie lokalnego serwera Apache
1. Skopiuj zawartość folderu `src/` do katalogu roboczego swojego lokalnego serwera (np. `htdocs/` w środowisku **XAMPP** lub `www/` w **WampServer**).
2. Otwórz plik `connection.php` (lub `db.php`) i upewnij się, że dane dostępowe (host, port, nazwa użytkownika Oracle, hasło) są poprawne i zgodne z Twoją konfiguracją lokalną.
3. Uruchom moduł **Apache** w panelu kontrolnym serwera.
4. Otwórz przeglądarkę internetową i wpisz adres URL:
   ```text
   http://localhost/nazwa_twojego_folderu/
   ```
