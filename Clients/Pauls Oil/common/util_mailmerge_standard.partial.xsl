<xsl:template name="mailmerge_standard">
  <xsl:param name="text" /> <!-- Text or String to be analysed -->
	<xsl:variable name="afeNumber">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$text" />
			<xsl:with-param name="replace" select="'{AFE_NUMBER}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:AFENUMBER_DOC/ns1:AFENUMBER" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="afeDescription">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$afeNumber" />
			<xsl:with-param name="replace" select="'{AFE_DESCRIPTION}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:DESCRIPTION" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="primaryWell">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$afeDescription" />
			<xsl:with-param name="replace" select="'{PRIMARY_WELL.UWI}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:PRIMARY_WELL/ns1:UWI" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="externalJustification">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$primaryWell" />
			<xsl:with-param name="replace" select="'{EXTERNAL_JUSTIFICATION}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:EXTERNAL_JUSTIFICATION" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="internalJustification">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$externalJustification" />
			<xsl:with-param name="replace" select="'{INTERNAL_JUSTIFICATION}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:INTERNAL_JUSTIFICATION" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="startDate">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$internalJustification" />
			<xsl:with-param name="replace" select="'{START_DATE}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:START_DATE" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="endDate">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$startDate" />
			<xsl:with-param name="replace" select="'{END_DATE}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:END_DATE" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="budgetYear">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$endDate" />
			<xsl:with-param name="replace" select="'{BUDGET_YEAR}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:BUDGET_YEAR" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="totalGrossEstimate">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$budgetYear" />
			<xsl:with-param name="replace" select="'{TOTAL_GROSS_ESTIMATE}'" /> 
			<xsl:with-param name="by" select="format-number(/ns1:FormData/ns1:Afe/ns1:TOTAL_GROSS_ESTIMATE,'#,##0.00')" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="totalNetEstimate">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$totalGrossEstimate" />
			<xsl:with-param name="replace" select="'{TOTAL_NET_ESTIMATE}'" /> 
      <xsl:with-param name="by" select="format-number(/ns1:FormData/ns1:Afe/ns1:TOTAL_NET_ESTIMATE,'#,##0.00')" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="parentWI">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$totalNetEstimate" />
			<xsl:with-param name="replace" select="'{PARENT_WI}'" /> 
			<xsl:with-param name="by" select="format-number(/ns1:FormData/ns1:Afe/ns1:OUR_WI,'0.00000000')" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="parentCompanyName">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$parentWI" />
			<xsl:with-param name="replace" select="'{PARENT_COMPANY.NAME}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:PARENT_COMPANY/ns1:COMNAME" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="parentCompanyContact">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$parentCompanyName" />
			<xsl:with-param name="replace" select="'{PARENT_COMPANY.CONTACT}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:PARENT_COMPANY/ns1:CONTACT" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="parentCompanyAddress">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$parentCompanyContact" />
			<xsl:with-param name="replace" select="'{PARENT_COMPANY.ADDRESS}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:PARENT_COMPANY/ns1:STRADDRESS" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="parentCompanyCity">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$parentCompanyAddress" />
			<xsl:with-param name="replace" select="'{PARENT_COMPANY.CITY}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:PARENT_COMPANY/ns1:CITY" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="parentCompanyProvince">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$parentCompanyCity" />
			<xsl:with-param name="replace" select="'{PARENT_COMPANY.PROVINCE_STATE}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:PARENT_COMPANY/ns1:PROVINCE_STATE" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="parentCompanyPostal">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$parentCompanyProvince" />
			<xsl:with-param name="replace" select="'{PARENT_COMPANY.POSTCODE}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:PARENT_COMPANY/ns1:POSTCODE_ZIP" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="parentCompanyEmail">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$parentCompanyPostal" />
			<xsl:with-param name="replace" select="'{PARENT_COMPANY.EMAIL}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:PARENT_COMPANY/ns1:EMAIL" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="parentCompanyPhone">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$parentCompanyEmail" />
			<xsl:with-param name="replace" select="'{PARENT_COMPANY.PHONE}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:PARENT_COMPANY/ns1:PHONE" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="parentCompanyFax">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$parentCompanyPhone" />
			<xsl:with-param name="replace" select="'{PARENT_COMPANY.FAX}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:PARENT_COMPANY/ns1:FAX" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="parentCompanyCountry">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$parentCompanyFax" />
			<xsl:with-param name="replace" select="'{PARENT_COMPANY.COUNTRY}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:PARENT_COMPANY/ns1:COUNTRY" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="operatingCompanyName">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$parentCompanyCountry" />
			<xsl:with-param name="replace" select="'{OPERATING_COMPANY.NAME}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:OPERATING_COMPANY/ns1:COMNAME" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="operatingCompanyContact">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$operatingCompanyName" />
			<xsl:with-param name="replace" select="'{OPERATING_COMPANY.CONTACT}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:OPERATING_COMPANY/ns1:CONTACT" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="operatingCompanyAddress">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$operatingCompanyContact" />
			<xsl:with-param name="replace" select="'{OPERATING_COMPANY.ADDRESS}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:OPERATING_COMPANY/ns1:STRADDRESS" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="operatingCompanyCity">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$operatingCompanyAddress" />
			<xsl:with-param name="replace" select="'{OPERATING_COMPANY.CITY}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:OPERATING_COMPANY/ns1:CITY" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="operatingCompanyProvince">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$operatingCompanyCity" />
			<xsl:with-param name="replace" select="'{OPERATING_COMPANY.PROVINCE_STATE}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:OPERATING_COMPANY/ns1:PROVINCE_STATE" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="operatingCompanyPostal">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$operatingCompanyProvince" />
			<xsl:with-param name="replace" select="'{OPERATING_COMPANY.POSTCODE}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:OPERATING_COMPANY/ns1:POSTCODE_ZIP" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="operatingCompanyEmail">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$operatingCompanyPostal" />
			<xsl:with-param name="replace" select="'{OPERATING_COMPANY.EMAIL}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:OPERATING_COMPANY/ns1:EMAIL" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="operatingCompanyPhone">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$operatingCompanyEmail" />
			<xsl:with-param name="replace" select="'{OPERATING_COMPANY.PHONE}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:OPERATING_COMPANY/ns1:PHONE" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="operatingCompanyFax">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$operatingCompanyPhone" />
			<xsl:with-param name="replace" select="'{OPERATING_COMPANY.FAX}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:OPERATING_COMPANY/ns1:FAX" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="operatingCompanyCountry">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$operatingCompanyFax" />
			<xsl:with-param name="replace" select="'{OPERATING_COMPANY.COUNTRY}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:OPERATING_COMPANY/ns1:COUNTRY" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="targetCompanyName">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$operatingCompanyCountry" />
			<xsl:with-param name="replace" select="'{TARGET_COMPANY.NAME}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:TargetCompany/ns1:Company/ns1:COMNAME" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="targetCompanyContact">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$targetCompanyName" />
			<xsl:with-param name="replace" select="'{TARGET_COMPANY.CONTACT}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:TargetCompany/ns1:Company/ns1:CONTACT" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="targetCompanyAddress">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$targetCompanyContact" />
			<xsl:with-param name="replace" select="'{TARGET_COMPANY.ADDRESS}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:TargetCompany/ns1:Company/ns1:STRADDRESS" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="targetCompanyCity">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$targetCompanyAddress" />
			<xsl:with-param name="replace" select="'{TARGET_COMPANY.CITY}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:TargetCompany/ns1:Company/ns1:CITY" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="targetCompanyProvince">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$targetCompanyCity" />
			<xsl:with-param name="replace" select="'{TARGET_COMPANY.PROVINCE_STATE}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:TargetCompany/ns1:Company/ns1:PROVINCE_STATE" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="targetCompanyPostal">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$targetCompanyProvince" />
			<xsl:with-param name="replace" select="'{TARGET_COMPANY.POSTCODE}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:TargetCompany/ns1:Company/ns1:POSTCODE_ZIP" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="targetCompanyEmail">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$targetCompanyPostal" />
			<xsl:with-param name="replace" select="'{TARGET_COMPANY.EMAIL}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:TargetCompany/ns1:Company/ns1:EMAIL" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="targetCompanyPhone">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$targetCompanyEmail" />
			<xsl:with-param name="replace" select="'{TARGET_COMPANY.PHONE}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:TargetCompany/ns1:Company/ns1:PHONE" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="targetCompanyFax">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$targetCompanyPhone" />
			<xsl:with-param name="replace" select="'{TARGET_COMPANY.FAX}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:TargetCompany/ns1:Company/ns1:FAX" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="targetCompanyCountry">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$targetCompanyFax" />
			<xsl:with-param name="replace" select="'{TARGET_COMPANY.COUNTRY}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:TargetCompany/ns1:Company/ns1:COUNTRY" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="targetCompanyWI">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$targetCompanyCountry" />
			<xsl:with-param name="replace" select="'{TARGET_COMPANY.WI}'" /> 
			<xsl:with-param name="by" select="format-number(/ns1:FormData/ns1:TargetCompany/ns1:WorkingInterest, '0.00000000')" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="targetTotalNetEstimate">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$targetCompanyWI" />
			<xsl:with-param name="replace" select="'{TARGET_COMPANY.TOTAL_NET_ESTIMATE}'" /> 
			<xsl:with-param name="by" select="format-number(/ns1:FormData/ns1:TargetCompany/ns1:TotalNetEstimate, '#,##0.00')" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="newLine">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$targetTotalNetEstimate" />
			<xsl:with-param name="replace" select="'{NEWLINE}'" /> 
			<xsl:with-param name="by" select="/ns1:FormData/ns1:Afe/ns1:OPERATING_COMPANY/ns1:FAX" />
		</xsl:call-template>
	</xsl:variable>
     <xsl:variable name="tab">
		<xsl:call-template name="replaceString">
			<xsl:with-param name="text" select="$targetTotalNetEstimate" />
			<xsl:with-param name="replace" select="'{TAB}'" /> 
			<xsl:with-param name="by" select="'&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;'" />
		</xsl:call-template>
	</xsl:variable>
  <xsl:value-of select="$tab"/>
</xsl:template>

<xsl:template name="mailmerge">
  <xsl:param name="text" /> <!-- Text or String to be analysed -->
  <xsl:variable name="sub1">
    <xsl:call-template name="mailmerge_custom">
      <xsl:with-param name="text" select="$text" />
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="result">
    <xsl:call-template name="mailmerge_standard">
      <xsl:with-param name="text" select="$sub1" />
    </xsl:call-template>
  </xsl:variable>
  <xsl:value-of select="$result"/>
</xsl:template>

<xsl:template name="replaceString"> <!-- Template Name -->
  <xsl:param name="text" /> <!-- Text or String to be analysed -->
  <xsl:param name="replace" /> <!-- String to look for to be replaced IE. {afenumber} -->
  <xsl:param name="by" /> <!-- Replacement String-->
  <xsl:choose>
    <xsl:when test="contains($text, $replace)">
      <xsl:value-of select="substring-before($text,$replace)" />
      <xsl:value-of select="$by" />
      <xsl:call-template name="replaceString">
        <xsl:with-param name="text" select="substring-after($text,$replace)" />
        <xsl:with-param name="replace" select="$replace" />
        <xsl:with-param name="by" select="$by" />
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$text" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
