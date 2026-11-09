# Drzewo genealogiczne

Osobny projekt: strona do budowania drzewa genealogicznej rodziny.
Jeden plik HTML (Tailwind przez CDN, czysty JavaScript), dane w Supabase, hosting na GitHub Pages.

**Drzewo online:** https://kamilowebski.github.io/drzewo/

## Co potrafi

- Dodawanie, edycja i usuwanie osób. Wszystkie dane osoby są opcjonalne, daty mogą być częściowe (np. samo `1923`).
- Powiązania: rodzice, dzieci, rodzeństwo (także przyrodnie), partnerzy.
- Wiele rodzin w jednym drzewie, pokolenia podpisane w rzędach.
- Dwa widoki:
  - **Widok osoby** (domyślny): wybrana osoba w centrum, jej przodkowie, potomkowie i rodzeństwo. Liczbę pokoleń w górę i w dół ustawiasz u góry.
  - **Całe drzewo**: wszystkie rodziny naraz.
- Przesuwanie przeciąganiem, zoom kółkiem myszy lub dwoma palcami, wyszukiwarka osób.
- Logowanie e-mailem i hasłem, dane widoczne tylko dla zalogowanych.
- Instalacja jako aplikacja (ikona na ekranie głównym).

## Uruchomienie

1. **Supabase:** w SQL Editor uruchom zawartość `schema.sql`.
2. **Konto:** Authentication → Users → Add user (Twój e-mail i hasło). Wyłącz publiczną rejestrację: Authentication → Sign In / Providers → Email → wyłącz "Allow new users to sign up".
3. **Klucze:** na górze skryptu w `index.html` ustaw `SUPABASE_URL` i `SUPABASE_KEY` (klucz publishable). Plik z paczki ma już wpisane dane projektu.
4. **GitHub Pages:** wrzuć zawartość tego folderu do repozytorium `drzewo`, potem Settings → Pages → Deploy from a branch → `main` / root.

Jeśli repozytorium ma inną nazwę niż `drzewo`, zmień link powyżej.

## Obsługa

- **Pierwsza osoba:** przycisk "Dodaj osobę". Zacznij od siebie albo od najstarszej znanej osoby.
- **Kolejne osoby:** kliknij kartę osoby i użyj "+ Dziecko", "+ Partner", "+ Rodzic" albo "+ Rodzeństwo". Rodzice i nazwisko uzupełnią się same.
- **Zmiana centrum:** wyszukaj osobę albo kliknij ją i wybierz "Pokaż w centrum". Kliknięcie imienia krewnego w szczegółach też przenosi centrum na niego.
- **Błąd w danych:** "Edytuj" w szczegółach osoby, tam można zmienić rodziców.
- Osoby ze wpisaną datą śmierci mają szare tło, osoba w centrum niebieską obwódkę.

## Pliki

| Plik | Do czego służy |
|------|----------------|
| `index.html` | cała aplikacja (HTML, CSS, JS) |
| `schema.sql` | tabele i zabezpieczenia w Supabase |
| `manifest.webmanifest` | instalacja jako aplikacja |
| `icons/` | ikony (PNG, SVG, wersja maskable i Apple) |
| `.nojekyll` | wyłącza przetwarzanie Jekyll na GitHub Pages |

## Bezpieczeństwo

Klucz publishable jest przeznaczony do użycia w przeglądarce, więc może być w publicznym repozytorium. Dane chronią reguły RLS z `schema.sql` (dostęp tylko po zalogowaniu). Nie wklejaj do repozytorium klucza `service_role` ani `secret`.
