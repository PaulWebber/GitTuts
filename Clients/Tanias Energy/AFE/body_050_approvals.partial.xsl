<fo:block keep-together.within-column="always" <!--%var-block-padding%-->>
<!--Keeptogether will stop the Approval grid from breaking across pages.
If the number of Approvers/tiers exceeds the page length, remove keep-together.within-column="always" -->

  <fo:table border-collapse="collapse" width="100%" table-layout="fixed">
    <fo:table-column column-width="proportional-column-width(60)" column-number="1"/>
    <fo:table-column column-width="proportional-column-width(40)" column-number="2"/>
    <fo:table-body>
      <fo:table-row>
        <fo:table-cell padding="0">
          <!--%table-approvals%-->
        </fo:table-cell>
        <fo:table-cell padding="0" padding-left="5pt">
          <!--%table-signatures%-->
        </fo:table-cell>
      </fo:table-row>
    </fo:table-body>
  </fo:table>
</fo:block>
