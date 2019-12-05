package main

import "testing"

func TestFuelNeededByMass(t *testing.T) {
	tests := []struct {
		input  float64
		output float64
	}{
		{12345, 6147},
	}

	for _, test := range tests {
		res := FuelNeededByMass(&test.input)
		if res != test.output {
			t.Errorf("Expected %f, got %f", test.output, res)
		}
	}
}
