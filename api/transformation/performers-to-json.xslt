<?xml version="1.0" encoding="UTF-8"?>

<!--
  Transformace XML → JSON
  Endpoint: GET /api/performers
  Vytváří seznam všech účinkujících ve formátu JSON.
-->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Výstup bude text (JSON), nikoliv XML -->
  <xsl:output method="text" encoding="UTF-8"/>

  <!--
    Hlavní šablona.
    Spustí se nad kořenovým elementem <festival>.
  -->
  <xsl:template match="/festival">

{
  "data": [

    <!-- Iterace přes všechny elementy <performer> -->
<xsl:for-each select="performers/performer">

    {
      "id": "<xsl:value-of select="@id"/>",
      "name": "<xsl:value-of select="name"/>",
      "type": "<xsl:value-of select="type"/>",
      "genre": "<xsl:value-of select="genre"/>",
      "country": "<xsl:value-of select="country"/>"
    }
    <!-- Přidá čárku pouze pokud nejde o poslední položku -->
    <xsl:if test="position() != last()">,</xsl:if>

</xsl:for-each>

  ]
}

  </xsl:template>

</xsl:stylesheet>