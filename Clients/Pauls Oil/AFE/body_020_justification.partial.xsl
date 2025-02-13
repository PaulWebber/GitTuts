<fo:block <!--%var-block-padding%--> >
  <fo:table border-collapse="collapse" width="100%" table-layout="fixed">
    <fo:table-column column-width="proportional-column-width(100)" column-number="1"/>
    <fo:table-body>
      <fo:table-row>
        <fo:table-cell border="1pt solid black" <!--%var-cell-padding%-->>
          <fo:block>
            <fo:inline font-weight="bold">Justification:</fo:inline>
          </fo:block>
        </fo:table-cell>
      </fo:table-row>
      <fo:table-row height="1in" overflow="hidden">
        <fo:table-cell border="1pt solid black" <!--%var-cell-padding%-->>
          <fo:block linefeed-treatment="preserve">
            <xsl:value-of select="/ns1:FormData/ns1:Afe/ns1:EXTERNAL_JUSTIFICATION"/>
          </fo:block>
        </fo:table-cell>
      </fo:table-row>
    </fo:table-body>
  </fo:table>
</fo:block>
