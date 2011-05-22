#!/usr/bin/env awk -f
/\$Length\$/ { 
	system("wget 'http://betaplace.emaitie.de/webapps.relation-analyzer/analyze.jsp?relationId="$3"' -q -O temp.html") 

  	t = "cat temp.html | grep 'Relation length ca.:' | sed 's/.*<b>\\(.*\\) KM<\\/b>/\\1/'" 
  	s = "cat temp.html | grep 'Unconnected segments:' | sed 's/.*<b>\\(.*\\)<\\/b>/\\1/'" 

   a = "0"
   b = "1"

	t | getline a
	s | getline b
	close(t)
	close(s)
	print "| "a
	print "| "b
}
/^[^$]*$/ 
