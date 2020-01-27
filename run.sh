RUNDIR=res-tpcc-PXC8-single-`date +%F-%H-%M`
runid="1"
#for i in 16 64 128 256
for i in 1 2 4 8 16 64 128 256
do
     	OUTDIR=$RUNDIR/$runid/thr$i
        mkdir -p $OUTDIR

        time=3600
	./tpcc.lua --mysql-host=139.178.88.121 --mysql-user=sbtest --mysql-password=sbtest --mysql-db=sbtest --time=3600 --threads=$i --report-interval=1 --tables=100 --scale=10 --trx_level=RR  --db-driver=mysql --report_csv=yes --mysql-ignore-errors=3100,3101,1213,1180 run |  tee -a $OUTDIR/res.txt

	sleep 30
	done
