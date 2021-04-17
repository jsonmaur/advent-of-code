import pathlib

grid = {'0,0': 1}
santa = [0, 0]

base_path = pathlib.Path(__file__).parent.absolute()
with open(f'{base_path}/input.txt', 'r') as reader:
    data = reader.read().strip()

    for index in range(len(data)):
        if data[index] == '^': santa[0] -= 1
        if data[index] == 'v': santa[0] += 1
        if data[index] == '<': santa[1] -= 1
        if data[index] == '>': santa[1] += 1

        pos = f'{santa[0]},{santa[1]}'

        if pos in grid: grid[pos] += 1
        else: grid[pos] = 1

print(f'{len(grid)} houses received at least one present')
