# Języki programowania - zadania projektowe
>### Informatyka sem 3



## Haskell - lista zadań

- [x] **Zadanie 5**

  - >Dla danego zbioru w postaci listy L obliczyć jego zbiór potęgowy.
  
	![image](https://user-images.githubusercontent.com/81694867/162614022-7708468d-d128-4f94-98dc-9a1cb151cb11.png)
  - Instrukcja użytkowania programu:
    - Załadowanie modułu poprzez  :l zad_5.hs
    - Na wejściu podawana jest zwykła lista *( np. [1, 2, 3] )*
    - >powerSet([1, 2, 3])
  
- [x] **Zadanie 21**

  - >Dla danej liczby naturalnej n podaj wszystkie liczby pierwsze ≤ n dla których każda **rotacja** ich cyfr
nadal jest liczbą pierwszą. Taką liczbą jest 197 i jej dwie możliwe rotacje: 971 i 719.

	![image](https://user-images.githubusercontent.com/81694867/162614109-134b9f6b-20b7-4bf2-a5ba-81853dacc9f4.png)



- [x] **Zadanie 30**

  - >Kod Prüfer’a pozwala przekształcić dowolne drzewo na unikalną sekwencję liczb.
  Zaimplementować funkcję kodującą drzewo podane w postaci ciągu krawędzi (lista par liczb)
  kodem Prüfera (lista liczb):
 	 ```
  	prufer_code [(1, 2)]
  	> []
 	 prufer_code [(1, 2), (1, 3)]
	  > [1]
  	prufer_code [(1, 2), (2, 3)]
  	> [2]
 	 prufer_code [(1, 3), (2, 3)]
 	 > [3]
 	 prufer_code [(1, 4), (2, 4), (3, 4)]
 	 > [4, 4]
 	 ```
	 
	 ![image](https://user-images.githubusercontent.com/81694867/162614289-adc234b4-0630-4848-89a6-e0c82709d904.png)
	 ![image](https://user-images.githubusercontent.com/81694867/162614298-513d3fb9-9884-4d0b-9774-d120a34a698e.png)

  - Instrukcja użytkowania programu:
    - Załadowanie modułu  :l zad_30.hs
    - >pruferCode [(1, 2), (2, 3)]

## Prolog - lista zadań

- [x] **Zadanie 1.2**

	- >Zaimplementować predykat sortuj( lista, posortowana ) zwracający listę posortowaną nie rosnąco. Zastosuj algorytm sortowania gnoma (gnome sort). (2pkt).

  		![image](https://user-images.githubusercontent.com/81694867/162614543-d5c3e603-2dca-4ae9-8893-eb8f60944272.png)

- [x] **Zadanie 2**
	
	- >Zaimplementuj predykat czy_graficzny( lista,odp ), stwierdzający, czy lista
tworzy ciąg graficzny. Wykorzystaj predykat sortujący z poprzedniego zadania.
(3 pkt.).

- [x] **Zadanie 3**
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

- [x] **Zadanie 4.1**

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

	- Lepiej rozpisane zasady:
		- A - w swojej turze ruszamy się jednym pionkiem
		- B - pionek porusza się o jedno pole
		- C i D - w turze dozwolone jest ruszenie jednym pionkiem
		- E i F - na jednym polu może znajdować się jeden pionek, w trakcie i po ruchu
		- G - można przeskakiwać inne pionki (nie tracąc ruchu - przeskakując przez dwa pionki x bedzie wiekszy o 3 pola - liczy się jako jeden ruch)
		-  
		- H - bez znaczenia, nie ma zasad co do pionka położonego najbardziej na lewo
		- I - bez znaczenia, liczba pionkow najbardziej na prawo tak jak w E i F
		- J, K, L - bez znaczenia, pionki nie poruszają się w lewo 

## Autorzy

Michał Ziemiec
	- https://github.com/Mixss

Kacper Cencelewski
	- https://github.com/kapselccc

Paweł Cichowski
	- https://github.com/Silentsky0

## Licencja
Projekt jest obejmowany przez licencję [MIT](https://choosealicense.com/licenses/mit/)


