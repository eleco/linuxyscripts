
# awk script that outputs all the lines from file1.csv where 
# the 2nd column has no equivalent in file2.csv
# and vice versa

BEGIN {
  while (getline < "file1.csv") {
    line=$0;
    split(line,f," ");
    key=f[2];
    f1[key]=line
  }
  while (getline < "file2.csv") {
    line=$0;
    split(line,f," ");
    key=f[2];
    f2[key]=line
  }
}
END {
  for (c in f1) {
    if (c in f2 == 0) print f1[c]
  }
  for (c in f2) {
    if (c in f1 == 0) print f2[c]
  }
}