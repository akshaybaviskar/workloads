rm /tmp/alloctest-redis.ready &>/dev/null
rm /tmp/alloctest-redis.done &>/dev/null

BM_PID=$1

while [ ! -f /tmp/alloctest-redis.ready ]; do
            sleep 0.1
done

echo "perf stat -p $BM_PID -e inst_retired.any_p:u,mem_inst_retired.all_loads:u,mem_inst_retired.all_stores:u,dtlb_store_misses.stlb_hit:u,dtlb_load_misses.stlb_hit:u,mem_inst_retired.stlb_miss_loads:u,mem_inst_retired.stlb_miss_stores:u,dtlb_store_misses.walk_pending:u,dtlb_load_misses.walk_pending:u,cycles:u"
perf stat -p $BM_PID -e inst_retired.any_p:u,mem_inst_retired.all_loads:u,mem_inst_retired.all_stores:u,dtlb_store_misses.stlb_hit:u,dtlb_load_misses.stlb_hit:u,mem_inst_retired.stlb_miss_loads:u,mem_inst_retired.stlb_miss_stores:u,dtlb_store_misses.walk_pending:u,dtlb_load_misses.walk_pending:u,cycles:u


while [ ! -f /tmp/alloctest-redis.done ]; do
            sleep 0.1
done
