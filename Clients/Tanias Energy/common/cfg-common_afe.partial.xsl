<!-- Group AFE Helpers -->
<xsl:variable name="masterAfe" select="/ns1:GroupFormData/ns1:AfeList/ns1:AfeInfo/ns1:Afe[ns1:CHAIN_GUID = /ns1:GroupFormData/ns1:GroupInfo/ns1:AFE/ns1:ITEM[ns1:MASTER='true']/ns1:AFE_CHAIN_GUID]" />
<xsl:variable name="masterAfeTargetCompany" select="/ns1:GroupFormData/ns1:AfeList/ns1:AfeInfo[ns1:Afe/ns1:CHAIN_GUID = /ns1:GroupFormData/ns1:GroupInfo/ns1:AFE/ns1:ITEM[ns1:MASTER='true']/ns1:AFE_CHAIN_GUID]/ns1:TargetCompany" />

<!-- Normal AFE Helpers -->
<xsl:variable name="afe">
  <xsl:choose>
    <xsl:when test="string(/ns1:GroupFormData/ns1:GroupInfo)">
      <xsl:copy-of select="/ns1:GroupFormData/ns1:AfeList/ns1:AfeInfo/ns1:Afe[ns1:DOCUMENT_ID = /ns1:GroupFormData/ns1:CurrentAfeDocumentId]" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:copy-of select="/ns1:FormData/ns1:Afe" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>
<xsl:variable name="targetCompany">
  <xsl:choose>
    <xsl:when test="string(/ns1:GroupFormData/ns1:GroupInfo)">
      <xsl:copy-of select="(/ns1:GroupFormData/ns1:AfeList/ns1:AfeInfo/ns1:TargetCompany)[1]" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:copy-of select="/ns1:FormData/ns1:TargetCompany" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>
