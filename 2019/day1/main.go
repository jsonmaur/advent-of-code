package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

func FuelNeededByMass(mass *int) int {
	fuel := (*mass / 3) - 2
	if fuel <= 0 {
		return 0
	}

	return fuel + FuelNeededByMass(&fuel)
}

func main() {
	file, err := os.Open("input.txt")
	if err != nil {
		panic(err)
	}
	defer file.Close()

	total := 0
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		mass, err := strconv.Atoi(scanner.Text())
		if err != nil {
			panic(err)
		}

		total += FuelNeededByMass(&mass)
	}

	if err := scanner.Err(); err != nil {
		panic(err)
	}

	fmt.Printf("Fuel Needed: %d\n", total)
}
