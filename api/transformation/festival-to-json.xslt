<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- říkáme: výstup je text (ne XML), protože generujeme JSON -->
  <xsl:output method="text" encoding="UTF-8"/>

  <!-- hlavní template = co se má stát, když zpracujeme celý dokument -->
  <xsl:template match="/festival">
{
  "id": "<xsl:value-of select="@id"/>",
  "name": "<xsl:value-of select="identity/name"/>",
  "edition": <xsl:value-of select="identity/edition"/>,
  "location": "<xsl:value-of select="identity/location"/>",
  "startDate": "<xsl:value-of select="identity/startDate"/>",
  "endDate": "<xsl:value-of select="identity/endDate"/>",
  "description": "<xsl:value-of select="identity/description"/>",
  "tickets": {
    "currency": "<xsl:value-of select="tickets/currency"/>",
    "dayPrice": <xsl:value-of select="tickets/dayPrice"/>,
    "fullPrice": <xsl:value-of select="tickets/fullPrice"/>,
    "url": "<xsl:value-of select="tickets/url"/>"
  }
}
  </xsl:template>

</xsl:stylesheet>