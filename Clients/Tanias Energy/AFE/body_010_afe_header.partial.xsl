<fo:block <!--%var-block-padding%-->>
  <fo:table width="100%" border-collapse="collapse" table-layout="fixed" border-bottom-style="solid" border-left-style="solid" border-top-style="solid" border-right-style="solid" border-bottom-width="1pt" border-left-width="1pt" border-right-width="1pt" border-top-width="1pt">
    <fo:table-column column-width="proportional-column-width(15.904)" column-number="1"/>
    <fo:table-column column-width="proportional-column-width(34.976)" column-number="2"/>
    <fo:table-column column-width="proportional-column-width(14.144)" column-number="3"/>
    <fo:table-column column-width="proportional-column-width(34.976)" column-number="4"/>
    <fo:table-header>
      <fo:table-row>
        <fo:table-cell <!--%var-cell-padding%-->>
          <fo:block>
            <fo:inline font-weight="bold">AFE Number:</fo:inline>
          </fo:block>
        </fo:table-cell>
        <fo:table-cell <!--%var-cell-padding%-->>
          <fo:block>
            <xsl:if test="string(/ns1:FormData/ns1:Afe/ns1:AfeNumber)">
              <xsl:value-of select="/ns1:FormData/ns1:Afe/ns1:AfeNumber"/>
            </xsl:if>&#160;
            <xsl:choose>
              <xsl:when test="contains(/ns1:FormData/ns1:Afe/ns1:VERSION_STRING, 'C')"></xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="/ns1:FormData/ns1:Afe/ns1:VERSION_STRING"/>
              </xsl:otherwise>
            </xsl:choose>
          </fo:block>
        </fo:table-cell>
        <fo:table-cell <!--%var-cell-padding%-->>
          <fo:block>
            <fo:inline font-weight="bold">Well UWI:</fo:inline>
          </fo:block>
        </fo:table-cell>
        <fo:table-cell <!--%var-cell-padding%-->>
          <fo:block>
            <xsl:value-of select="/ns1:FormData/ns1:Afe/ns1:PRIMARY_WELL/ns1:UWI"/>
          </fo:block>
        </fo:table-cell>
      </fo:table-row>
    </fo:table-header>
    <fo:table-body>
      <fo:table-row>
        <fo:table-cell <!--%var-cell-padding%-->>
          <fo:block>
            <fo:inline font-weight="bold">Cost Center:</fo:inline>
          </fo:block>
        </fo:table-cell>
        <fo:table-cell <!--%var-cell-padding%-->>
          <fo:block>
            <xsl:value-of select="/ns1:FormData/ns1:Afe/ns1:CUSTOM/ns1:COST_CENTER"/>
          </fo:block>
        </fo:table-cell>
        <fo:table-cell <!--%var-cell-padding%-->>
          <fo:block>
            <fo:inline font-weight="bold">Area:</fo:inline>
          </fo:block>
        </fo:table-cell>
        <fo:table-cell <!--%var-cell-padding%-->>
          <fo:block>
            <xsl:value-of select="/ns1:FormData/ns1:Afe/ns1:CUSTOM/ns1:AREA/ns1:VALUE"/>
          </fo:block>
        </fo:table-cell>
      </fo:table-row>
      <fo:table-row>
        <fo:table-cell <!--%var-cell-padding%-->>
          <fo:block>
            <fo:inline font-weight="bold">AFE Type:</fo:inline>
          </fo:block>
        </fo:table-cell>
        <fo:table-cell <!--%var-cell-padding%-->>
          <fo:block>
            <xsl:value-of select="/ns1:FormData/ns1:Afe/ns1:CUSTOM/ns1:AFE_TYPE/ns1:VALUE"/>
          </fo:block>
        </fo:table-cell>
        <fo:table-cell <!--%var-cell-padding%-->>
          <fo:block>
            <fo:inline font-weight="bold">Operator:</fo:inline>
          </fo:block>
        </fo:table-cell>
        <fo:table-cell <!--%var-cell-padding%-->>
          <fo:block>
            <xsl:value-of select="/ns1:FormData/ns1:Afe/ns1:OPERATING_COMPANY/ns1:COMNAME"/>
          </fo:block>
        </fo:table-cell>
      </fo:table-row>
      <fo:table-row>
        <fo:table-cell <!--%var-cell-padding%-->>
          <fo:block>
            <fo:inline font-weight="bold">Description:</fo:inline>
          </fo:block>
        </fo:table-cell>
        <fo:table-cell <!--%var-cell-padding%--> number-columns-spanned="3">
          <fo:block>
              <xsl:value-of select="/ns1:FormData/ns1:Afe/ns1:DESCRIPTION"/>
          </fo:block>
        </fo:table-cell>
      </fo:table-row>
    </fo:table-body>
  </fo:table>
</fo:block>
