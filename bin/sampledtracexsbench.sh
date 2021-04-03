rm /tmp/alloctest-xsbench.ready &>/dev/null
rm /tmp/alloctest-xsbench.done &>/dev/null

BM_NAME=$1
BM_PID=$2

echo "mkdir /home/akshaybavisk/work/Yaniv/home/idanyani/hash-vs-radix/benchmarks/$BM_NAME"
mkdir /home/akshaybavisk/work/Yaniv/home/idanyani/hash-vs-radix/benchmarks/$BM_NAME

echo "mkdir /home/akshaybavisk/work/Yaniv/home/idanyani/hash-vs-radix/benchmarks/$BM_NAME/VMAs"
mkdir /home/akshaybavisk/work/Yaniv/home/idanyani/hash-vs-radix/benchmarks/$BM_NAME/VMAs

while [ ! -f /tmp/alloctest-xsbench.ready ]; do
            sleep 0.1
done

echo "pin -pid $BM_PID -t /home/akshaybavisk/work/pin-3.16-98275-ge0db48c31-gcc-linux/source/tools/ManualExamples/obj-intel64/SamplingSimulator.so -o /home/akshaybavisk/work/Yaniv/home/idanyani/hash-vs-radix/benchmarks/$BM_NAME/$BM_NAME"
pin -pid $BM_PID -t /home/akshaybavisk/work/pin-3.16-98275-ge0db48c31-gcc-linux/source/tools/ManualExamples/obj-intel64/SamplingSimulator.so -o /home/akshaybavisk/work/Yaniv/home/idanyani/hash-vs-radix/benchmarks/$BM_NAME/$BM_NAME

while [ ! -f /tmp/alloctest-xsbench.done ]; do
            sleep 0.1
done
