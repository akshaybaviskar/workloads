#cat /proc/vmstat > ../pmigrate_4K/gups_64_32_vmstat1
#perf stat -e mem_load_l3_miss_retired.remote_dram,mem_inst_retired.all_loads:u,mem_inst_retired.all_stores:u,mem_inst_retired.stlb_miss_loads:u,mem_inst_retired.stlb_miss_stores:u ./gups_64_32 2> ../pmigrate_4K/gups_64_32_perf
#cat /proc/vmstat > ../pmigrate_4K/gups_64_32_vmstat2
#
#cat /proc/vmstat > ../pmigrate_4K/gups_128_32_vmstat1
#perf stat -e mem_load_l3_miss_retired.remote_dram,mem_inst_retired.all_loads:u,mem_inst_retired.all_stores:u,mem_inst_retired.stlb_miss_loads:u,mem_inst_retired.stlb_miss_stores:u ./gups_128_32 2> ../pmigrate_4K/gups_128_32_perf
#cat /proc/vmstat > ../pmigrate_4K/gups_128_32_vmstat2

cat /proc/vmstat > ../pmigrate_4K/numa_gups_64_32_vmstat1
perf stat -e mem_load_l3_miss_retired.remote_dram,mem_inst_retired.all_loads:u,mem_inst_retired.all_stores:u,mem_inst_retired.stlb_miss_loads:u,mem_inst_retired.stlb_miss_stores:u ./numa_gups_64_32 2> ../pmigrate_4K/numa_gups_64_32_perf
cat /proc/vmstat > ../pmigrate_4K/numa_gups_64_32_vmstat2

cat /proc/vmstat > ../pmigrate_4K/numa_gups_128_32_vmstat1
perf stat -e mem_load_l3_miss_retired.remote_dram,mem_inst_retired.all_loads:u,mem_inst_retired.all_stores:u,mem_inst_retired.stlb_miss_loads:u,mem_inst_retired.stlb_miss_stores:u ./numa_gups_128_32 2> ../pmigrate_4K/numa_gups_128_32_perf
cat /proc/vmstat > ../pmigrate_4K/numa_gups_128_32_vmstat2

