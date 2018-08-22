reset 
set t pngcairo enhanced size 1000, 750 font ",20"
unset key
set out 'example_gRate.png'

beta=6.
S=500.
K=33.

phi_c_raw(x)=1.-(x/beta)*(x/beta)

phi_c(x)=(phi_c_raw(x)>0.) ? phi_c_raw(x) : 0.

f(x)=phi_c(x)*(S/(K+S))

set xrange[0:10]
set ytics 0.2
set ylabel 'Growth rate'
set xlabel 'antibiotic concentration'

p f(x) w l lc rgb '#09a623' lw 6
