../lmp_linux < batch.in |grep -A5 minimization|grep -A3 PotEng|grep -B1 Loop|grep -v Loop|grep -v '\-\-' > thermo.log
