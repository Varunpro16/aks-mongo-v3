# Generate a random integer to ensure unique resource names
resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

