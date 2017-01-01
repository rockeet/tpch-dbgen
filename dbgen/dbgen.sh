#!/bin/bash

mkfifo customer.tbl
mkfifo lineitem.tbl
mkfifo nation.tbl
mkfifo orders.tbl
mkfifo part.tbl
mkfifo partsupp.tbl
mkfifo region.tbl
mkfifo supplier.tbl

function pipe_gzip() {
  local fname=$1
  tee < $fname >(wc -clL > ${fname}.wc) | gzip -c --fast > ${fname}.gz &
}

pipe_gzip customer.tbl
pipe_gzip lineitem.tbl
pipe_gzip nation.tbl
pipe_gzip orders.tbl
pipe_gzip part.tbl
pipe_gzip partsupp.tbl
pipe_gzip region.tbl
pipe_gzip supplier.tbl

# call dbgen
$@

echo dbgen exited, wait for compressing complete...
echo if not dbgen all tables, wait for a moment and press Ctrl+C
wait
rm *.tbl
echo all done!

