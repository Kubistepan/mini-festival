<?xml version="1.0" encoding="UTF-8"?>

<!--
  Transformace XML → JSON
  Endpoint: GET /api/performers
  Podpora stránkování: page, pageSize
-->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text" encoding="UTF-8"/>

  <!-- Stránkování (default hodnoty) -->
  <xsl:param name="page" select="1"/>
  <xsl:param name="pageSize" select="10"/>

  <xsl:template match="/festival">

    <!-- Výpočet rozsahu položek -->
    <xsl:variable name="startIndex" select="(($page - 1) * $pageSize) + 1"/>
    <xsl:variable name="endIndex" select="$startIndex + $pageSize - 1"/>

{
  "data": [

    <!-- Vybereme jen položky spadající do rozsahu stránky -->
<xsl:for-each select="performers/performer[
  position() &gt;= $startIndex and
  position() &lt;= $endIndex
]">

    {
      "id": "<xsl:value-of select="@id"/>",
      "name": "<xsl:value-of select="name"/>",
      "type": "<xsl:value-of select="type"/>",
      "genre": "<xsl:value-of select="genre"/>",
      "country": "<xsl:value-of select="country"/>"
    }
    <xsl:if test="position() != last()">,</xsl:if>

</xsl:for-each>

  ],
  "paging": {
    "page": <xsl:value-of select="$page"/>,
    "pageSize": <xsl:value-of select="$pageSize"/>
  }
}

  </xsl:template>

</xsl:stylesheet>