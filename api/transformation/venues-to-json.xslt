<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Výstup bude obyčejný text. Vhodne pro JSON. -->
  <xsl:output method="text" encoding="UTF-8"/>

  <!-- Hlavní šablona.Spustí se, když kořen XML dokumentu je <festival>.-->
  <xsl:template match="/festival">

{
  "data": [

    <!--Projdeme všechny elementy <venue> uvnitř <venues>.-->   
<xsl:for-each select="venues/venue">

    {

      "id": "<xsl:value-of select="@id"/>",
      "name": "<xsl:value-of select="name"/>",
      "type": "<xsl:value-of select="type"/>",
      "capacity": <xsl:value-of select="capacity"/>

    }

    <!--
      JSON nesmí mít čárku za poslední položkou.
      position() = aktuální index v seznamu
      last() = poslední položka

      Pokud nejsme poslední položka,
      přidáme čárku.
    -->
    <xsl:if test="position() != last()">,</xsl:if>

</xsl:for-each>

  ]
}

  </xsl:template>

</xsl:stylesheet>