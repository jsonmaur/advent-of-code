package main

import (
	"fmt"
	"strconv"
)

func PasswordValid(pass int) bool {
	ok := false
	upper := '0'
	currentChar := '0'
	currentCharCount := 0
	text := strconv.Itoa(pass)

	for _, char := range text {
		if char < upper {
			return false
		}
		upper = char

		if currentChar != char {
			if currentCharCount == 2 {
				ok = true
			}
			currentChar = char
			currentCharCount = 1
		} else {
			currentCharCount++
		}
	}

	return ok || currentCharCount == 2
}

func PasswordCount(lo, hi int) (count int) {
	for i := lo; i <= hi; i++ {
		if PasswordValid(i) {
			count++
		}
	}

	return
}

func main() {
	fmt.Println("Password Count:", PasswordCount(372037, 905157))
}
