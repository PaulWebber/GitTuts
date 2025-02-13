<fo:block <!--%var-block-padding%-->>
  <fo:table border-collapse="collapse" width="100%" table-layout="fixed">
    <fo:table-column column-width="proportional-column-width(40)" column-number="1"/>
    <fo:table-column column-width="proportional-column-width(15)" column-number="2"/>
    <fo:table-column column-width="proportional-column-width(15)" column-number="3"/>
    <fo:table-column column-width="proportional-column-width(15)" column-number="4"/>
    <fo:table-column column-width="proportional-column-width(15)" column-number="5"/>
    <fo:table-body border-bottom-width="1pt" border-bottom-style="solid" border-left-style="solid" border-left-width="1pt" border-right-style="solid" border-right-width="1pt" border-top-style="solid" border-top-width="1pt">
      <fo:table-row border-bottom-style="solid" border-bottom-width="1pt" height="0.132in" overflow="hidden">
        <fo:table-cell font-weight="bold" display-align="center" text-align="center" border-right-style="solid" border-right-width="1pt" <!--%var-cell-padding-thin%-->>
          <fo:block>PARTICIPANTS</fo:block>
        </fo:table-cell>
        <fo:table-cell font-weight="bold" display-align="center" text-align="center" border-right-style="solid" border-right-width="1pt" <!--%var-cell-padding-thin%-->>
          <fo:block>WI (%)</fo:block>
        </fo:table-cell>
        <fo:table-cell font-weight="bold" display-align="center" text-align="center" border-right-style="solid" border-right-width="1pt" <!--%var-cell-padding-thin%-->>
          <fo:block>ORIGINAL</fo:block>
        </fo:table-cell>
        <fo:table-cell font-weight="bold" display-align="center" text-align="center" border-right-style="solid" border-right-width="1pt" <!--%var-cell-padding-thin%-->>
          <fo:block>SUPPLEMENT</fo:block>
        </fo:table-cell>
        <fo:table-cell font-weight="bold" display-align="center" text-align="center" border-right-style="solid" border-right-width="0pt" <!--%var-cell-padding-thin%-->>
          <fo:block>TOTAL</fo:block>
        </fo:table-cell>
      </fo:table-row>
      <fo:table-row height="1in" overflow="hidden">
        <fo:table-cell number-columns-spanned="5">
          <fo:block>
            <xsl:if test="/ns1:FormData/ns1:TargetCompany/ns1:PartnersExcludingSilent/ns1:PartnerExcludingSilent">
              <fo:table width="100%" border-collapse="collapse" table-layout="fixed">
                <fo:table-column column-width="proportional-column-width(40)" column-number="1"/>
                <fo:table-column column-width="proportional-column-width(15)" column-number="2"/>
                <fo:table-column column-width="proportional-column-width(15)" column-number="3"/>
                <fo:table-column column-width="proportional-column-width(15)" column-number="4"/>
                <fo:table-column column-width="proportional-column-width(15)" column-number="5"/>
                <fo:table-body>
                  <xsl:for-each select="/ns1:FormData/ns1:TargetCompany/ns1:PartnersExcludingSilent/ns1:PartnerExcludingSilent">
                    <fo:table-row overflow="hidden">
                      <xslt:variable name="isFirst_id1248452">
                        <xslt:choose>
                          <xslt:when test="position() = 1">true</xslt:when>
                          <xslt:otherwise>false</xslt:otherwise>
                        </xslt:choose>
                      </xslt:variable>
                      <fo:table-cell <!--%var-cell-padding-thin%-->>
                        <fo:block>
                          <xsl:value-of select="ns1:Company/ns1:COMNAME"/> 
                          <xsl:if test="ns1:IsSilent = 'true'"> (SP)</xsl:if>
                        </fo:block>
                      </fo:table-cell>
                      <fo:table-cell display-align="before" text-align="center" <!--%var-cell-padding-thin%-->>
                        <fo:block>
                          <xsl:value-of select="format-number(ns1:WorkingInterest, '0.000000')"/>%
                        </fo:block>
                      </fo:table-cell>
                      <fo:table-cell display-align="before" text-align="right" <!--%var-cell-padding-thin%-->>
                        <fo:block>
                          <xsl:choose>
                            <xsl:when test="/ns1:FormData/ns1:Afe/ns1:VersionType/text() = 'Supplement'">
                              <xsl:value-of select="ns1:FormattedPreviousNetEstimate"/>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:value-of select="ns1:FormattedCurrentNetEstimate"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </fo:block>
                      </fo:table-cell>
                      <fo:table-cell display-align="before" text-align="right" <!--%var-cell-padding-thin%-->>
                        <fo:block>
                          <xsl:choose>
                            <xsl:when test="/ns1:FormData/ns1:Afe/ns1:VersionType/text() = 'Supplement'">
                              <xsl:value-of select="ns1:FormattedCurrentNetEstimate"/>
                            </xsl:when>
                            <xsl:otherwise/>
                          </xsl:choose>
                        </fo:block>
                      </fo:table-cell>
                      <fo:table-cell display-align="before" text-align="right" <!--%var-cell-padding-thin%-->>
                        <fo:block>
                          <xsl:value-of select="ns1:FormattedTotalNetEstimate"/>
                        </fo:block>
                      </fo:table-cell>
                    </fo:table-row>
                  </xsl:for-each>
                </fo:table-body>
              </fo:table>
            </xsl:if>
          </fo:block>
        </fo:table-cell>
      </fo:table-row>
      <fo:table-row border-top-style="solid" border-top-width="1pt">
        <fo:table-cell border-right-style="solid" border-right-width="1pt" <!--%var-cell-padding-thin%--> font-weight="bold" text-align="right">
          <fo:block>TOTAL ESTIMATE:</fo:block>
        </fo:table-cell>
        <fo:table-cell display-align="center" text-align="center" border-right-style="solid" border-right-width="1pt" <!--%var-cell-padding-thin%-->>
          <fo:block>100.00000%</fo:block>
        </fo:table-cell>
        <fo:table-cell display-align="before" text-align="right" border-right-style="solid" border-right-width="1pt" <!--%var-cell-padding-thin%-->>
          <fo:block>&#160;
            <xsl:choose>
              <xsl:when test="/ns1:FormData/ns1:Afe/ns1:VersionType/text() = 'Supplement'">
                <xsl:value-of select="/ns1:FormData/ns1:Afe/ns1:PreviousEstimateFormatted"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="/ns1:FormData/ns1:Afe/ns1:CurrentEstimateFormatted"/>
              </xsl:otherwise>
            </xsl:choose>
          </fo:block>
        </fo:table-cell>
        <fo:table-cell border-right-style="solid" border-right-width="1pt" <!--%var-cell-padding-thin%--> display-align="center" text-align="right">
          <fo:block>
            <xsl:choose>
              <xsl:when test="/ns1:FormData/ns1:Afe/ns1:VersionType/text() = 'Supplement'">
                <xsl:value-of select="/ns1:FormData/ns1:Afe/ns1:CurrentEstimateFormatted"/>
              </xsl:when>
              <xsl:otherwise/>
            </xsl:choose>
          </fo:block>
        </fo:table-cell>
        <fo:table-cell display-align="before" <!--%var-cell-padding-thin%--> text-align="right">
          <fo:block>
            <xsl:value-of select="/ns1:FormData/ns1:Afe/ns1:TotalEstimateFormatted"/>
          </fo:block>
        </fo:table-cell>
      </fo:table-row>
    </fo:table-body>
  </fo:table>
</fo:block>
