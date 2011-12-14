<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" indent="no"/>

<xsl:template match="/osm">
	<xsl:apply-templates select="relation">
		<xsl:sort select="@id" data-type="number"/>
	</xsl:apply-templates>
</xsl:template>

<xsl:template match="relation[tag/@v = 'foot' or tag/@v='hiking' or tag/@v='ski' or tag/@v='horse' or tag/@v='wheelchair']">
		<xsl:text>|-&#xa;</xsl:text>

		<xsl:text>|  </xsl:text>
		<xsl:if test="tag[matches(@k, 'wikipedia$')]">
			<xsl:text>[http://en.wikipedia.org/wiki/</xsl:text>
			<xsl:value-of select="replace(tag[matches(@k, '^wikipedia:')]/@k, 'wikipedia:', '')"/>
			<xsl:value-of select="encode-for-uri(tag[matches(@k, 'wikipedia$')]/@v)"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:value-of select="tag[@k = 'ref']/@v"/>
		<xsl:if test="tag[matches(@k, 'wikipedia$')]">
			<xsl:text>]</xsl:text>
		</xsl:if>
		<xsl:text>&#xa;</xsl:text>

		<xsl:text>| </xsl:text>
		<xsl:value-of select="tag[matches(@k, '^kct_')]/@k"/>
		<xsl:text>&#xa;</xsl:text>

		<xsl:text>| </xsl:text>
		<xsl:value-of select="tag[matches(@k, '^kct_')]/@v"/>
		<xsl:text>&#xa;</xsl:text>

		<!--
		<xsl:text>| </xsl:text>
		<xsl:value-of select="tag[@k = 'osmc:symbol']/@v"/>
		<xsl:text>&#xa;</xsl:text>
-->

		<xsl:text>| </xsl:text>
		<xsl:value-of select="tag[@k = 'name']/@v"/>
		<xsl:text>&#xa;</xsl:text>

		<xsl:text>| </xsl:text>
		<xsl:value-of select="tag[@k = 'destinations']/@v"/>
		<xsl:text>&#xa;</xsl:text>

		<xsl:text>| {{Relation|</xsl:text>
		<xsl:value-of select="@id"/>
		<xsl:text>|tools=short}}&#xa;</xsl:text>

		<!--
		<xsl:text>| </xsl:text>
		<xsl:value-of select="tag[@k = 'network']/@v"/>
		<xsl:text>&#xa;</xsl:text>

		<xsl:text>| </xsl:text>
		<xsl:value-of select="count(member)"/>
		<xsl:text>&#xa;</xsl:text>
		-->

		<xsl:text>| $Length$ </xsl:text>
		<xsl:value-of select="@id"/>
		<xsl:text>&#xa;</xsl:text>

		<xsl:text>| $Segments$ </xsl:text>
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

		<xsl:text>| </xsl:text>
		<xsl:variable name="kct_color" select="replace(tag[matches(@k, '^kct_')]/@k, '^.*_', '')"/>
		<xsl:variable name="kct_type" select="tag[matches(@k, '^kct_')]/@v"/>
		<xsl:variable name="osmc_line_color" select="replace(tag[@k = 'osmc:symbol']/@v, '^([^:]*):.*$', '$1')"/>
		<xsl:variable name="osmc_background_color" select="replace(tag[@k = 'osmc:symbol']/@v, '^[^:]*:([^:]*):.*$', '$1')"/>
		<xsl:variable name="osmc_foreground_color" select="replace(tag[@k = 'osmc:symbol']/@v, '^[^:]*:[^:]*:([^:_]*)_.*$', '$1')"/>
		<xsl:variable name="osmc_symbol_type" select="replace(tag[@k = 'osmc:symbol']/@v, '^[^:]*:[^:]*:[^:_]*_(.*)$', '$1')"/>

		<xsl:choose>
			<xsl:when test="not(tag[@k = 'osmc:symbol']/@v)">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$kct_color != $osmc_line_color">
				<xsl:text>no</xsl:text>
			</xsl:when>
			<xsl:when test="$kct_color != $osmc_foreground_color">
				<xsl:text>no</xsl:text>
			</xsl:when>
			<xsl:when test="($kct_type = 'major' or $kct_type = 'yes') and ($osmc_symbol_type != 'bar' or $osmc_background_color != 'white')">
				<xsl:text>no</xsl:text>
			</xsl:when>
			<xsl:when test="$kct_type = 'local' and ($osmc_symbol_type != 'corner' and $osmc_background_color != 'white')">
				<xsl:text>no</xsl:text>
			</xsl:when>
			<xsl:when test="$kct_type = 'learning' and ($osmc_symbol_type != 'backslash' or $osmc_background_color != 'white')">
				<xsl:text>no</xsl:text>
			</xsl:when>
			<xsl:when test="$kct_type = 'ruin' and ($osmc_symbol_type != 'L' or $osmc_background_color != 'white')">
				<xsl:text>no</xsl:text>
			</xsl:when>
			<xsl:when test="$kct_type = 'peak' and ($osmc_symbol_type != 'triangle' or $osmc_background_color != 'white')">
				<xsl:text>no</xsl:text>
			</xsl:when>
			<xsl:when test="$kct_type = 'spring' and ($osmc_symbol_type != 'bowl' or $osmc_background_color != 'white')">
				<xsl:text>no</xsl:text>
			</xsl:when>
			<xsl:when test="$kct_type = 'interesting_object' and ($osmc_symbol_type != 'turned_T' or $osmc_background_color != 'white')">
				<xsl:text>no</xsl:text>
			</xsl:when>
			<xsl:when test="$kct_type = 'horse' and ($osmc_symbol_type != 'dot' or $osmc_background_color != 'white')">
				<xsl:text>no</xsl:text>
			</xsl:when>
			<xsl:when test="$kct_type = 'ski' and ($osmc_symbol_type != 'bar' or $osmc_background_color != 'orange')">
				<xsl:text>no</xsl:text>
			</xsl:when>
			<xsl:when test="$kct_type = 'wheelchair' and ($osmc_symbol_type != 'wheelchair' or $osmc_background_color != 'white')">
				<xsl:text>no</xsl:text>
			</xsl:when>
			<!--
			<xsl:when test="$kct_type = 'bicycle' and ($osmc_symbol_type != 'bar' or $osmc_background_color != 'yellow')">
				<xsl:text>no</xsl:text>
			</xsl:when>
			-->
			<xsl:otherwise>
				<xsl:text>yes</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text>&#xa;</xsl:text>

		<xsl:text>&#xa;</xsl:text>
</xsl:template>

<xsl:template match="*">
</xsl:template>

</xsl:stylesheet>
