#source="http://osmxapi.hypercube.telascience.org/api/0.6/" 
#source="http://www.informationfreeway.org/api/0.6/"
#source="http://osm.bearstech.com/osmxapi/api/0.6/"

#source="http://jxapi.openstreetmap.org/xapi/api/0.6/"
#source="http://open.mapquestapi.com/xapi/api/0.6/"
source="http://www.overpass-api.de/api/xapi?"

# --------------------

# JXAPI
wget "${source}relation[operator=cz:KČT|cz:KCT|cz:kčt|cz:kct|CZ:KCT|CZ:KČT]" -O kct.osm
#wget 'http://overpass-api.de/api/interpreter?data=(relation["operator"="cz:kčt"];relation["operator"="cz:kct"];relation["operator"="cz:KČT"];relation["operator"="CZ:KCT"];relation["operator"="cz:KCT"];relation["operator"="CZ:KČT"];);out meta;way(r);out meta;node(w);out meta;' -O kct.osm

# XAPI
#wget "${source}relation[operator=cz:KČT|operator=cz:KCT|operator=cz:kčt|operator=cz:kct|operator=CZ:KCT|operator=CZ:KČT]" -O kct.osm
#wget "${source}relation[kct_red=*][kct_green=*][kct_blue=*][kct_yellow=*][kct_white=*]" -O kct.osm

#wget 'http://overpass-api.de/api/interpreter?data=(way["kct_red"];way["kct_blue"];way["kct_yellow"];way["kct_green"];way["kct_white"];way["kct_learning"]);out meta;node(w);out meta;' -O way.osm
#wget "${source}way[kct_green|kct_red|kct_blue|kct_yellow|kct_white|kct_none=*]" -O way.osm
#wget "${source}way[kct_green=*][kct_red=*][kct_blue=*][kct_yellow=*][kct_white=*][kct_none=*]" -O way.osm

echo "-------------------"
java -Xmx700M -classpath /usr/share/java/saxonb.jar net.sf.saxon.Transform kct.osm other.xsl
echo "-------------------"

java -Xmx700M -classpath /usr/share/java/saxonb.jar net.sf.saxon.Transform kct.osm turisticke_trasy.xsl | awk -f relan.awk > turist_gen.txt
#gitvimdiff turist_gen.txt

java -Xmx700M -classpath /usr/share/java/saxonb.jar net.sf.saxon.Transform kct.osm bicycle2wiki.xsl | awk -f relan.awk > cyklo_gen.txt
#gitvimdiff cyklo_gen.txt

# --------------------

# JXAPI
wget "${source}relation[operator=cz:KRNAP|cz:krnap|CZ:KRNAP]" -O krnap.osm
# XAPI
#wget "${source}relation[operator=cz:KRNAP|operator=cz:krnap|operator=CZ:KRNAP]" -O krnap.osm
java -Xmx700M -classpath /usr/share/java/saxonb.jar net.sf.saxon.Transform krnap.osm bicycle2wiki.xsl | awk -f relan.awk > krnap_gen.txt
#gitvimdiff krnap_gen.txt

# --------------------

# JXAPI
wget "${source}relation[operator=cz:MHP|cz:mhp|CZ:MHP|cz:pnk|cz:PNK|CZ:PNK]" -O mhp.osm
# XAPI
#wget "${source}relation[operator=cz:MHP|operator=cz:mhp|operator=CZ:MHP]" -O mhp.osm
java -Xmx700M -classpath /usr/share/java/saxonb.jar net.sf.saxon.Transform mhp.osm bicycle2wiki.xsl | awk -f relan.awk > mhp_gen.txt
#gitvimdiff mhp_gen.txt

# --------------------

wget "${source}relation[operator=cz:DPP]" -O dpp.osm
java -Xmx700M -classpath /usr/share/java/saxonb.jar net.sf.saxon.Transform dpp.osm dpp.xsl | awk -f relan.awk > dpp_gen.txt
#gitvimdiff dpp_gen.txt
