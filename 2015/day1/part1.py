import pathlib

current_floor = 0

base_path = pathlib.Path(__file__).parent.absolute()
with open(f'{base_path}/input.txt', 'r') as reader:
    data = reader.read().strip()

    for index in range(len(data)):
        if data[index] == '(': current_floor += 1
        if data[index] == ')': current_floor -= 1

print(f'Santa is on floor {current_floor}')
