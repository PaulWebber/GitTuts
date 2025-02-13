<fo:block <!--%var-block-padding%-->>
  <fo:table border-collapse="collapse" border="1pt solid black" width="100%" table-layout="fixed">
    <fo:table-column column-width="proportional-column-width(10)" column-number="1"/>
    <fo:table-column column-width="proportional-column-width(40)" column-number="2"/>
    <fo:table-column column-width="proportional-column-width(10)" column-number="3"/>
    <fo:table-column column-width="proportional-column-width(40)" column-number="4"/>
    <fo:table-body>
      <fo:table-row>
        <fo:table-cell <!--%var-cell-padding%-->>
          <fo:block>
            <fo:inline font-weight="bold">Originator:</fo:inline>
          </fo:block>
        </fo:table-cell>
        <fo:table-cell <!--%var-cell-padding%-->>
          <fo:block>
            <xsl:value-of select="/ns1:FormData/ns1:Afe/ns1:OWNER/ns1:NAME"/>
          </fo:block>
        </fo:table-cell>
        <fo:table-cell <!--%var-cell-padding%-->>
          <fo:block>
            <fo:inline font-weight="bold">Partner:</fo:inline>
          </fo:block>
        </fo:table-cell>
        <fo:table-cell <!--%var-cell-padding%-->>
          <fo:block>
            <xsl:value-of select="/ns1:FormData/ns1:TargetCompany/ns1:Company/ns1:COMNAME"/>
          </fo:block>
        </fo:table-cell>
      </fo:table-row>
    </fo:table-body>
  </fo:table>
</fo:block>
