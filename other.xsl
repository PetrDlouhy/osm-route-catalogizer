<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" indent="no"/>

<xsl:template match="/osm">
	<xsl:apply-templates select="relation">
		<xsl:sort select="@id" data-type="number"/>
	</xsl:apply-templates>
</xsl:template>

<xsl:template match="relation[not((tag/@v='bicycle') or (tag/@v='foot') or (tag/@v='hiking') or (tag/@v='ski') or (tag/@v='horse'))]">
		<xsl:value-of select="@id"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="tag[@k = 'ref']/@v"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="tag[@k = 'name']/@v"/>
		<xsl:text>&#xa;</xsl:text>
</xsl:template>

<xsl:template match="*">
</xsl:template>

</xsl:stylesheet>
