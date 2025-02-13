<fo:block>
  <fo:table width="100%" border-collapse="collapse" table-layout="fixed">
    <fo:table-column column-width="proportional-column-width(20)" column-number="1"/>
    <fo:table-column column-width="proportional-column-width(60)" column-number="2"/>
    <fo:table-column column-width="proportional-column-width(20)" column-number="3"/>
    <fo:table-body>
      <fo:table-row>
        <fo:table-cell padding-left="35pt">
          <fo:block>
            <fo:external-graphic src="<!--%var-header-logo%-->" content-width="2in" scaling="uniform" padding-top="15pt" />
          </fo:block>
        </fo:table-cell>
        <fo:table-cell display-align="center">
          <fo:block text-align="center" font-family="Helvetica" font-size="12pt" font-weight="bold" display-align="before"><!--%var-header-title%--></fo:block>
        </fo:table-cell>
        <fo:table-cell display-align="after">
          <fo:block>
            <fo:inline font-size="8pt" font-family="Helvetica">Printed Date:&#160;<xsl:if test="string(/ns1:FormData/ns1:GenerationTimestamp)">
                <xsl:call-template name="date:format-date">
                  <xsl:with-param name="date-time">
                    <xsl:value-of select="/ns1:FormData/ns1:GenerationTimestamp"/>
                  </xsl:with-param>
                  <xsl:with-param name="pattern">MMM d, yyyy</xsl:with-param>
                  <xsl:with-param name="lang-id">en_US</xsl:with-param>
                </xsl:call-template>
              </xsl:if>
            </fo:inline>
          </fo:block>
        </fo:table-cell>
      </fo:table-row>
    </fo:table-body>
  </fo:table>
</fo:block>
