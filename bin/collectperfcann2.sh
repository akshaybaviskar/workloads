rm /tmp/alloctest-canneal.ready &>/dev/null
rm /tmp/alloctest-canneal.done &>/dev/null

BM_NAME=$1
THP=$2
BM_PID=$3

echo "mkdir /home/akshay/work/Yaniv/home/idanyani/hash-vs-radix/benchmarks/$BM_NAME"
mkdir /home/akshay/work/Yaniv/home/idanyani/hash-vs-radix/benchmarks/$BM_NAME

PERFOP="/home/akshay/work/Yaniv/home/idanyani/hash-vs-radix/benchmarks/$BM_NAME/$THP"

while [ ! -f /tmp/alloctest-canneal.ready ]; do
            sleep 0.1
done

echo "perf stat -p $BM_PID  -e cycles:u,dtlb_store_misses.walk_pending:u,dtlb_load_misses.walk_pending:u,ept.walk_pending:u 2> $PERFOP"
perf stat -p $BM_PID  -e cycles:u,dtlb_store_misses.walk_pending:u,dtlb_load_misses.walk_pending:u,ept.walk_pending:u 2> $PERFOP

PERF_PID=$!

while [ ! -f /tmp/alloctest-canneal.done ]; do
            sleep 0.1
done

kill -INT $PERF_PID
