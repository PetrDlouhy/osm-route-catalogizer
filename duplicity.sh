
echo "TURISTICKÉ TRASY"
java -Xmx700M -classpath /usr/share/java/saxonb.jar net.sf.saxon.Transform output/kct.osm duplicity_turist.xsl | sed '/^$/d' | sort -k 3 | uniq -D -f2
echo "CYKLISTICKÉ TRASY"
java -Xmx700M -classpath /usr/share/java/saxonb.jar net.sf.saxon.Transform output/kct.osm duplicity_cyklo.xsl | sed '/^$/d' | sort -k 2 | uniq -D -f1
echo "KRKONOŠSKĚ CYKLOTRASY"
java -Xmx700M -classpath /usr/share/java/saxonb.jar net.sf.saxon.Transform output/krnap.osm duplicity_cyklo.xsl | sed '/^$/d' | sort -k 2 | uniq -D -f1
echo "PRAŽSKÉ CYKLOTRASY"
java -Xmx700M -classpath /usr/share/java/saxonb.jar net.sf.saxon.Transform output/mhp.osm duplicity_cyklo.xsl | sed '/^$/d' | sort -k 2 | uniq -D -f1
