import pathlib

paper = 0

base_path = pathlib.Path(__file__).parent.absolute()
with open(f'{base_path}/input.txt', 'r') as reader:
    for index, value in enumerate(reader):
        [l, w, h] = map(int, value.strip().split('x'))
        paper += (2 * l * w) + (2 * w * h) + (2 * h * l) + min(l * w, l * h, w * h)

print(f'Elves require {paper} sq ft of wrapping paper')
