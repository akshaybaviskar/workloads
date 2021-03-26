rm /tmp/alloctest-graph.ready &>/dev/null
rm /tmp/alloctest-graph.done &>/dev/null

BM_NAME=$1
THP=$2
BM_PID=$3

echo "mkdir /home/akshay/work/Yaniv/home/idanyani/hash-vs-radix/benchmarks/$BM_NAME"
mkdir /home/akshay/work/Yaniv/home/idanyani/hash-vs-radix/benchmarks/$BM_NAME

PERFOP="/home/akshay/work/Yaniv/home/idanyani/hash-vs-radix/benchmarks/$BM_NAME/$THP"


while [ ! -f /tmp/alloctest-graph.ready ]; do
            sleep 0.05
done

echo "perf stat -p $BM_PID  -e mem_inst_retired.all_loads:u,mem_inst_retired.all_stores:u,mem_inst_retired.stlb_miss_loads:u,mem_inst_retired.stlb_miss_stores:u 2> $PERFOP"
perf stat -p $BM_PID  -e mem_inst_retired.all_loads:u,mem_inst_retired.all_stores:u,mem_inst_retired.stlb_miss_loads:u,mem_inst_retired.stlb_miss_stores:u 2> $PERFOP

PERF_PID=$!

while [ ! -f /tmp/alloctest-graph.done ]; do
            sleep 0.05
done

kill -INT $PERF_PID
