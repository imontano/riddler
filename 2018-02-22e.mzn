/** Riddler Express **/
/** Minizinc CP solution by I. Montano **/

/* Declare variables */
/* Ages of islanders */
var 0..25: a;
var 0..25: b;
var 0..25: c;
var 0..25: d;
var 0..25: e;

/* Age limit */
var 0..25: l;

/* Constraints if islanders are telling the truth (age less than l) */
constraint (l > a) <-> ((b > 20) /\ (d > 16));
constraint (l > b) <-> ((c > 18) /\ (e < 20));
constraint (l > c) <-> ((d < 22) /\ (a == 19));
constraint (l > d) <-> ((e != 17) /\ (b == 20));
constraint (l > e) <-> ((a > 21) /\ (c < 18));

/* Constraints if islanders are lying (age greater than or equal to l) */
constraint (l <= a) <-> ((b <= 20) /\ (d <= 16));
constraint (l <= b) <-> ((c <= 18) /\ (e >= 20));
constraint (l <= c) <-> ((d >= 22) /\ (a != 19));
constraint (l <= d) <-> ((e == 17) /\ (b != 20));
constraint (l <= e) <-> ((a <= 21) /\ (c >= 18));

solve satisfy;
