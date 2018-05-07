from ortools.constraint_solver import pywrapcp

solver = pywrapcp.Solver('Riddler')

kBase = 10

digits = (0, kBase)
digits_without_zero = (1, kBase)

a = solver.IntVar(*digits_without_zero, 'A')
b = solver.IntVar(*digits, 'B')
c = solver.IntVar(*digits, 'C')
d = solver.IntVar(*digits, 'D')
e = solver.IntVar(*digits_without_zero, 'E')

letters = [a, b, c, d, e]

solver.Add(solver.AllDifferent(letters))

solver.Add(4 * (a * kBase * kBase * kBase * kBase * kBase + b * kBase * kBase * kBase * kBase+ c * kBase * kBase * kBase + c * kBase * kBase + d * kBase + e) == e * kBase * kBase * kBase * kBase * kBase + d * kBase * kBase * kBase * kBase+ c * kBase * kBase * kBase + c * kBase * kBase + b * kBase + a)

db = solver.Phase(letters, solver.INT_VAR_DEFAULT, solver.INT_VALUE_DEFAULT)

solver.NewSearch(db)

while solver.NextSolution():
    print(letters)
