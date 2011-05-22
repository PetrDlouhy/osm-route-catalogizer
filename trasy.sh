#source="http://osmxapi.hypercube.telascience.org/api/0.6/" 
source="http://www.informationfreeway.org/api/0.6/"
#source="http://osm.bearstech.com/osmxapi/api/0.6/"

wget "${source}relation[operator=cz:KČT|operator=cz:KCT|operator=cz:kčt|operator=cz:kct|operator=CZ:KCT|operator=CZ:KČT]" -O kct.osm

echo "-------------------"
java -Xmx700M -classpath /usr/share/java/saxonb.jar net.sf.saxon.Transform kct.osm other.xsl
echo "-------------------"

java -Xmx700M -classpath /usr/share/java/saxonb.jar net.sf.saxon.Transform kct.osm turisticke_trasy.xsl | awk -f relan.awk > turist_gen.txt
#vimdiff turist_gen.txt turist_wiki.txt
#mv turist_gen.txt turist_wiki.txt

java -Xmx700M -classpath /usr/share/java/saxonb.jar net.sf.saxon.Transform kct.osm bicycle2wiki.xsl | awk -f relan.awk > cyklo_gen.txt
#vimdiff cyklo_gen.txt cyklo_wiki.txt
#mv cyklo_gen.txt cyklo_wiki.txt

wget "${source}relation[operator=cz:KRNAP|operator=cz:krnap|operator=CZ:KRNAP]" -O krnap.osm
java -Xmx700M -classpath /usr/share/java/saxonb.jar net.sf.saxon.Transform krnap.osm bicycle2wiki.xsl | awk -f relan.awk > krnap_gen.txt
#vimdiff krnap_gen.txt krnap_wiki.txt
#mv krnap_gen.txt krnap_wiki.txt

wget "${source}relation[operator=cz:MHP|operator=cz:mhp|operator=CZ:MHP]" -O mhp.osm
java -Xmx700M -classpath /usr/share/java/saxonb.jar net.sf.saxon.Transform mhp.osm bicycle2wiki.xsl | awk -f relan.awk > mhp_gen.txt
#vimdiff mhp_gen.txt mhp_wiki.txt
#mv mhp_gen.txt mhp_wiki.txt

wget "${source}relation[operator=cz:DPP]" -O dpp.osm
java -Xmx700M -classpath /usr/share/java/saxonb.jar net.sf.saxon.Transform dpp.osm dpp.xsl | awk -f relan.awk > dpp_gen.txt
#vimdiff dpp_gen.txt dpp_wiki.txt
#mv dpp_gen.txt dpp_wiki.txt
