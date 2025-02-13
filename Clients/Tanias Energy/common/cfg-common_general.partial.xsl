<xsl:variable name="printDate">
  <xsl:choose>
    <xsl:when test="string(/ns1:GroupFormData/ns1:GroupInfo)">
      <xsl:copy-of select="/ns1:GroupFormData/ns1:GenerationTimestamp" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:copy-of select="/ns1:FormData/ns1:GenerationTimestamp" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>