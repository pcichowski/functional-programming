# Języki programowania - zadania projektowe
>### Informatyka sem 3

## Lista zadań:

- [ ] **Zadanie 1.2**

	- >Zaimplementować predykat sortuj( lista, posortowana ) zwracający listę posortowaną nie rosnąco. Zastosuj algorytm sortowania gnoma (gnome sort). (2pkt).
  
- [ ] **Zadanie 2**
	
	- >Zaimplementuj predykat czy_graficzny( lista,odp ), stwierdzający, czy lista
tworzy ciąg graficzny. Wykorzystaj predykat sortujący z poprzedniego zadania.
(3 pkt.).

- [ ] **Zadanie 3**
	- >Zaimplementuj predykat czy_spojny( lista, odp ), stwierdzający, czy lista
stopni wierzchołków tworzy ciąg graficzny z którego powstanie graf spójny.
Wykorzystaj predykat z poprzedniego zadania w celu sprawdzenia czy z listy można
utworzyć graf. (3 pkt.).
	```
	: czy_spojny( [1,0,1], ODP ) % graf niespójny
	ODP = N
	: czy_spojny( [1,1,1], ODP ) % ciąg nie graficzny
	ODP = N
	: czy_spojny( [1,1,1,1], ODP ) % graf niespójny
	ODP = N
	: czy_spojny( [1,2,2,1,2], ODP ) % graf spójny
	ODP = T
	: czy_spojny( [3,3,3,0,3], ODP ) % graf niespójny
	ODP = N
	```
	>W przedostatnim przypadku możemy stworzyć ścieżkę P5 albo cykl/graf pełny C3/K3 i
ścieżkę/graf pełny P2/K2. Zatem można utworzyć graf spójny.
Ostatni przypadek to przykład grafu niespójnego w którym liczba krawędzi jest
większa od liczby wierzchołków.

- [ ] **Zadanie 4.1**

	>Wyobraźmy sobie prostą grę rozgrywaną na planszy o wymiarach 1 x n pól. Na
	początku na planszy rozstawione jest m pionków. Jeśli szczegółowe zasady na temat
ruchu nie mówią inaczej, na każdym polu może znajdować się od 0 do m pionków.
Suma wszystkich pionków z wszystkich pól w każdym momencie gry równa jest m
(nie ma sytuacji bicia bądź dostawiania nowych pionów). Gra kończy się przegraną
gracza, kiedy nie może on wykonać żadnego dozwolonego ruchu.
	>Zaimplementuj predykat czy_wygrywa( plansza ) stwierdzający, czy gracz,
który wykonuje ruch dla zadanej planszy ma strategię wygrywającą (7 pkt). Predykat
powinien drukować wszystkie dostępne posunięcia wygrywające, wraz z kolejno
przeszukiwanymi stanami prowadzącymi do udowodnienia strategii wygrywającej. W
przypadku braku takiej strategii również powinien udowadniać strategię wygrywająca
przeciwnika, patrz szczegóły w sekcji II. W przypadku trudności można
zaimplementować wariant z ograniczoną planszą o wymiarach 1 x 8 pól (5 pkt).
	>Dozwolone ruchy dla graczy to:
	>przesunięcie jednego pionka w prawo z zastrzeżeniem, że na jednym polu
może znajdować się maksymalnie 1 pionek, ponadto może on przeskakiwać
inny pionek
(A:1,B:1,C:1,D:1,E:1,F:1,G:Y,H:0,I:1,J:0,K:0,L:0).



