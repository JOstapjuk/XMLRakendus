<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="xml" indent="yes"/>

	<xsl:template match="/">
		<strong>Kõik andmed tabelina koos nimetused</strong>
		<table border="1">
			<th>Lapsevanem nimi</th>
			<th>Laps</th>
			<th>Sünnipäev</th>
			<th>Sünnikoht</th>
			<th>Vanus</th>
			<th>Lapsevanema vanus oli</th>
			<th>Count()</th>
			<th>substringEsimest()</th>
			<th>substringViimast()</th>
			<th>Starts with()</th>
			<xsl:for-each select="//inimene">
				<xsl:sort select="@saasta" order="descending"/>
				<tr>
					<td>
						<xsl:value-of select="../../nimi"/>
					</td>
					<td>
						<xsl:if test="contains(nimi, 'i')">
							<xsl:attribute name="style">background-color: yellow;</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="nimi"/>
					</td>
					<td>
						<i>
							<xsl:value-of select="@saasta"/>
						</i>
					</td>
					<td>
						<xsl:value-of select="sunnikoht"/>
					</td>
					<td>
						<xsl:value-of select="2025 - @saasta"/>
					</td>
					<td>
						<xsl:value-of select="nimi"/>
						<xsl:if test="../..">
							-lapsevanema  vanus oli
							<xsl:value-of select="../../@saasta - @saasta"/> aastat vana
						</xsl:if>
					</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</xsl:for-each>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>

				<td>
					<xsl:value-of select="count(//nimi)"/>
				</td>
				<td>
					<xsl:for-each select="//inimene">
						<xsl:value-of select="substring(nimi, 1, 3)"/> |
					</xsl:for-each>
				</td>
				<td>
					<xsl:for-each select="//inimene">
						<xsl:value-of select="substring(nimi, string-length(nimi)-2, 3)"/> |
					</xsl:for-each>
				</td>
				<td>
					<xsl:for-each select="//inimene[starts-with(nimi, 'A')]">
						<xsl:value-of select="nimi"/> |
					</xsl:for-each>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>