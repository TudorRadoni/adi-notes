#!/bin/bash

# Help function
Help()
{
    echo "Usage: $0 [-i <ip>] [-n <n>]"
    echo "Example: $0 -i 10.76.84.153 -n 10"
}

# About function
About()
{
    echo "This script writes values '1 to n' to AD5592R channels '0 to 5'."
    echo "  Targer IP: $1"
    echo "  Number of values to write: $2"
    echo
}

# Check if there are 4 arguments
if [ $# -ne 4 ]; then
    Help
    exit 1
fi

# Check if the user needs help
if [ $1 == "-h" ] || [ $1 == "--help" ]; then
    Help
    exit 0
fi

# Parse command line arguments
while getopts ":i:n:" option; do
    case $option in
        i) # IP address
            ip=$OPTARG
            # echo "IP: $OPTARG"
            ;;
        n) # number of values to write
            n=$OPTARG
            # echo "n: $OPTARG"
            ;;
        ?) # unknown option
            echo "Error: Unknown option: -$OPTARG"
            Help
            exit 1
            ;;
    esac
done

About $ip $n

for i in $(seq 1 $n)
do
    # Write to channels 0 to 5
    for chan in $(seq 0 5)
    do
        OUTPUT=$(iio_attr -u ip:${ip} -c ad5592r_s voltage${chan} raw ${i})
        echo "Writing to channel ${chan} value ${OUTPUT}"
    done

    echo
    
    # Delay of 1 second
    sleep 1
done
