<xsl:template name="mailmerge_custom">
  <xsl:param name="text" /> <!-- Text or String to be analysed -->
  <xsl:variable name="sub1">
    <xsl:call-template name="replaceString">
      <xsl:with-param name="text" select="$text" />
      <xsl:with-param name="replace" select="'{WELL_NAME}'" /> 
      <xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:CUSTOM/ns1:WELL_NAME" />
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="result">
    <xsl:call-template name="replaceString">
      <xsl:with-param name="text" select="$sub1" />
      <xsl:with-param name="replace" select="'{FIELD}'" /> 
      <xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:CUSTOM/ns1:FIELD" />
    </xsl:call-template>
  </xsl:variable>
  <xsl:value-of select="$result"/>
</xsl:template>
