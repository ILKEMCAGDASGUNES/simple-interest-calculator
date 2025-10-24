#!/usr/bin/env bash
# --------------------------------------------
# Simple Interest Calculator
# --------------------------------------------
# Usage:
#   ./simple-interest.sh <principal> <rate> <time>
# Example:
#   ./simple-interest.sh 1000 5 2
# --------------------------------------------

p="$1"   # Principal amount
r="$2"   # Annual interest rate in percent
t="$3"   # Time period in years

# Validate input
if [[ -z "$p" || -z "$r" || -z "$t" ]]; then
  echo "Usage: $0 <principal> <rate> <time>"
  echo "Example: $0 1000 5 2"
  exit 1
fi

# Calculate simple interest and total amount
interest=$(awk -v p="$p" -v r="$r" -v t="$t" 'BEGIN { printf "%.2f", (p*r*t)/100 }')
amount=$(awk -v p="$p" -v i="$interest" 'BEGIN { printf "%.2f", p+i }')

# Display results
echo "Principal:       $p"
echo "Rate (%):        $r"
echo "Time (years):    $t"
echo "Simple Interest: $interest"
echo "Total Amount:    $amount"
