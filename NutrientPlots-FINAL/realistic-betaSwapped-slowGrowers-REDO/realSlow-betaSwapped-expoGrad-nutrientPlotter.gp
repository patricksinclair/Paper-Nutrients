#the double ## lines can be readded for linux systems
reset
set t pngcairo enhanced size 1000, 750 
#set key outside right top vertical Left enhanced noautotitle nobox
unset key

set lmargin 10.6
set rmargin 4
set tmargin 2
set bmargin 4

set tics font ", 20" nomirror
set xtics 100
set xlabel offset 0, -0.4 font ", 22"
set ylabel offset -1.2, 0 font ", 22"

growthSpeed = 'slow'
modelType = 'realistic_betaSwapped'
preciseVal = ''
##filepath='/home/s1212500/PhD/NutrientPlots-FINAL/'.modelType.'-'.growthSpeed.'Growers/plots/'

specific_alpha = '0.004884694070738408'
alphaVal = '0.05'
duration=2000.0
nMeasurements=20.0
interval=duration/nMeasurements

set style arrow 4 head filled size screen 0.03,15 ls 2 lw 3 lc 'black'
arrowStart = 80
arrowFinish = 340
arrowHeightPopDistb = 550
arrowHeightGRate = 0.94

labelFontSize=200
labelStart = arrowFinish+5
labelHeightPopDistb = arrowHeightPopDistb+1
labelHeightGRate = arrowHeightGRate+0.004


max_col = 22





########### - POPULATION DISTRIBUTIONS - #####################
##set out filepath.''.modelType.'-'.growthSpeed.'Growers-linearGradient-spatialDistb'.preciseVal.'.png'
set output modelType.'-'.growthSpeed.'Growers-alpha='.alphaVal.'-spatialDistb'.preciseVal.'.png'

set ylabel 'Population' 
set xlabel 'Microhabitat' 
set arrow from arrowStart,arrowHeightPopDistb to arrowFinish,arrowHeightPopDistb as 4
set label 'time' at labelStart,labelHeightPopDistb left font ",22"

plot for [i=2:max_col] modelType.'-'.growthSpeed.'Growers-alpha='.alphaVal.'-spatialDistribution'.preciseVal.'-FINAL.txt' u 1:i:((i-1)%5==0?(0xff0000):0) w l lc rgbcolor variable lw 2.8

########### - GROWTH RATE DISTRIBUTIONS - ################
set output modelType.'-'.growthSpeed.'Growers-alpha='.alphaVal.'-gRateDistb'.preciseVal.'.png'
set ytics 0.2
set ylabel 'Growth rate'
set xlabel 'Microhabitat'

unset arrow
unset label
set arrow from arrowStart,arrowHeightGRate to arrowFinish,arrowHeightGRate as 4
set label 'time' at labelStart,labelHeightGRate left font ",22"

plot for [i=2:max_col] modelType.'-'.growthSpeed.'Growers-alpha='.alphaVal.'-gRateDistribution'.preciseVal.'-FINAL.txt' u 1:i:((i-1)%5==0?(0x00ff00):0) w l lc rgbcolor variable lw 2.8

####### - PRECISE POPULATION DISTRIBUTIONS - ######################
preciseVal = '_precise'
preciseDuration = duration/5.0
preciseInterval = preciseDuration/nMeasurements

set output modelType.'-'.growthSpeed.'Growers-alpha='.alphaVal.'-spatialDistb'.preciseVal.'.png'
set ytics 100
set ylabel 'Population' 
set xlabel 'Microhabitat'
unset arrow
unset label
set arrow from arrowStart,arrowHeightPopDistb to arrowFinish,arrowHeightPopDistb as 4
set label 'time' at labelStart,labelHeightPopDistb left font ",22"

plot for [i=2:max_col] modelType.'-'.growthSpeed.'Growers-alpha='.alphaVal.'-spatialDistribution'.preciseVal.'-FINAL.txt' u 1:i:((i-1)%5==0?(0xff0000):0) w l lc rgbcolor variable lw 2.8


########### - PRECISE GROWTH RATE DISTRIBUTIONS - ################
set output modelType.'-'.growthSpeed.'Growers-alpha='.alphaVal.'-gRateDistb'.preciseVal.'.png'
set ytics 0.2
set ylabel 'Growth rate'
set xlabel 'Microhabitat'

unset arrow
unset label
set arrow from arrowStart,arrowHeightGRate to arrowFinish,arrowHeightGRate as 4
set label 'time' at labelStart,labelHeightGRate left font ",22"

plot for [i=2:max_col] modelType.'-'.growthSpeed.'Growers-alpha='.alphaVal.'-gRateDistribution'.preciseVal.'-FINAL.txt' u 1:i:((i-1)%5==0?(0x00ff00):0) w l lc rgbcolor variable lw 2.8


