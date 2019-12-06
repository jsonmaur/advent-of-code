package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func NearestIntersect(paths *[]*[]string) (int, error) {
	var distance int
	grid := map[string]map[int]int{}

	for line, path := range *paths {
		var x, y, steps int
		for _, movement := range *path {
			direction := movement[0:1]
			total, err := strconv.Atoi(movement[1:])
			if err != nil {
				return 0, err
			}

			for i := 0; i < total; i++ {
				steps++

				switch direction {
				case "L":
					x -= 1
				case "R":
					x += 1
				case "U":
					y += 1
				case "D":
					y -= 1
				default:
					return 0, fmt.Errorf("%s is not a valid direction", direction)
				}

				key := fmt.Sprintf("%d_%d", x, y)

				if _, ok := grid[key]; !ok {
					grid[key] = map[int]int{}
				}
				if stepsPrev, ok := grid[key][line]; !ok || steps < stepsPrev {
					grid[key][line] = steps

					if len(grid[key]) > 1 {
						intersectDistance := 0
						for _, lineDistance := range grid[key] {
							intersectDistance += lineDistance
						}

						if intersectDistance < distance || distance == 0 {
							distance = intersectDistance
						}
					}
				}

			}
		}
	}

	return distance, nil
}

func main() {
	file, err := os.Open("input.txt")
	if err != nil {
		panic(err)
	}
	defer file.Close()

	var paths []*[]string

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		line := strings.TrimSpace(scanner.Text())
		path := strings.Split(line, ",")
		paths = append(paths, &path)
	}

	if err := scanner.Err(); err != nil {
		panic(err)
	}

	distance, err := NearestIntersect(&paths)
	if err != nil {
		panic(err)
	}

	fmt.Printf("Distance: %v\n", distance)
}
