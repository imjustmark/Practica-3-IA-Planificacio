from random import randint
import sys
import os


ciutats = []
hotels = []
vols = []
num_ciutats = int(sys.argv[1])
f = open("problema.pddl", "w", encoding="utf-8")
f.write(""" (define (problem viatges) 
                (:domain dominiViatges4)
                (:objects """)
for i in range(0,num_ciutats):
    ciu = "c" + str(i)
    f.write(ciu + " ")
    ciutats.append(ciu)
f.write("- ciutat\n")

num_hotels_per_ciutat = []
f.write("\t \t \t \t")
for i in range(0,num_ciutats):
    num_hotels = randint(1,5)
    num_hotels_per_ciutat.append(num_hotels)
    for j in range(0,num_hotels):
        hot = "h" + str(i) + "_" + str(j)
        f.write(hot + " ")
        hotels.append(hot)
f.write("- hotel\n")

num_vols_per_ciutat = []
f.write("\t \t \t \t")
if num_ciutats < 6:
    min = 1
    max = num_ciutats -1
else:
    min = 2
    max = 5
for i in range(0,num_ciutats):
    num_vols = randint(min,max)
    num_vols_per_ciutat.append(num_vols)
    for j in range(0,num_vols):
        vol = "v" + str(i) + "_" + str(j)
        f.write(vol + " ")
        vols.append(vol)
f.write("- vol\n")
f.write("\t \t \t \t")
f.write(")\n")
f.write("\t \t \t \t")
f.write("(:init\n")

n = 0
for i in range(0,len(ciutats)):
    c = ciutats[i]
    num_hotels = num_hotels_per_ciutat[i]
    for j in range(n, n+num_hotels):
        h = hotels[j]
        f.write("\t \t \t \t \t")
        f.write("(assignat " + c + " " + h + ")\n")
    n += num_hotels
f.write("\n")

n = 0
for i in range(0,len(ciutats)):
    c = ciutats[i]
    num_vols = num_vols_per_ciutat[i]

    destins = []
    k = 0
    while k < num_vols:
        r = randint(0,len(ciutats)-1)
        c_aux = ciutats[r]
        if (c_aux != c) and not(c_aux in destins):
            destins.append(c_aux)
            k += 1

    for j in range(0, num_vols):
        v = vols[n+j]
        c2 = destins[j]
        f.write("\t \t \t \t \t")
        f.write("(connecta " + v + " " + c + " " + c2 + ")\n")
    n += num_vols 
f.write("\n")

for h in hotels:
    preu = randint(20,160)
    f.write("\t \t \t \t \t")
    f.write("(= (preu_hotel " + h + ") " + str(preu) + ")\n")
f.write("\n")

for v in vols:
    preu = randint(25,80)
    f.write("\t \t \t \t \t")
    f.write("(= (preu_vol " + v + ") " + str(preu) + ")\n")
f.write("\n")

for c in ciutats:
    interes = randint(1,3)
    f.write("\t \t \t \t \t")
    f.write("(= (interes " + c + ") " + str(interes) + ")\n")
f.write("\n")

f.write("""
\t \t \t \t \t(= (num_ciutats_visitades) 0)
\t \t \t \t \t(= (num_dies_totals) 0)
\t \t \t \t \t(= (min_numero_dies) 4)
\t \t \t \t \t(= (min_dies_ciutat) 1)
\t \t \t \t \t(= (max_dies_ciutat) 4)

\t \t \t \t \t(= (preu_maxim) 4000)
\t \t \t \t \t(= (preu_minim) 200)
\t \t \t \t \t(= (preu_total) 0)
\t \t \t \t \t(= (interes_total) 0)
)""")
f.write("\n")

f.write("""    (:goal (and(>= (num_ciutats_visitades) 5)
               (>= (num_dies_totals) (min_numero_dies))
               (<= (preu_total) (preu_maxim))
               (>= (preu_total) (preu_minim))))

               (:metric minimize (+ (* 100 (interes_total)) (preu_total)))
)""")
f.write("\n")

f.close()
os.system("./ff -o domini_ext4.pddl -f problema.pddl")
