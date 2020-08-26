#!/usr/bin/python3
import sys

bat1 = 0
bat2 = 0
bat1charging = False
bat2charging = False
chargeicon = '\uf0e7'

greenfg = "%{F#98c379}" 
redfg = "%{F#e06c75}" 
reset = '%{F-}'

with open('/sys/class/power_supply/BAT1/capacity') as infile:
    bat1 = int(infile.readline().strip())

with open('/sys/class/power_supply/BAT2/capacity') as infile:
    bat2 = int(infile.readline().strip())

with open('/sys/class/power_supply/BAT1/status') as infile:
    bat1charging = infile.readline().strip() == 'Charging'

with open('/sys/class/power_supply/BAT2/status') as infile:
    bat2charging = infile.readline().strip() == 'Charging'

# battery level icons
levels = ['\uf244', '\uf243', '\uf242', '\uf241', '\uf240', '\uf240']

# get icon for given level
getlevel = lambda l: levels[l//20]

if not bat1charging:
    b1color = redfg if bat1 < 20 else reset
else:
    b1color = greenfg

if not bat2charging:
    b2color = redfg if bat2 < 20 else reset
else:
    b2color = greenfg

b1dispcharge = chargeicon if bat1charging else ''
b2dispcharge = chargeicon if bat2charging else ''

print(f'{b1color}{getlevel(bat1)} {b1dispcharge} {bat1}%{reset} | {b2color}{getlevel(bat2)} {b2dispcharge} {bat2}%{reset}')
