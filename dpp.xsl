<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" indent="no"/>

<xsl:template match="/osm">
	<xsl:apply-templates select="relation[tag/@v = 'tram']">
		<xsl:sort select="@id" data-type="number"/>
	</xsl:apply-templates>
	<xsl:apply-templates select="relation[tag/@v='bus']">
		<xsl:sort select="@id" data-type="number"/>
	</xsl:apply-templates>
	<xsl:apply-templates select="relation[tag/@v='subway']">
		<xsl:sort select="@id" data-type="number"/>
	</xsl:apply-templates>
</xsl:template>

<xsl:template match="relation">
		<xsl:text>|-&#xa;</xsl:text>

		<xsl:text>|  </xsl:text>
		<xsl:value-of select="tag[@k = 'ref']/@v"/>
		<xsl:text>&#xa;</xsl:text>

		<xsl:text>| </xsl:text>
		<xsl:value-of select="tag[@k = 'name']/@v"/>
		<xsl:text>&#xa;</xsl:text>

		<xsl:text>| {{Relation|</xsl:text>
		<xsl:value-of select="@id"/>
		<xsl:text>|tools=short}}&#xa;</xsl:text>

		<xsl:text>| </xsl:text>
		<xsl:value-of select="tag[@k = 'network']/@v"/>
		<xsl:text>&#xa;</xsl:text>

		<!--
		<xsl:text>| </xsl:text>
		<xsl:value-of select="count(member)"/>
		<xsl:text>&#xa;</xsl:text>
		-->

		<xsl:text>| $Length$ </xsl:text>
		<xsl:value-of select="@id"/>
		<xsl:text>&#xa;</xsl:text>
		
		<xsl:text>| </xsl:text>
		<xsl:value-of select="tag[@k = 'complete']/@v"/>
		<xsl:text>&#xa;</xsl:text>

		<!--
		<xsl:text>| </xsl:text>
		<xsl:value-of select="tag[@k = 'description']/@v"/>
		<xsl:text>&#xa;</xsl:text>

		<xsl:text>| </xsl:text>
		<xsl:value-of select="tag[@k = 'source']/@v"/>
		<xsl:text>&#xa;</xsl:text>

		<xsl:text>| </xsl:text>
		<xsl:value-of select="tag[@k = 'note']/@v"/>
		<xsl:text>&#xa;</xsl:text>
		-->

		<xsl:text>&#xa;</xsl:text>
</xsl:template>

<xsl:template match="*">
</xsl:template>

</xsl:stylesheet>
