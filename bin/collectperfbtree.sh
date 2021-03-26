rm /tmp/alloctest-btree.ready &>/dev/null
rm /tmp/alloctest-btree.done &>/dev/null

BM_NAME=$1
THP=$2
BM_PID=$3

echo "mkdir /home/akshaybavisk/work/Yaniv/home/idanyani/hash-vs-radix/benchmarks/$BM_NAME"
mkdir /home/akshaybavisk/work/Yaniv/home/idanyani/hash-vs-radix/benchmarks/$BM_NAME

PERFOP="/home/akshaybavisk/work/Yaniv/home/idanyani/hash-vs-radix/benchmarks/$BM_NAME/$BM_NAME-$THP-perf"


while [ ! -f /tmp/alloctest-btree.ready ]; do
            sleep 0.1
done

echo "perf stat -p $BM_PID -e inst_retired.any_p:u,mem_inst_retired.all_loads:u,mem_inst_retired.all_stores:u,dtlb_store_misses.stlb_hit:u,dtlb_load_misses.stlb_hit:u,mem_inst_retired.stlb_miss_loads:u,mem_inst_retired.stlb_miss_stores:u,dtlb_store_misses.walk_pending:u,dtlb_load_misses.walk_pending:u,cycles:u 2> $PERFOP"
perf stat -p $BM_PID -e inst_retired.any_p:u,mem_inst_retired.all_loads:u,mem_inst_retired.all_stores:u,dtlb_store_misses.stlb_hit:u,dtlb_load_misses.stlb_hit:u,mem_inst_retired.stlb_miss_loads:u,mem_inst_retired.stlb_miss_stores:u,dtlb_store_misses.walk_pending:u,dtlb_load_misses.walk_pending:u,cycles:u 2> $PERFOP

PERF_PID=$!

while [ ! -f /tmp/alloctest-btree.done ]; do
            sleep 0.1
done

kill -INT $PERF_PID
