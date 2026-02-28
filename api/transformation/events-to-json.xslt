<?xml version="1.0" encoding="UTF-8"?>

<!--
  Transformace XML → JSON
  Endpoint: GET /api/events

  Filtry (query parametry):
    - day (YYYY-MM-DD)
    - venueId
    - performerId

  Stránkování:
    - page (1..)
    - pageSize (1..)
  Pozn.: Pokud page/pageSize není zadáno, použijí se defaulty.
-->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text" encoding="UTF-8"/>

  <!-- Filtry -->
  <xsl:param name="day" select="''"/>
  <xsl:param name="venueId" select="''"/>
  <xsl:param name="performerId" select="''"/>

  <!-- Stránkování (defaulty) -->
  <xsl:param name="page" select="1"/>
  <xsl:param name="pageSize" select="10"/>

  <xsl:template match="/festival">

    <!-- Výpočet indexů pro stránkování (XSLT 1.0: proměnné jsou immutable) -->
    <xsl:variable name="startIndex" select="(($page - 1) * $pageSize) + 1"/>
    <xsl:variable name="endIndex" select="$startIndex + $pageSize - 1"/>

{
  "data": [

    <!--
      1) Nejdřív vyfiltrujeme eventy podle query parametrů.
      2) Pak vybereme jen ty, které spadají do rozsahu position() pro stránku.
    -->
<xsl:for-each select="events/event[
  ($day = '' or starts-with(start, $day)) and
  ($venueId = '' or venueId = $venueId) and
  ($performerId = '' or performerId = $performerId)
][position() &gt;= $startIndex and position() &lt;= $endIndex]">

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

  ],
  "paging": {
    "page": <xsl:value-of select="$page"/>,
    "pageSize": <xsl:value-of select="$pageSize"/>
  }
}

  </xsl:template>

</xsl:stylesheet>