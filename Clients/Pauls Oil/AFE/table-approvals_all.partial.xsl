<fo:block>
  <fo:table border-collapse="collapse" width="100%" table-layout="fixed">
    <fo:table-column column-width="proportional-column-width(100)" column-number="1"/>
    <fo:table-body>
      <fo:table-row height="1.84in" overflow="hidden">
        <fo:table-cell border="1pt solid black">

          <fo:block>
            <fo:table width="100%" border-collapse="collapse" table-layout="fixed">
              <fo:table-column column-width="proportional-column-width(41)" column-number="1"/>
              <fo:table-column column-width="proportional-column-width(41)" column-number="2"/>
              <fo:table-column column-width="proportional-column-width(18)" column-number="3"/>
              <fo:table-body>
                <fo:table-row>
                  <fo:table-cell <!--%var-cell-padding%-->>
                    <fo:block>
                      <fo:inline font-size="10pt" font-weight="bold">APPROVAL:</fo:inline>
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell>
                    <fo:block>&#160;</fo:block>
                  </fo:table-cell>
                  <fo:table-cell>
                    <fo:block>&#160;</fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row overflow="hidden">
                  <fo:table-cell <!--%var-cell-padding%-->>
                    <fo:block>
                      <fo:inline font-weight="bold" text-decoration="underline">POSITION</fo:inline>
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell font-weight="bold" text-decoration="underline" <!--%var-cell-padding%-->>
                    <fo:block>NAME</fo:block>
                  </fo:table-cell>
                  <fo:table-cell <!--%var-cell-padding%-->>
                    <fo:block>
                      <fo:inline font-weight="bold" text-decoration="underline">DATE</fo:inline>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>

            <xsl:for-each select="/ns1:FormData/ns1:Afe/ns1:Approvals/ns1:Approval">
          <!-- Set sort Approval Order when over 10 tiers used --> 
            <xsl:sort select="ns1:ApprovalTier" data-type="number"/>
			
	            <fo:table-row overflow="hidden">
                    <xslt:variable name="isFirst_id1248533">
                      <xslt:choose>
                        <xslt:when test="position() = 1">true</xslt:when>
                        <xslt:otherwise>false</xslt:otherwise>
                      </xslt:choose>
                    </xslt:variable>
                    <fo:table-cell padding-top="0pt" padding-left="2pt" padding-right="2pt" padding-bottom="0pt">
                      <fo:block>
                        <xsl:value-of select="ns1:PositionName"/>
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-top="0pt" padding-left="2pt" padding-right="2pt" padding-bottom="0pt">
                      <fo:block>
                        <xsl:value-of select="ns1:User/ns1:NAME"/>
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-top="0pt" padding-left="2pt" padding-right="2pt" padding-bottom="0pt">
                      <fo:block>
                        <xsl:if test="string(ns1:Date)">
                          <xsl:call-template name="date:format-date">
                            <xsl:with-param name="date-time">
                              <xsl:value-of select="ns1:Date"/>
                            </xsl:with-param>
                            <xsl:with-param name="pattern">MMM d, yyyy</xsl:with-param>
                            <xsl:with-param name="lang-id">en_US</xsl:with-param>
                          </xsl:call-template>
                        </xsl:if>
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </xsl:for-each>
              </fo:table-body>
            </fo:table>
          </fo:block>

        </fo:table-cell>
      </fo:table-row>
    </fo:table-body>
  </fo:table>
</fo:block>
