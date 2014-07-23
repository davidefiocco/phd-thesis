./lmp_serial < batch.in |grep -A5 ecco|grep -B1 '\-\-'|grep -v '\-\-' > thermo.log
