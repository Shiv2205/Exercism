package clock

import "fmt"

// Define the Clock type here.
type Clock struct {
	hour int
	minute int
}

func New(h, m int) Clock {
	cHour := mod(h,24)
	cMinute := mod(m,60)
	numHours := (max(m, -m) / 60)
	if m >= 60 {
		for range(numHours) { cHour++ }
	}
	if m < 0 {
		cHour--
		if m < -60 {
			for range(numHours) { cHour-- }
		}
	}

	return Clock{
		hour: mod(cHour, 24),
		minute: cMinute,
	}
}

func (c Clock) Add(m int) Clock {
	return New(c.hour, c.minute + m)
}

func (c Clock) Subtract(m int) Clock {
	return New(c.hour, c.minute - m)
}

func (c Clock) String() string {
	cleanC := New(c.hour, c.minute)
	return fmt.Sprintf("%02d:%02d", cleanC.hour, cleanC.minute)
}

func mod(a, b int) int {
	return ((a % b) + b) % b
}
