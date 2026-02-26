<?xml version="1.0" encoding="UTF-8"?>

<!--
  Transformace XML → JSON
  Endpoint: GET /api/events
  Podporované filtry (query parametry):
    - day (YYYY-MM-DD) filtruje podle začátku eventu
    - venueId
    - performerId
  Pozn.: Pokud parametr není zadán (prázdný), filtr se neaplikuje.
-->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text" encoding="UTF-8"/>

  <!-- Query parametry (default = prázdný string = bez filtru) -->
  <xsl:param name="day" select="''"/>
  <xsl:param name="venueId" select="''"/>
  <xsl:param name="performerId" select="''"/>

  <xsl:template match="/festival">

{
  "data": [

    <!--
      Procházíme všechny eventy, ale každý propustíme jen pokud projde filtry.
      Filtry jsou napsané tak, že:
        (parametr je prázdný) OR (event odpovídá parametru)
    -->
<xsl:for-each select="events/event[
  ($day = '' or starts-with(start, $day)) and
  ($venueId = '' or venueId = $venueId) and
  ($performerId = '' or performerId = $performerId)
]">

    {
      "id": "<xsl:value-of select="@id"/>",
      "title": "<xsl:value-of select="title"/>",
      "type": "<xsl:value-of select="type"/>",
      "start": "<xsl:value-of select="start"/>",
      "end": "<xsl:value-of select="end"/>",
      "venueId": "<xsl:value-of select="venueId"/>"
<xsl:if test="performerId">
      , "performerId": "<xsl:value-of select="performerId"/>"
</xsl:if>
    }
    <xsl:if test="position() != last()">,</xsl:if>

</xsl:for-each>

  ]
}

  </xsl:template>

</xsl:stylesheet>