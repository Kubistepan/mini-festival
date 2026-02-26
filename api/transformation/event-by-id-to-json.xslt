<?xml version="1.0" encoding="UTF-8"?>

<!--
  Transformace XML → JSON
  Endpoint: GET /api/events/{id}
  Parametr: id (např. EVT-001)
  Výstup: detail jedné programové položky
-->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text" encoding="UTF-8"/>

  <!-- Parametr představuje {id} z URL -->
  <xsl:param name="id"/>

  <xsl:template match="/festival">

    <!-- Vybereme event podle atributu @id -->
<xsl:for-each select="events/event[@id=$id]">
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
</xsl:for-each>

  </xsl:template>

</xsl:stylesheet>