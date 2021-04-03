cat /proc/vmstat > ../pmigrate_2M/btree_1000_100_vmstat1
perf stat -e mem_load_l3_miss_retired.remote_dram,mem_inst_retired.all_loads:u,mem_inst_retired.all_stores:u,mem_inst_retired.stlb_miss_loads:u,mem_inst_retired.stlb_miss_stores:u ./btree_1000_100 2> ../pmigrate_2M/btree_1000_100_perf
cat /proc/vmstat > ../pmigrate_2M/btree_1000_100_vmstat2

cat /proc/vmstat > ../pmigrate_2M/btree_2000_100_vmstat1
perf stat -e mem_load_l3_miss_retired.remote_dram,mem_inst_retired.all_loads:u,mem_inst_retired.all_stores:u,mem_inst_retired.stlb_miss_loads:u,mem_inst_retired.stlb_miss_stores:u ./btree_2000_100 2> ../pmigrate_2M/btree_2000_100_perf
cat /proc/vmstat > ../pmigrate_2M/btree_2000_100_vmstat2

cat /proc/vmstat > ../pmigrate_2M/numa_btree_1000_100_vmstat1
perf stat -e mem_load_l3_miss_retired.remote_dram,mem_inst_retired.all_loads:u,mem_inst_retired.all_stores:u,mem_inst_retired.stlb_miss_loads:u,mem_inst_retired.stlb_miss_stores:u ./numa_btree_1000_100 2> ../pmigrate_2M/numa_btree_1000_100_perf
cat /proc/vmstat > ../pmigrate_2M/numa_btree_1000_100_vmstat2

cat /proc/vmstat > ../pmigrate_2M/numa_btree_2000_100_vmstat1
perf stat -e mem_load_l3_miss_retired.remote_dram,mem_inst_retired.all_loads:u,mem_inst_retired.all_stores:u,mem_inst_retired.stlb_miss_loads:u,mem_inst_retired.stlb_miss_stores:u ./numa_btree_2000_100 2> ../pmigrate_2M/numa_btree_2000_100_perf
cat /proc/vmstat > ../pmigrate_2M/numa_btree_2000_100_vmstat2

