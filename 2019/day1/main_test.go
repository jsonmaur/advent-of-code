package main

import "testing"

func TestFuelNeededByMass(t *testing.T) {
	tests := []struct {
		input  int
		output int
	}{
		{12345, 6147},
	}

	for _, test := range tests {
		res := FuelNeededByMass(&test.input)
		if res != test.output {
			t.Errorf("Expected %d, got %d", test.output, res)
		}
	}
}
