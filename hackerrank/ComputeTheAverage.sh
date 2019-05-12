sum="0";
read n;
for ((i=0;i<$n;i++)); do read v; sum=$sum+$v; done;
printf %.3f $(echo "(${sum})/${n}" | bc -l);
