package main

import "testing"

func TestPasswordValid(t *testing.T) {
	tests := []struct {
		input  int
		output bool
	}{
		{112233, true},
		{123444, false},
		{111122, true},
		{111111, false},
		{223450, false},
		{123789, false},
		{113789, true},
		{113339, true},
		{111339, true},
		{888889, false},
	}

	for _, test := range tests {
		res := PasswordValid(test.input)
		if res != test.output {
			t.Errorf("Expected %v, got %v for %v", test.output, res, test.input)
		}
	}
}

func TestPasswordCount(t *testing.T) {
	tests := []struct {
		output int
		low    int
		high   int
	}{
		{299, 372037, 905157},
	}

	for _, test := range tests {
		res := PasswordCount(test.low, test.high)
		if res != test.output {
			t.Errorf("Expected %v, got %v", test.output, res)
		}
	}
}
