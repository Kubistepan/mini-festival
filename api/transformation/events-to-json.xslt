<?xml version="1.0" encoding="UTF-8"?>

<!--
  Transformace XML → JSON
  Endpoint: GET /api/events
  Vytváří seznam všech programových položek (eventů).
-->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Výstup bude text (JSON) -->
  <xsl:output method="text" encoding="UTF-8"/>

  <!-- Hlavní šablona pro kořen <festival> -->
  <xsl:template match="/festival">

{
  "data": [

    <!-- Iterace přes všechny <event> -->
<xsl:for-each select="events/event">

    {
      "id": "<xsl:value-of select="@id"/>",
      "title": "<xsl:value-of select="title"/>",
      "type": "<xsl:value-of select="type"/>",
      "start": "<xsl:value-of select="start"/>",
      "end": "<xsl:value-of select="end"/>",
      "venueId": "<xsl:value-of select="venueId"/>"

      <!-- performerId je nepovinný → vypíšeme jen pokud existuje -->
<xsl:if test="performerId">
      , "performerId": "<xsl:value-of select="performerId"/>"
</xsl:if>

    }
    <!-- Čárka mezi položkami, ale ne za poslední -->
    <xsl:if test="position() != last()">,</xsl:if>

</xsl:for-each>

  ]
}

  </xsl:template>

</xsl:stylesheet>