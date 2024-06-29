#!/bin/bash

if [ "$1" == "--date" ]; then
  date
fi
#!/bin/bash

if [ "$1" == "--logs" ]; then
  for i in {1..100}; do
    echo -e "log$i.txt
$0
$(date)" > log$i.txt
  done
fi
#!/bin/bash

if [ "$1" == "--logs" ]; then
  num_files=${2:-100}
  for i in $(seq 1 $num_files); do
    echo -e "log$i.txt
$0
$(date)" > log$i.txt
  done
fi
