import pathlib

grid = {'0,0': 2}
santa = [0, 0]
robo = [0, 0]
is_robo = False

def move(coords, direction):
    if direction == '^': return [coords[0], coords[1] - 1]
    if direction == 'v': return [coords[0], coords[1] + 1]
    if direction == '<': return [coords[0] - 1, coords[1]]
    if direction == '>': return [coords[0] + 1, coords[1]]

base_path = pathlib.Path(__file__).parent.absolute()
with open(f'{base_path}/input.txt', 'r') as reader:
    data = reader.read().strip()

    for index in range(len(data)):
        if is_robo:
            robo = move(robo, data[index])
            pos = f'{robo[0]},{robo[1]}'
            is_robo = False
        else:
            santa = move(santa, data[index])
            pos = f'{santa[0]},{santa[1]}'
            is_robo = True

        if pos in grid: grid[pos] += 1
        else: grid[pos] = 1

print(f'{len(grid)} houses received at least one present')
