reset
set t pngcairo enhanced size 1000, 750 
set view map


growthSpeed = 'slow'
modelType = 'simple'
gradientVal = 'exponential-'

filepath = '/home/s1212500/PhD/NutrientPlots-FINAL/simple-slowGrowers/contour_plots/'

stats filepath.''.modelType.'-slowGrowers_nutrients_vs_'.gradientVal.'antibiotic-contourPlot-FINAL.txt' using 3 name 'z' nooutput

set rmargin 40
set lmargin 1
set tmargin 0
set bmargin 1

set key noautotitle
set tic font ", 20" nomirror
set ytics 0.02

set xlabel 'Nutrients per microhabitat' font ", 22" offset 0,-1
set ylabel 'α' font ", 22" offset -4.,0 
set cblabel 'Population (x10^5)' font ", 22" offset -2,0
set format cb "%.2t"; set cbtics z_max
set cbrange [0:z_max]


set output modelType.'-'.growthSpeed.'Growers-S_Vs_Alpha-contours.png'

splot modelType.'-'.growthSpeed.'Growers_nutrients_vs_'.gradientVal.'antibiotic-contourPlot-FINAL.txt' u 2:1:3 w pm3d
