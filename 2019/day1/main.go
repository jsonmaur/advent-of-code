package main

import (
	"bufio"
	"fmt"
	"math"
	"os"
	"strconv"
)

func FuelNeededByMass(mass *float64) float64 {
	fuel := math.Floor(*mass/3) - 2
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

	var fuel float64

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		mass, err := strconv.ParseFloat(scanner.Text(), 64)
		if err != nil {
			panic(err)
		}

		fuel += FuelNeededByMass(&mass)
	}

	if err := scanner.Err(); err != nil {
		panic(err)
	}

	fmt.Printf("Fuel Needed: %f\n", fuel)
}
