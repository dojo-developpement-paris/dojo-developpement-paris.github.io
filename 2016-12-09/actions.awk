#! /usr/bin/awk -f


/^[0-9]+$/ { Case = Case + 1
             printf("%02d\n", Case)  }

/[0-9]+ [0-9]+ [0-9]+/ { printf("%02d %07d RENT %07d %07d\n", Case, $1, $2, $3)
                         printf("%02d %07d CASH\n", Case, $1+$2) }


