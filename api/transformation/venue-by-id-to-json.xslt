<?xml version="1.0" encoding="UTF-8"?>

<!--
  Transformace XML → JSON
  Endpoint: GET /api/venues/{id}
  Vstupní parametr: id (např. VEN-001)
  Výstup: detail jednoho místa (venue)
-->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text" encoding="UTF-8"/>

  <!-- Parametr, který představuje {id} z URL -->
  <xsl:param name="id"/>

  <xsl:template match="/festival">

    <!-- Vybereme venue podle atributu @id -->
<xsl:for-each select="venues/venue[@id=$id]">
{
  "id": "<xsl:value-of select="@id"/>",
  "name": "<xsl:value-of select="name"/>",
  "type": "<xsl:value-of select="type"/>",
  "capacity": <xsl:value-of select="capacity"/>,
  "address": {
    "street": "<xsl:value-of select="address/street"/>",
    "city": "<xsl:value-of select="address/city"/>",
    "postalCode": "<xsl:value-of select="address/postalCode"/>",
    "country": "<xsl:value-of select="address/country"/>"
  }
}
</xsl:for-each>

  </xsl:template>

</xsl:stylesheet>