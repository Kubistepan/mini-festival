JSONy jsou vygenerované pomocí transformace, použitý Saxon HE 10, soubor přidaný do tools

java -jar tools\saxon-he-10.9.jar -s:data/festival.xml -xsl:api/transformation/festival-to-json.xslt -o:api/json/festival.json

java -jar tools\saxon-he-10.9.jar -s:data/festival.xml -xsl:api/transformation/venues-to-json.xslt -o:api/json/venues.json

java -jar tools\saxon-he-10.9.jar -s:data/festival.xml -xsl:api/transformation/performers-to-json.xslt -o:api/json/performers.json

java -jar tools\saxon-he-10.9.jar -s:data/festival.xml -xsl:api/transformation/events-to-json.xslt -o:api/json/events.json

java -jar tools\saxon-he-10.9.jar -s:data/festival.xml -xsl:api/transformation/events-to-json.xslt -o:api/json/events-day-2026-06-19.json day=2026-06-19

java -jar tools\saxon-he-10.9.jar -s:data/festival.xml -xsl:api/transformation/performer-by-id-to-json.xslt -o:api/json/performer-PERF-001.json id=PERF-001

java -jar tools\saxon-he-10.9.jar -s:data/festival.xml -xsl:api/transformation/venue-by-id-to-json.xslt -o:api/json/venue-VEN-001.json id=VEN-001

java -jar tools\saxon-he-10.9.jar -s:data/festival.xml -xsl:api/transformation/event-by-id-to-json.xslt -o:api/json/event-EVT-001.json id=EVT-001