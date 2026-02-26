<?xml version="1.0" encoding="UTF-8"?>

<!--
  Transformace XML → JSON
  Endpoint: GET /api/performers/{id}
  Parametr: id (např. PERF-001)
  Výstup: detail jednoho účinkujícího
-->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text" encoding="UTF-8"/>

  <!-- Parametr představuje {id} z URL -->
  <xsl:param name="id"/>

  <xsl:template match="/festival">

    <!-- Vybereme performer podle atributu @id -->
<xsl:for-each select="performers/performer[@id=$id]">
{
  "id": "<xsl:value-of select="@id"/>",
  "name": "<xsl:value-of select="name"/>",
  "type": "<xsl:value-of select="type"/>",
  "genre": "<xsl:value-of select="genre"/>",
  "country": "<xsl:value-of select="country"/>"
}
</xsl:for-each>

  </xsl:template>

</xsl:stylesheet>