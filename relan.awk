#!/usr/bin/env awk -f
/\$Length\$/ { 
	system("wget 'http://ra.osmsurround.org/analyzeRelation?relationId="$3"&noCache=true&_noCache=on' -q -O temp.html --user-agent Mozilla/4.0")
	#system("wget 'http://ra.osmsurround.org/analyzeRelation?relationId="$3"' -q -O temp.html") 

    t = "cat temp.html | grep 'Length in KM: <span class=\"label label-info\">.*</span>' | sed 's/Length in KM: <span class=\"label label-info\">\\(.*\\)<\\/span>/\\1/' | awk '{s+=$1} END {print s}' /dev/stdin"
  	s = "cat temp.html | grep '<p>Graph' | tail -n 1 | sed 's/.*<p>Graph&nbsp;\\(.*\\) (.*<\\/p>.*/\\1/'" 

   a = "0"
   b = "1"

	t | getline a
	s | getline b
	close(t)
	close(s)
   printf "| %.2f\n", a
   printf "| %s\n", b
}
/^[^$]*$/ 
