package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func RunIntcode(noun, verb int, initial *string) (*string, error) {
	intcode := strings.Split(*initial, ",")
	if len(intcode) < 4 {
		return initial, nil
	}

	intcode[1] = strconv.Itoa(noun)
	intcode[2] = strconv.Itoa(verb)

L:
	for i := 0; i < len(intcode); i += 4 {
		opcode := intcode[i]
		if len(intcode) < i+4 {
			break
		}

		aIndex, _ := strconv.Atoi(intcode[i+1])
		bIndex, _ := strconv.Atoi(intcode[i+2])

		a, err := strconv.Atoi(intcode[aIndex])
		if err != nil {
			return nil, err
		}

		b, err := strconv.Atoi(intcode[bIndex])
		if err != nil {
			return nil, err
		}

		c, err := strconv.Atoi(intcode[i+3])
		if err != nil {
			return nil, err
		}

		switch opcode {
		case "1":
			intcode[c] = strconv.Itoa(a + b)
		case "2":
			intcode[c] = strconv.Itoa(a * b)
		case "99":
			break L
		default:
			return nil, fmt.Errorf("Unknown opcode: %s", opcode)
		}
	}

	output := strings.Join(intcode, ",")
	return &output, nil
}

func FindOutputWithLimit(limit, output int, initial *string) (*int, error) {
	for i := 0; i < limit; i++ {
		for j := 0; j < limit; j++ {
			res, err := RunIntcode(i, j, initial)
			if err != nil {
				return nil, err
			}

			if strconv.Itoa(output) == (*res)[:strings.IndexByte(*res, ',')] {
				a := limit*i + j
				return &a, nil
			}
		}
	}

	return nil, fmt.Errorf("Could not find output: %v", output)
}

func main() {
	file, err := os.Open("input.txt")
	if err != nil {
		panic(err)
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		contents := scanner.Text()

		intcode, err := RunIntcode(12, 2, &contents)
		if err != nil {
			panic(err)
		}
		output, err := FindOutputWithLimit(100, 19690720, &contents)
		if err != nil {
			panic(err)
		}

		fmt.Printf("Intcode: %v\n", *intcode)
		fmt.Printf("Output: %v\n", *output)
	}

	if err := scanner.Err(); err != nil {
		panic(err)
	}
}
