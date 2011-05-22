<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" indent="no"/>

<xsl:template match="/osm">
	<xsl:apply-templates select="relation">
		<xsl:sort select="@id" data-type="number"/>
	</xsl:apply-templates>
</xsl:template>

<xsl:template match="relation[tag/@v = 'bicycle']">
		<xsl:text>|-&#xa;</xsl:text>

		<xsl:text>|  </xsl:text>
		<xsl:text>&lt;span style="display:none"></xsl:text>
		<xsl:value-of select="string-length(replace(tag[@k = 'ref']/@v, '[^0-9]', ''))"/>
		<xsl:text>&lt;/span></xsl:text>
		<xsl:value-of select="tag[@k = 'ref']/@v"/>
		<xsl:text>&#xa;</xsl:text>

		<xsl:text>| </xsl:text>
		<xsl:value-of select="tag[@k = 'name']/@v"/>
		<xsl:text>&#xa;</xsl:text>

		<xsl:text>| {{Relation|</xsl:text>
		<xsl:value-of select="@id"/>
		<xsl:text>|tools=short}}&#xa;</xsl:text>

		<xsl:text>| $Length$ </xsl:text>
		<xsl:value-of select="@id"/>
		<xsl:text>&#xa;</xsl:text>

		<xsl:text>| $Segments$ </xsl:text>
		<xsl:value-of select="@id"/>
		<xsl:text>&#xa;</xsl:text>

		<xsl:text>| </xsl:text>
		<xsl:value-of select="tag[@k = 'network']/@v"/>
		<xsl:text>&#xa;</xsl:text>
		
		<xsl:text>| </xsl:text>
		<xsl:value-of select="tag[@k = 'complete']/@v"/>
		<xsl:text>&#xa;</xsl:text>

		<!--

		<xsl:text>| </xsl:text>
		<xsl:value-of select="count(member)"/>
		<xsl:text>&#xa;</xsl:text>

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
