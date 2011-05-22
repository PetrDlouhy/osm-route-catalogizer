
echo "TURISTICKÉ TRASY"
java -Xmx700M -classpath /usr/share/java/saxonb.jar net.sf.saxon.Transform kct.osm duplicity_turist.xsl | sed '/^$/d' | sort -k 3 | uniq -D -f2
echo "CYKLISTICKÉ TRASY"
java -Xmx700M -classpath /usr/share/java/saxonb.jar net.sf.saxon.Transform kct.osm duplicity_cyklo.xsl | sed '/^$/d' | sort -k 2 | uniq -D -f1
echo "KRKONOŠSKĚ CYKLOTRASY"
java -Xmx700M -classpath /usr/share/java/saxonb.jar net.sf.saxon.Transform krnap.osm duplicity_cyklo.xsl | sed '/^$/d' | sort -k 2 | uniq -D -f1
echo "PRAŽSKÉ CYKLOTRASY"
java -Xmx700M -classpath /usr/share/java/saxonb.jar net.sf.saxon.Transform mhp.osm duplicity_cyklo.xsl | sed '/^$/d' | sort -k 2 | uniq -D -f1
